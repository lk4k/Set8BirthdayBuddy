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
    @State private var birthdate = Date()
    
    var body: some View {
        
        VStack{
            Text("Enter Your Birthday")
                .font(.largeTitle)
            DatePicker("Enter your birthday", selection: $birthdate)
            .datePickerStyle(GraphicalDatePickerStyle())
            .frame(maxHeight: 400)
        
            Button {
                //print(birthdate.description)
                let dateString = "\(birthdate.description.replacingOccurrences(of: "+0000", with: ""))UTC"
                
                //2018-12-24 18:00:00 UTC
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
                guard let date = formatter.date(from: dateString) else {return}
                
                formatter.dateFormat = "yyyy"
                let year = formatter.string(from: date)
                formatter.dateFormat = "MM"
                let month = formatter.string(from: date)
                formatter.dateFormat = "dd"
                let day = formatter.string(from: date)
                print("date \(year) \(month) \(day)")
            } label: {
                Text("Click Me")
            }
            
            
            //            Text("Your Birthday is \(birthdate.description)")
            //
            //            //User presses to go to the list of notable people born on the same day as them
            //            Button(action: {
            //                    //Links the button to a view of the list
            //                    let dateString = birthdate.description
            //                    let formatter = DateFormatter()
            //                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
            //                    guard let date = formatter.date(from: dateString) else {
            //                        return
            //                    }
            //
            //                    formatter.dateFormat = "yyyy"
            //                    let year = formatter.string(from: date)
            //                    formatter.dateFormat = "MM"
            //                    let month = formatter.string(from: date)
            //                    formatter.dateFormat = "dd"
            //                    let day = formatter.string(from: date)
            //                    print("button clicked")
            //                    print(year, month, day) // 2018 12 24
            //
            //                    NavigationView{
            //                        NavigationLink(
            //                            destination:  BirthdayBuddyView(year: year, month: month, day: day),
            //                            label: {
            //                                Text("Results")
            //                            })
            //
            //                    }}, label: {
            //                        Text("Find your Birthday Buddies!")
            //                    })
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(account: Binding.constant(Account(userName: "Bob")))
    }
}
