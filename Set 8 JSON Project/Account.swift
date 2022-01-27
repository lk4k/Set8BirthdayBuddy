//
//  Account.swift
//  Set 8 JSON Project
//
//  Created by Inbal David (student LM) on 1/13/22.
//

import Foundation

//Name: Account
//Description: This class will provide the implementation for an account. An account has a username and will be used to organize the birthdays
//Parameters: username - the name of the user
struct Account : Identifiable {
    var userName : String
    let id = UUID()
    
    init(userName : String = "Please Enter Name") {
        self.userName = userName
    }
}

