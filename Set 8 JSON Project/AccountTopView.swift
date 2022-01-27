//
//  AccountTopView.swift
//  Set 8 JSON Project
//
//  Created by Ella Kesler (student LM) on 1/13/22.
//

import SwiftUI

struct AccountTopView: View {
   
    @State private var account = Account()
    
    var body: some View {
            HStack{
                //allows the user to type int their name
                TextField("username", text: $account.userName)
            }
    }
    
}


struct AccountTopView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTopView()
    }
}
