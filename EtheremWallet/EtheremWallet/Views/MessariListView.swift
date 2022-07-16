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
        NavigationView(content: {
            VStack {
                if viewModel.messariNewsArray.isEmpty {
                    ActivityIndicator()
                } else {
                    List(viewModel.messariNewsArray, id: \.self) { source in
//                        NavigationLink(
//                            destination:
//                                .navigationBarTitle(Text(source.name)),
//                            label: {
//                                Text(source.name)
//                            }
//                        )
                                    
                        Text(source.title)

                    }
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                }
            }
            .onAppear {
                self.viewModel.getSources()
            }
        })
    }
}
