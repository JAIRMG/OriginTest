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
    
    @IBOutlet weak var updatedValue: UITextField! 
    
    var text = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func launchMobileX(_ sender: Any) {
        
        //Meter la info a keychain y luego al grupo para compartirla
        //KeychainService.savePassword(service: service, account: account, data: "1234567")
        
        text = updatedValue.text!
        
        KeychainService.updatePassword(service: service, account: account, data: text)
    
        
        
        //retrieving from keychain
        let pass = KeychainService.loadPassword(service: service, account: account)
        print("Retrieve pass \(pass ?? "error pass")")
        
        guard let password = pass else {
            print("no se pudo recuperar pass de keychain∫")
            return
            
        }
        
        let userDefaults = UserDefaults(suiteName: "group.com.mobilex")!
        userDefaults.set(password, forKey: "DynamicVector")
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

