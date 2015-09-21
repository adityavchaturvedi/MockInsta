//
//  InstaGroup.swift
//  MockInsta
//
//  Created by Aditya Chaturvedi on 9/20/15.
//  Copyright © 2015 Aditya V Chaturvedi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class InstaGroup {

    struct orgDetails {
        let retCode: Int8 // If 200 continue else do not continue
        let data: String
    }
    
    func fetchInstaDetails(callback: (orgDetails) -> Void) {
        // Fetch organization details
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _, _, jsonObj in
                self.populateInstaInfoWith(jsonObj.value!, callback: callback)
        }
    }
    
    func populateInstaInfoWith(data: AnyObject?, callback: (orgDetails) -> Void) {
        let json = JSON(data!)
        callback(orgDetails(retCode: json["Meta/code"].stringValue, data: json["data"].stringValue))
    }


}