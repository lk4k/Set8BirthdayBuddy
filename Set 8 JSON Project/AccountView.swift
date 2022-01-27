//
//  AccountView.swift
//  Set 8 JSON Project
//
//  Created by Claire Wang (student LM) on 1/13/22.
//

import SwiftUI

struct AccountView: View {
    @State private var birthdate = Date()
    @State private var showSheet = false
    @State private var month : String = "00"
    @State private var day : String = "00"
    @ObservedObject var fetchData : FetchData = FetchData()
    
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
                self.month = formatter.string(from: date)
                formatter.dateFormat = "dd"
                self.day = formatter.string(from: date)
                print("date \(year) \(self.month) \(self.day)")
                
                self.fetchData.parseData(month: month, day: day)
                self.showSheet = true
                
                
            }, label: {
                Text("Find your Best Buddies!")
            })
            
        }.sheet(isPresented: $showSheet, content: {
            BirthdayBuddyView(fetchData: fetchData)
        })
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
