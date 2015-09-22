//
//  InstaGroup.swift
//  MockInsta
//
//  Created by Aditya Chaturvedi on 9/20/15.
//  Copyright © 2015 Aditya V Chaturvedi. All rights reserved.
//
// Inspired and adapted from Nick Chen's Github Demo Code at https://github.com/talentsparkio/GitHubDemo


import Foundation
import Alamofire
import SwiftyJSON

public class MockInsta {
    
    struct Feed {
        let data: String
    }
    
    struct User {
        let name: String
        let profilePicURL: String
        let id: String
        let fullName: String
    }
    
    func fetchFeed(callback: (Feed) -> Void) {
        // Fetch feed details
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673 ")
            .responseJSON { _, _, jsonObj in
                self.storeDataForFeed(jsonObj.value!, callback: callback)
        }
    }
    
    func storeDataForFeed(data: AnyObject?, callback: (Feed) -> Void) {
        let json = JSON(data!)
        print(json["data"].stringValue)
        callback(Feed(data: json["data"].stringValue))
    }
}