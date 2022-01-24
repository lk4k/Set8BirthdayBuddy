//
//  AccountView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI

struct AccountView: View {
    @State private var birthdate = Date()
    
    var body: some View {
        
        VStack{
            Text("Enter Your Birthday")
                .font(.largeTitle)
            DatePicker("Enter your birthday", selection: $birthdate)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
            
            Button(action: {
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
                
                
                NavigationView{
                    
                   
                    NavigationLink(
                        destination:  BirthdayBuddyView(fetchData: FetchData(month: month, day: day)),
                        label: {
                            Text("Results")
                        })
                }
                
            }, label: {
                Text("Find your Best Buddies!")
            })
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
