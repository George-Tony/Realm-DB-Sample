//
//  ViewController.swift
//  Realm DB Sample
//
//  Created by test on 14/01/18.
//  Copyright © 2018 CRS Technologies India Pvt Ltd. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let username = "georgegtony@gmail.com"
    let password = "12345"
    
    func getData(){
        //if(username != nil && password != nil){
            let jsonBody = self.encodeJSON(username: username, password: password)
            let submitURl = URL(string: Config.init().loginURL)!
            
            Utility().sumbitDataToServer(jsonData: jsonBody, submitUrl: submitURl,content: "loginReturnValue", completion: {(success,data) ->Void in
                if success {
                    //print("true")
                    _ = self.decodeJSON(returnData: data)
                    
                } else {
                    print("Something went wrong... LoginPageViewController")
                }
            })

    //}
    }
    
        fileprivate func encodeJSON(username: String, password: String)-> Data{
            let loginPostData = PostData(username: username, password: password)
            do{
                let jsonBody = try JSONEncoder().encode(loginPostData)
                return jsonBody
            }catch{
                print(error.localizedDescription)
            }
            return Data()
            
        }
        
        
        fileprivate func decodeJSON(returnData: Data) -> Bool{
            
            do{
                
                let guestDetails = try JSONDecoder().decode(GuestDetail.self, from: returnData)
                self.saveUserDefaultsToRealmDB(guestDetails:guestDetails)
                return true
            }catch{
                print(error)
            }
            
            return false
            
        }
        
        fileprivate func saveUserDefaultsToRealmDB(guestDetails:GuestDetail){
            
            let guestToAddToRealm = Guest()
            print(guestDetails.guest_details?.guest_name!)
            print(guestDetails.guest_details?.guest_id!)
            print(guestDetails.guest_details?.guest_email!)
            print(guestDetails.guest_details?.guest_phone!)
            guestToAddToRealm.guestName = guestDetails.guest_details?.guest_name
            guestToAddToRealm.guestID = guestDetails.guest_details?.guest_id
            guestToAddToRealm.guestEmailID =  guestDetails.guest_details?.guest_email
            guestToAddToRealm.guestPhone =  guestDetails.guest_details?.guest_phone
            guestToAddToRealm.writeToRealm()
        }
        
}

