//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import XCPlayground

XCPExecutionShouldContinueIndefinitely(true)

Alamofire.request(.GET, "https://httpbin.org/get")
    .responseJSON {_,_,result in
    print(result)
    debugPrint(result)
}

