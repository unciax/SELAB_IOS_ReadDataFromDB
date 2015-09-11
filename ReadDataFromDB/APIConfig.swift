//
//  APIConfig.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 9/5/15.
//  Copyright (c) 2015 UnciaX. All rights reserved.
//

import Foundation

class APIConfig{
    //let apiBaseUrl = "http://ccejewerly.azurewebsites.net/API/"
    let apiBaseUrl = "http://ccejewerly.azurewebsites.net/"
    var listSpecies:String!     // Get list of species
    var listJewelry:String!     // Get list of jewelry
    var getJewelryImage:String! // Get image of jewelry
    
    init(){
        listSpecies = apiBaseUrl + "species/list.aspx"
        listJewelry = apiBaseUrl + "query.aspx" //"jewelry/list.aspx"
        getJewelryImage = apiBaseUrl + "jewelry/getImage.ashx?id="
    }
}