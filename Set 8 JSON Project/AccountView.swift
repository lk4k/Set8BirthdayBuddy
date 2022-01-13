//
//  AccountView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI

struct AccountView: View {
    //Creates an instance of an account to use when called by contentview
    @Binding var account : Account
    //Creates an instance of fetchData, which will be used to pull the information parsed from the API
    
    var body: some View {
        
        VStack{
            //User selects month of their birth
            Picker(selection: $account.day, label: Text("Day"), content: {
                ForEach(Day.allCases){day in
                    Text(day.rawValue)
                }
            })
            
            //User selects day of the their birth
            Picker(selection: $account.month, label: Text("Month"), content: {
                ForEach(Month.allCases){month in
                    Text(month.rawValue)
                }
            })
            
            
                
            //User presses to go to the list of notable people born on the same day as them
            Button(action: {
                    //Links the button to a view of the list
                    NavigationView{
                        BirthdayBuddyView(fetchData: FetchData(month: account.month.rawValue, day: account.day.rawValue))
                    }}, label: {
                        Text("Find your Birthday Buddies!")
                    })
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(account: Binding.constant(Account(userName: "Bob")))
    }
}
