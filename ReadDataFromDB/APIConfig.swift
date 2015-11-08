//
//  APIConfig.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 9/5/15.
//  Copyright (c) 2015 UnciaX. All rights reserved.
//

import Foundation

class APIConfig{
    let apiBaseUrl = "http://mlf.twbbs.org/nkfust/ccejewelry/API/"
    let jewelryBasePath = "Jewelry/"
    let speciesBasePath = "Species/"
    //var login:String!           // login
    var listSpecies:String!     // Get list of species
    var listJewelry:String!     // Get list of jewelry
    var getJewelryImage:String! // Get image of jewelry
    
    init(){
        //login = apiBaseUrl + "login.php"
        listSpecies = apiBaseUrl + speciesBasePath +  "list.php"
        listJewelry = apiBaseUrl + jewelryBasePath +  "list.php"
        getJewelryImage = apiBaseUrl + jewelryBasePath + "getImage.php?jewID="
    }
}