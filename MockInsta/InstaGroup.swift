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
    
    func fetchFeed(callback: (Media) -> Void) {
        // Fetch Media details
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673")
            .responseJSON { _, _, jsonObj in
                self.storeDataForFeed(jsonObj.value!, callback: callback)
        }
    }
    
    func storeDataForFeed(data: AnyObject?, callback: (Media) -> Void) {
        let json = JSON(data!)
        var _ = [Media]()
        
        for _ in json.arrayValue {
            print("hello")
        }
    }
}