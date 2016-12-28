//
//  Dashboard.swift
//  iOS_Project
//
//  Created by Jose Sanchez-Garcia on 12/27/16.
//  Copyright © 2016 CSUMB. All rights reserved.
//

import UIKit
class Dashboard: UIViewController {

    var userInput = ""
    @IBOutlet weak var inputText: UITextField!
    @IBAction func SearchButton() {
        
        let text = inputText.text // Get data from inputField
        
        if (text?.isEmpty)!{
            let alert = UIAlertController(title: "Insufficient Ingredients",
                message: "Not enough ingredients entered.",
                preferredStyle: UIAlertControllerStyle.alert
                    )
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            userInput = text!
            self.performSegue(withIdentifier: "moveToResults", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    // This is used to transfer data between screens so we can display results in the other screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // moving to the next screen where I will display data
        if(segue.identifier == "Results")
        {
            let svc = segue.destination as! Results
            svc.dataPassed = userInput
            print("Data is being Passed")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
