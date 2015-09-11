//
//  ViewController.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 9/5/15.
//  Copyright (c) 2015 UnciaX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var api:APIConfig!
    var ErrorMsg:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if IJReachability.isConnectedToNetwork() {
            ErrorMsg = "Network Connection unavailable."
            NSLog("%@", ErrorMsg!)
        }else{
            api = APIConfig()
            var response = NSData(contentsOfURL: NSURL(string: api.listJewelry)!)
            var tryJSON: AnyObject = NSJSONSerialization.JSONObjectWithData(response!, options: NSJSONReadingOptions.AllowFragments, error: nil)!
            if let obj = tryJSON as? [String: AnyObject]{
                let message = obj["message"] as! String
                ErrorMsg = message
                NSLog("%@", ErrorMsg!)
            }else{
                var JSONObject: NSArray = NSJSONSerialization.JSONObjectWithData(response!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
                for obj in JSONObject{
                    var id = obj.objectForKey("ID") as! Int
                    var name = obj.objectForKey("name") as! String
                    var price = obj.objectForKey("price") as! Int
                    var imageUrl = obj.objectForKey("image") as! String
                    //var specid = obj.objectForKey("species") as! Int
                    NSLog("[%d] %@ - $%d image:%@", id, name, price, imageUrl)
                }
        }
        }
        

    }
    
    override func viewDidAppear(animated: Bool) {
        if (ErrorMsg != nil){
            var alert = UIAlertController(title: "錯誤",message: ErrorMsg, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "好", style:UIAlertActionStyle.Default, handler:nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
/*

var response  = NSData(contentsOfURL: NSURL(string: urlPath)!)
var json: AnyObject = NSJSONSerialization.JSONObjectWithData(response!, options: NSJSONReadingOptions.AllowFragments, error: nil)!
for result in json["data"] as NSArray {
var name = result.objectForKey("name") as NSString
println(name)
}

*/
