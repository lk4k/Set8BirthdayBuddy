//
//  ContentView.swift
//  Set 8 JSON Project
//
//  Created by Megan Murray (student LM) on 1/4/22.
//

import SwiftUI

struct ContentView: View {
    
    //Creates 5 avaliable slots for birthday accounts
    @State var accounts : [Account] = [
        Account(),
        Account(),
        Account(),
        Account(),
        Account(),
        Account(),
        Account(),
        Account(),
        Account(),
        Account()
    ]
    
    
    
    var body: some View {
        //Leads to the view that will prompt the user to enter their birthday information
        NavigationView {
            List(accounts.indices){
                index in
                NavigationLink(
                    destination: AccountView(),
                    label: {
                        AccountTopView()
                    }).background(Color.init(red: 234/255, green: 171/255, blue: 188/255))
                    .cornerRadius(10.0)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
