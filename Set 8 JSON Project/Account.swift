//
//  Account.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/13/22.
//

import Foundation

enum Month: String, CaseIterable, Identifiable{
    case Jan = "01"
    case Feb = "02"
    case Mar = "03"
    case Apr = "04"
    case May = "05"
    case Jun = "06"
    case Jul = "07"
    case Aug = "08"
    case Sept = "09"
    case Oct = "10"
    case Nov = "11"
    case Dec = "12"
    
    var id : String{self.rawValue}
}

enum Day: String, CaseIterable, Identifiable{
    case d1 = "01"
    case d2 = "02"
    case d3 = "03"
    case d4 = "04"
    case d5 = "05"
    case d6 = "06"
    case d7 = "07"
    case d8 = "08"
    case d9 = "09"
    case d10 = "10"
    case d11 = "11"
    case d12 = "12"
    case d13 = "13"
    case d14 = "14"
    case d15 = "15"
    case d16 = "16"
    case d17 = "17"
    case d18 = "18"
    case d19 = "19"
    case d20 = "20"
    case d21 = "21"
    case d22 = "22"
    case d23 = "23"
    case d24 = "24"
    case d25 = "25"
    case d26 = "26"
    case d27 = "27"
    case d28 = "28"
    case d29 = "29"
    case d30 = "30"
    case d31 = "31"

    
    var id : String{self.rawValue}
}

struct Account : Identifiable {
    var month : Month = Month.Jan
    var day : Day = Day.d1
    var userName : String
    let id = UUID()
    
    init(month : Month = Month.Jan, day : Day = Day.d1, userName : String = "Please Enter Name") {
        self.month = month
        self.day = day
        self.userName = userName
    }
}

