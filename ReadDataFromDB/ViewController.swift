//
//  ViewController.swift
//  ReadDataFromDB
//
//  Created by UnciaX on 9/5/15.
//  Copyright (c) 2015 UnciaX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var core:DataCore!
    var errorMsg:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        core = DataCore()
        if core.getData() {
            for obj in core.jewArray{
                print(obj.createJSONString())
            }
        }else{
            let alert = UIAlertController(title: "", message: "目前服務暫時無法使用，請稍候再試", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "好", style:UIAlertActionStyle.Default, handler:nil))
            //TODO : replace nil to show last download data
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
