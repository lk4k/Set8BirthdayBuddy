//
//  ContentView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var accounts : [Account] = [
        Account(userName: "Bob"),
        Account(userName: "Jen"),
        Account(userName: "Nate"),
        Account(userName: "Hannah")
    ]

    
    
    var body: some View {
        NavigationView {
            List(accounts.indices){
                index in
                NavigationLink(
                    destination: AccountView(),
                    label: {
                        AccountTopView()
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
