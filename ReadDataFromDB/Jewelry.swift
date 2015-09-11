//
//  Jewelry.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 9/5/15.
//  Copyright (c) 2015 UnciaX. All rights reserved.
//

import Foundation

class Jewelry{
    var ID:Int?
    var name:String?
    var price:Int?
    var imageUrl:String?
    var specID:Int?
    
    
    init(ID:Int, name:String, price:Int, imageUrl:String, specID:Int){
        self.ID = ID
        self.name = name
        self.imageUrl = imageUrl
        self.specID = specID
    }
}