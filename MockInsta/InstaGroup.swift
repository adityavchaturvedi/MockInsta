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
    
    struct Feed {
        let meta: String //
        picture: String
        let Name: String
        let description: String
        let location: String
    }

let URL =  https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673 

