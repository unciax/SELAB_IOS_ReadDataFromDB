//
//  Jewelry.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 9/5/15.
//  Copyright (c) 2015 UnciaX. All rights reserved.
//

import Foundation
import UIKit

class Jewelry{
    var ID:Int?
    var name:String?
    var price:Int?
    var image:UIImage?
    var specID:Int?
    //var inventory:Int?
    
    init(){
        //do nothing
    }
    
    init(JSONObject:AnyObject){
        createFromJSON(JSONObject)
        //self.inventory = inventory
    }
    
    func createFromJSON(JSONObject:AnyObject){
        if let id = JSONObject.objectForKey("jewelryID") as? Int { self.ID = id }
        if let name = JSONObject.objectForKey("jewelryName") as? String { self.name = name }
        if let price = JSONObject.objectForKey("price") as? Int { self.price = price }
        if let specID = JSONObject.objectForKey("specID") as? Int { self.specID = specID }
        image = getImage(ID!)
    }
    
    func createJSON() -> [String:AnyObject]? {
        if ID == nil {
            let JSONObject: [String:AnyObject] = [
                "jewelryID": ID!,
                "jewelryName": name!,
                "price": price!,
                "specID": specID!
            ]
            return JSONObject
        }else{
            return nil
        }
    }
    
    func createJSONString() -> String{
        return "{\"jewelry\": \(ID),\"jewelryName\":\(name),\"price\":\(price),\"specID\":\(specID) }"
    }
    
    func getImage(specID:Int) -> UIImage?{
        let api = APIConfig()
        if let url = NSURL(string: api.getJewelryImage + String(ID)) {
            if let data = NSData(contentsOfURL: url) {
                return UIImage(data: data)
            }
        }
        return nil
        // TODO: replace nil to show default image
    }
}