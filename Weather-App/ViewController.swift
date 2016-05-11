//
//  ViewController.swift
//  Weather-App
//
//  Created by Set Kyar on 5/10/16.
//  Copyright © 2016 setkyarwalar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBAction func setCityTapped(sender: UIButton) {
        print("City button tapped")
        openCityAlert()
    }
    
    func openCityAlert() {
        //Create alert Controller
        let alert = UIAlertController(title: "City",
            message: "Enter city name",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //Create cancel action
        let cancel = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alert.addAction(cancel)
        
        //Create ok action
        let ok = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
                print("OK")
                let textField = alert.textFields?[0]
                print(textField?.text)
                self.cityLabel.text = textField?.text!
        }
        
        alert.addAction(ok)
        
        //Add text field
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "City Name"
        }
        
        //present alert controller
        self.presentViewController(
            alert,
            animated: true,
            completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

