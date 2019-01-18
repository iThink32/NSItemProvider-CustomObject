//
//  Codable+Additions.swift
//
//  Created by N.A Shashank on 18/01/19.
//

import UIKit

extension Decodable {
   
   init?(dict:[String:Any]) {
       guard let data = try? JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted), let decodable = try?  JSONDecoder().decode(Self.self, from: data) else{
          return nil
       }
       self = decodable
   }
   
}

extension Encodable {
    
    func dictionary() -> [AnyHashable:Any]? {
        guard let data = try? JSONEncoder().encode(self),let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [AnyHashable:Any] else{
            return nil
        }
        return dict
    }
    
}
