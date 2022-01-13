//
//  AccountView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI
import struct Kingfisher.KFImage

struct AccountView: View {
    //Creates an instance of an account to use when called by contentview
    @Binding var account : Account
    //Creates an instance of fetchData, which will be used to pull the information parsed from the API
   // FIGURE OUT HOW TO CONNECT NUMBER OF DAY AND MONTH FROM ACCOUNT TO THE NUMBERS USED TO PARSE DATA
    @StateObject var fetchData = FetchData(month: "01", day: "13")
    
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
                        List(fetchData.responses.births) {
                            birth in
                            HStack{
                                VStack{
                                    //Displays the name of the notable person
                                    Text(birth.text ?? "")
                                    
                                    //Displays the age of the notable person
                                    Text("\(2022 - (birth.year ?? 2022))")
                                }
                                
                                //List displays a photo of the notable person
                                KFImage(birth.pages[0].thumbnail.source ?? URL(string :"https://cdn.mos.cms.futurecdn.net/PuXipAW3AXUzUJ4uYyxPKC-1200-80.jpg"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 50, alignment: .center)
                                
                                
                            }
                            
                        }
                    }}, label: {
                        Text("Find your Birthday Buddies!")
                    })
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(account: Binding.constant(Account()))
    }
}
