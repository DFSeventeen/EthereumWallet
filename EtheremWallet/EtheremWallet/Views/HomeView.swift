//
//  HomeView.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/17.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
        
                NavigationLink {
                    MessariListView()
                        .navigationBarTitle("News")
                } label: {
                    Text("Explore BlockChain").frame(width: 200, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding().background(Color.blue).foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                Spacer()
                
                NavigationLink {
                    ImportIdentityView()
                        .navigationBarTitle("Import Identity")
                } label: {
                    Text("Import Your Own Identities").frame(width: 200, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding().background(Color.blue).foregroundColor(.white)
                        .cornerRadius(15)
                }
                Spacer()
            }
        }.navigationBarTitle(Text("Etherem Wallet"), displayMode: .inline)
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
