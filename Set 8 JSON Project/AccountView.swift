//
//  AccountView.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import SwiftUI

struct AccountView: View {
    @Binding var account : Account
    
    var body: some View {
        VStack{
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(month: Binding.constant(Account(month: 01, day: 13))
    }
}
