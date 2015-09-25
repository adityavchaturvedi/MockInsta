//
//  InstaGroup.swift
//  MockInsta
//
//  Created by Aditya Chaturvedi on 9/20/15.
//  Copyright © 2015 Aditya V Chaturvedi. All rights reserved.


import Foundation
import Alamofire
import SwiftyJSON

public class MockInsta {
    
    struct Media {
        let tags: [String]
        let commentCount: Int
        let commentText: [String]
        let likesNum: Int
        let picLow: String //pic URL
        let picThum: String //pic URL
        let picSd: String //pic URL
        let username: String //Username
        let profilePic: String //pic url
        let id: String
    }
    
    func fetchFeed(callback: ([Media]) -> Void) {
        // Fetch Media details
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _, _, jsonObj in
                self.storeDataForFeed(jsonObj.value!, callback: callback)
        }
    }
    
    func storeDataForFeed(data: AnyObject?, callback: ([Media]) -> Void) {
        let json = JSON(data!)
        var users = [Media]()
        
        for user in json.arrayValue {
            let json2 = JSON(user["comments"])
            for user3 in json2.arrayValue {
                
            }
            users.append(Media(tags: user["tags"].stringValue , commentCount: user["comments"]["count"], commentText: user["comments"]["data"].int, likesNum: user["likes"]["count"], picLow: user["images"]["low_resolution"]["url"], picThum: user["images"]["thumbnail"]["url"], picSd: user["images"]["standard_resolution"]["url"], username: user["user"]["username"], profilePic: user["user"]["profile_picture"], id: user["user"]["id"]))
        }
    }
}