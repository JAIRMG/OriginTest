//
//  ViewController.swift
//  OriginTest
//
//  Created by Jair Moreno Gaspar on 4/22/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let service = "myService"
    let account = "myAccount"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func launchMobileX(_ sender: Any) {
        
        //Meter la info a keychain y luego al grupo para compartirla
        
        
        
        KeychainService.savePassword(service: service, account: account, data: "12345")
    
        
        
        let userDefaults = UserDefaults(suiteName: "group.com.mobilex")!
        userDefaults.set("12345", forKey: "DynamicVector")
        userDefaults.synchronize()
        
        
        
        //openApp(appURL: "com.mobilex://")
        openApp(appURL: "com.mobilexParameter://testColor?value1=red")
        
    }
    

    func openApp(appURL: String) {
        let openApp = URL(string: appURL)!
        
        if UIApplication.shared.canOpenURL(openApp) {
            UIApplication.shared.open(openApp, options: [:], completionHandler: { (success) in
                print("Open App: \(appURL)")
                print("Status: \(success)")
            })
        }
    }
    
}

