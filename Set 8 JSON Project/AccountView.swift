//
//  AccountView.swift
//  Set 8 JSON Project
//
//  Created by Claire Wang (student LM) on 1/13/22.
//

import SwiftUI

//Name : Account View
//Description : This struct is where the user inputs the birthday information for each profile
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
                .foregroundColor(.white)
            
            //This is a date picker that assigns the user's date to the variable birthdate.
            DatePicker("Enter your birthday", selection: $birthdate)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
                .background(Color.init(red: 2, green: 1, blue: 0))
            
            
            Button(action: {
                
                //This alters birthdate.description into the correct format needed to use DateFormatter.
                let dateString = "\(birthdate.description.replacingOccurrences(of: "+0000", with: ""))UTC"
                
                //The DateFormatter disects the dateString and assigns the dates as strings to their respective variables
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
                
                //This line of code sends the parameters to the fetchData object
                self.fetchData.parseData(month: month, day: day)
                //This sets the variable showSheet to true to allow the screen to display the correct information
                self.showSheet = true
                
                
            }, label: {
                Text("Find your Best Buddies!")
            }).background(Color.init(red: 0.5, green: 0.5, blue: 0.5))
            
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
