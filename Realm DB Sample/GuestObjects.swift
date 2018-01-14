//
//  GuestObjects.swift
//  Realm DB Sample
//
//  Created by test on 14/01/18.
//  Copyright © 2018 CRS Technologies India Pvt Ltd. All rights reserved.
//

import Foundation

struct PostData: Encodable {
    let username:String?
    let password:String?
}

struct GuestDetail: Decodable{
    let guest_details:GetData?
}

struct GetData: Decodable {
    let guest_name:String?
    let guest_id:String?
    let guest_email: String?
    let guest_phone:String?
}
