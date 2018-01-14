//
//  RealmObjects.swift
//  Realm DB Sample
//
//  Created by test on 14/01/18.
//  Copyright © 2018 CRS Technologies India Pvt Ltd. All rights reserved.
//

import Foundation
import RealmSwift

class Guest: Object {
    @objc dynamic var guestName: String? = nil
    @objc dynamic var guestEmailID: String? = nil
    @objc dynamic var guestID: String? = nil
    @objc dynamic var guestPhone: String? = nil
    
    override static func primaryKey() -> String? {
        return "guestID"
    }
    // to use integer
    var age = RealmOptional<Int>()
}

extension Guest{
    func writeToRealm(){
        try! guestObject.write{
            guestObject.add(self)
        }
    }
    
}
