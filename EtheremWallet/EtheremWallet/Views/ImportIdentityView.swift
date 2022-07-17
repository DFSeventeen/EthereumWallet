//
//  ImportIdentityView.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/17.
//

import SwiftUI
import Security

struct ImportIdentityView: View {
    @State private var identity : String = ""
    
    var body: some View {
        VStack{
            TextField("Input or paste you identity key", text: $identity)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 50)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .onChange(of: identity) { newValue in
                    
                }
            Spacer().frame(height: 40)
            
            Button(action: {
                print(identity)
                storeIdInKeyChain()
                // call some API to check the identity
            }) {
                Text("Confirm")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 44, alignment: .center)
                    .lineLimit(nil)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    
                
            }
        }
        
    }
    

    func storeIdInKeyChain () {

    }
    
}

struct ImportIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        ImportIdentityView()
    }
}
