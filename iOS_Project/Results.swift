//
//  Results.swift
//  iOS_Project
//
//  Created by Jose Sanchez-Garcia on 12/27/16.
//  Copyright © 2016 CSUMB. All rights reserved.
//

import UIKit
import Alamofire

class Results: UIViewController {

    @IBOutlet weak var Label: UILabel!
    var dataPassed = String() // This will store the information being passed
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Label.text = dataPassed
        
        let backgroundQueue = DispatchQueue(label: "com.app.queue",
                                            qos: .background,
                                            target: nil)
        
        // Fetching the information in another thread
        backgroundQueue.async {
            print("Fetching Results")
            self.fetchResults();
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchResults(){
        
//        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
        
        Alamofire.request("http://localhost:8080/rest/getRecipes", method: .get, parameters: ["items":dataPassed])
        .validate()
        .responseJSON { (response) in
            debugPrint(response.data ?? "NILL")
        }
        
        print("Fetched results")
    }
//        Alamofire.request(
//            url: "http://localhost:8080/rest/getRecipes",
//            method: GET,
//            parameters: ["items": dataPassed],
//            encoding: .URL)
//            .validate()
//            .responseJSON { (response) -> Void in
//                guard response.result.isSuccess else {
//                    print("Error while fetching remote rooms: \(response.result.error)")
//                    completion(nil)
//                    return
//                }
//                
//                guard let value = response.result.value as? [String: AnyObject],
//                    let rows = value["rows"] as? [[String: AnyObject]] else {
//                        print("Malformed data received from fetchAllRooms service")
//                        completion(nil)
//                        return
//                }
//                
//                var rooms = [RemoteRoom]()
//                for roomDict in rows {
//                    rooms.append(RemoteRoom(jsonData: roomDict))
//                }
//                
//                completion(rooms)
////        }
//   }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
