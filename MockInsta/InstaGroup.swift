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
    
    struct User {
        let name: String
        let profilePicURL: String
        let id: String
        let fullName: String
    }
    
    func fetchFeed(callback: ([User]) -> Void) {
        // Fetch feed details
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _, _, jsonObj in
                self.storeDataForFeed(jsonObj.Value!, callback: callback)
        }
    }
    
    func storeDataForFeed(data: AnyObject?, callback: ([User]) -> Void) {
        let json = JSON(data!)
        var users = [User]()
        
        for member in json.arrayValue {
            users.append(User(name: member["from"]["username"].stringValue, profilePicURL: member["from"]["profile_picture"].stringValue, id: member["from"]["id"].stringValue, fullName: member["from"]["full_name"].stringValue))
        }
        callback(users)
    }
}