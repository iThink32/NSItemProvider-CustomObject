//
//  MenuItemModel.swift
//  SampleAppCustomui
//
//  Created by N.A Shashank on 23/10/18.
//  Copyright © 2018 Razorpay. All rights reserved.
//

import UIKit
import MobileCoreServices

final class MenuItemModel:NSObject,NSItemProviderWriting,NSItemProviderReading,Codable {
    let title:String
    let userInfo:UserInfo
    let paymentType:PaymentType
    
    init(title:String,userInfo:UserInfo,paymentType:PaymentType = PaymentType.makePayment) {
        self.title = title
        self.userInfo = userInfo
        self.paymentType = paymentType
    }
    
    static var writableTypeIdentifiersForItemProvider: [String]{
        return [(kUTTypeData as String)]
    }
    
    static var readableTypeIdentifiersForItemProvider: [String]{
        return [(kUTTypeData as String)]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let progress = Progress(totalUnitCount: 100)
        do {
            let data = try JSONEncoder().encode(self)
            progress.completedUnitCount = 100
            completionHandler(data,nil)
        }
        catch {
            completionHandler(nil,error)
        }
        return progress
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> MenuItemModel {
        do {
            let subject = try JSONDecoder().decode(MenuItemModel.self, from: data)
            return subject
        }
        catch{
            fatalError("\(error.localizedDescription)")
        }
    }
    
}

class UserInfo:Codable {
    
    var strAmount:String?
    var strCurrency:String?
    var strEmail:String?
    var strContact:String?
    var strMethod:String?
    var strCardName:String?
    var strCardNumber:String?
    var strCardExpiryMonth:String?
    var strCardExpiryYear:String?
    var strCardCVV:String?
    var strEMIDuration:String?
    var shouldDisplayLogo:Bool?
    var strWallet:String?
    var strBank:String?
    var subscriptionID:String?
    var accountID:String?
    var upi:String?
    
    enum CodingKeys:String,CodingKey {
        
        case strAmount = "amount"
        case strCurrency = "currency"
        case strEmail = "email"
        case strContact = "contact"
        case strMethod = "method"
        case strCardName = "card[name]"
        case strCardNumber = "card[number]"
        case strCardExpiryMonth = "card[expiry_month]"
        case strCardExpiryYear = "card[expiry_year]"
        case strCardCVV = "card[cvv]"
        case strEMIDuration = "emi_duration"
        case shouldDisplayLogo = "display_logo"
        case strWallet = "wallet"
        case strBank = "bank"
        case subscriptionID = "subscription_id"
        case accountID = "account_id"
        case upi = "vpa"
    }
    
    func initializeWith<T>(keyPath:ReferenceWritableKeyPath<UserInfo,T>,value:T) {
        self[keyPath:keyPath] = value
    }
    
}
