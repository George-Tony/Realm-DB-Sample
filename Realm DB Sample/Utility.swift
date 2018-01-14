//
//  Utility.swift
//  Realm DB Sample
//
//  Created by test on 14/01/18.
//  Copyright © 2018 CRS Technologies India Pvt Ltd. All rights reserved.
//

import Foundation
class Utility {
    
    func sumbitDataToServer(jsonData: Data, submitUrl: URL, content: String, completion: @escaping (Bool,Data)-> ()){
        var request = URLRequest(url: submitUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        //print("data passed to server = \(jsonData)")
        var returnData = Data()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error!)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response!)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("\(content) = \(responseString!)")
            returnData =  data
            completion(true, returnData)
            
        }
        task.resume()
        
    }
    
    
}
