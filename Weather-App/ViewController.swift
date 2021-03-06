//
//  ViewController.swift
//  Weather-App
//
//  Created by Set Kyar on 5/10/16.
//  Copyright © 2016 setkyarwalar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherSevice = WeatherService()
    
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var cloudsLabel: UILabel!
    
    @IBAction func setCityTapped(sender: UIButton) {
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
                let textField = alert.textFields?[0]
                self.cityLabel.text = textField?.text!
                let cityName = textField?.text
                self.weatherSevice.getWeather(cityName!)
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
    
    //Mark: - Weather Service Delegate
    func setWeather(weather: Weather) {        
        //set labels from weather object
        cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.temp)"
        descriptionLabel.text = weather.description
        cityButton.setTitle(weather.cityName, forState: .Normal)
        iconImage.image = UIImage(named: weather.icon)
        cloudsLabel.text = "\(weather.clouds) %"
        
    }
    
    func weahterErrorWithMessage(message: String) {
        let alert   = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let ok      = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(ok)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherSevice.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

