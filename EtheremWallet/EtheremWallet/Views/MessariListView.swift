//
//  MessariListView.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/17.
//

import SwiftUI

struct MessariListView : View {
    @ObservedObject var viewModel = MessariNewsViewModel()
    
    var body: some View {
            VStack {
                if viewModel.messariNewsArray.isEmpty {
                    ActivityIndicator()
                        .frame(width: UIScreen.main.bounds.width,
                               height: 50,
                               alignment: .center)
                } else {
                    List(viewModel.messariNewsArray, id: \.self) { source in
                        NavigationLink {
                            WebView(url: URL(string: source.url) ?? URL(string: "https://messari.io")!)
                                .navigationBarTitle(Text(source.title), displayMode: .inline)
                            
                        } label: {
                            Text(source.title)
                                .frame(height: 44, alignment: .leading)
                                .foregroundColor(.gray)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                }
                Spacer()
            }
            .onAppear {
                self.viewModel.getSources()
            }
    }
}
