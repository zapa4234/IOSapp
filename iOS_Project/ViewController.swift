//
//  ViewController.swift
//  iOS_Project
//
//  Created by Jose Sanchez-Garcia on 12/22/16.
//  Copyright © 2016 CSUMB. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    var userName = String() //used to get userName
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Implementing the Twitter Login for the app
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                                              message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.userName = unwrappedSession.userName
                self.performSegue(withIdentifier: "moveToInput", sender: self)
                
                } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "moveToInput"){
            let svc = segue.destination as! Dashboard
            svc.userName = self.userName //passing the username to other screen.
        }
    }
    
}

