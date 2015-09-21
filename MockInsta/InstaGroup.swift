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

