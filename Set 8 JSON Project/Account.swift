//
//  Account.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import Foundation

struct Account : Identifiable {
    var userName : String
    let id = UUID()
    
    init(userName : String = "Please Enter Name") {
        self.userName = userName
    }
}

