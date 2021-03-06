//
//  BirthdayBuddyView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI
import struct Kingfisher.KFImage


struct BirthdayBuddyView: View {
    
    @ObservedObject var fetchData : FetchData
    
    var body: some View {
        
        //list of responses from parsed JSON information given the user's birthday
        List(fetchData.responses.births) {
            birth in
            HStack{
                VStack{
                    //Displays the name of the notable person
                    Text("Name: \(birth.text ?? "")").foregroundColor(.white)
                    
                    //Displays the age of the notable person
                    Text("Age: \(2022 - (birth.year ?? 2022))").background(Color.init(red: 217/255, green: 210/255, blue: 233/255)).foregroundColor(.white)
                }
                
                //List displays a photo of the notable person
                KFImage(URL(string: birth.pages[0]?.thumbnail?.source ?? "") ?? URL(string :"https://cdn.mos.cms.futurecdn.net/PuXipAW3AXUzUJ4uYyxPKC-1200-80.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 50, alignment: .center)
                    .cornerRadius(10.0)
            }.background(Color.init(red: 217/255, green: 210/255, blue: 233/255))
            .cornerRadius(5.0)
            
        }
    }
}

struct BirthdayBuddyView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayBuddyView(fetchData: FetchData())
    }
}
