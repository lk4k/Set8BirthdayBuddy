//
//  BirthdayBuddyView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI
import struct Kingfisher.KFImage


struct BirthdayBuddyView: View {
    var year: String
    var month : String
    var day: String
    
    
    
    var body: some View {
        
        let fetchData : FetchData = FetchData(month: month, day: day)

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
    }
}

struct BirthdayBuddyView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayBuddyView(year: "2004", month: "12", day: "28")
    }
}
