//
//  DataCore.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 2015/10/29.
//  Copyright © 2015年 UnciaX. All rights reserved.
//

import Foundation

class DataCore{
    var jewArray = [Jewelry]()
    var api:APIConfig!
    
    init(){
        api = APIConfig()
    }
    
    func getData() -> Bool{
        let response = NSData(contentsOfURL: NSURL(string: api.listJewelry)!)
        if response != nil {
            do{
                try jsonDecoder(response!)
                return true
            }catch _ {
                print("Enter catch!")
                return false
            }
        }else{
            return false
        }
    }
    
    func jsonDecoder(response:NSData) throws {
        let tryJSON: AnyObject = try NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions.AllowFragments)
        if let obj = tryJSON as? [String: AnyObject]{
            if let message = obj["message"] as? String{
                NSLog("%@", message)
            }
        }else{
            let JSONObject: NSArray = try NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions.MutableContainers) as! NSArray
            for obj in JSONObject{
                jewArray.append(Jewelry(JSONObject: obj))
            }
        }

    }
    
    
}
