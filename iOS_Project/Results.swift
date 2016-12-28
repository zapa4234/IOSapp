//
//  Results.swift
//  iOS_Project
//
//  Created by Jose Sanchez-Garcia on 12/27/16.
//  Copyright © 2016 CSUMB. All rights reserved.
//

import UIKit

class Results: UIViewController {

    @IBOutlet weak var Label: UILabel!
    var dataPassed = String() // This will store the information being passed
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text = dataPassed
        print("Data Passed: \(dataPassed)")
        // Do any additional setup after loading the view.
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
