//
//  Strings.swift
//  PopMeals
//
//  Created by Muhammad Zeeshan on 18/10/2022.
//

import Foundation

struct Strings {
    
    struct Common {
        static var appName = "Pop Meals"
        
        static var myAccount = "My Account"
        static var myProfile = "My Profile"
        static var myAddresses = "My Addresses"

        
        static var orderNumber = "Order number"
        static var arrivesAt = "Arrives at"
        static var paidWith = "Paid with"
        static var status = "Status"
    }
    
    struct Button {
        static var logout = "Log Out"
    }
    
    struct Status {
        static var delivered = "Delivered"
        static var cancelled = "Cancelled"
        static var confirmed = "Confirmed"
    }
    
    struct Error {
        static var decoding = "Error decoding: "
        static var ohNo = "Oh no! What happened?"
        static var request = "Request error: "
        static var missingurl = "Missing URL"
    }
}
