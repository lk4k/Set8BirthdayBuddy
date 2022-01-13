//
//  AccountTopView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI

struct AccountTopView: View {
   
    var account = Account()
    
    var body: some View {
            HStack{
                Text(account.userName)
            }
            
        
    }
}


struct AccountTopView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTopView()
    }
}
