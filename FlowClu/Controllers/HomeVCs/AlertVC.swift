//
//  AlertVC.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-03.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit
import CoreLocation


class AlertVC: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var whatYouNeed: UITextField!
    
    
    @IBOutlet weak var additionalComments: UITextField!
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var latitude : String?
    var longitude : String?
    
    
    @IBAction func checkEntries(_ sender: Any) {
        
        
        
        let myId = UserDefaults.standard.string(forKey: "myID")
        let usenam = UserDefaults.standard.string(forKey: "nameuser")

        
        
        let url = NSURL(string: "https://floclu.ca/recievenew.php") // locahost MAMP - change to point to your database server
        
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        
        
        locManager.requestWhenInUseAuthorization()
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            
        }
        latitude = "\(currentLocation.coordinate.latitude)"
        longitude = "\(currentLocation.coordinate.longitude)"
        
        
        print(myId!, "================================hasjddkk===============================")
        // the POST string has entries separated by &
        dataString = dataString + "&latitude=\(String(latitude!))"
        dataString = dataString + "&longitude=\(String(longitude!))"
        dataString = dataString + "&whatdoyouneed=\(whatYouNeed.text!)" // add items as name and value
        dataString = dataString + "&comment=\(additionalComments.text!)"
        dataString = dataString + "&userid=\(String(myId!))"
        dataString = dataString + "&username=\(String(usenam!))"
        //    dataString = dataString + "&item4=\(item4.text!)"
        //    dataString = dataString + "&item5=\(item5.text!)"
        
        // convert the post string to utf8 format
        
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
        {
            
            // the upload task, uploadJob, is defined here
            
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    if let unwrappedData = data {
                        
                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                        
                        if returnedData == "1" // insert into database worked
                        {
                            
                            // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    
                                    let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
            
            uploadJob.resume()
        }
        
        
        
        
        //        ============= Sending to other view Controller (HelpListViewController) ============
        
        let detail:HelpListViewController = self.storyboard?.instantiateViewController(withIdentifier: "helpList") as! HelpListViewController
        
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        whatYouNeed.delegate = self
        additionalComments.delegate = self
        
        
        
    }
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    //    keyboard hide code
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //      keyboard hide code ends
    
}

