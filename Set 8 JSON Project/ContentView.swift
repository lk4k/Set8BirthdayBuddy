//
//  ContentView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/4/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var accounts : [Account] = [
        Account(month: Month.Jan, day: Day.d1, userName: "Bob"),
        Account(month: Month.Feb, day: Day.d2, userName: "Jen"),
        Account(month: Month.Mar, day: Day.d3, userName: "Nate"),
        Account(month: Month.Apr, day: Day.d4, userName: "Hannah")
    ]
    
    //    destination: AccountView(account: self.$accounts[index], fetchData: FetchData(month: "01", day: "13"),
    
    
    var body: some View {
        NavigationView {
            List(accounts.indices){
                index in
                NavigationLink(
                    destination: AccountView(account: self.$accounts[index]),
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
