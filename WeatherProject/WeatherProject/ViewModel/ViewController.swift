//
//  ViewController.swift
//  WeatherProject
//
//  Created by Ayushi Raj on 16/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    

    let networkService = NetworkService()
    var weatherModel: WeatherDetailModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getWeather { (error : Error?, model : WeatherDetailModel?) in
            if(error != nil) {
                // error handling
                //show alert
                
                self.showAlert()
                return
                
            }
            else {
                self.weatherModel = model
                self.setWeatherDeatils()
            }
        }
        
        
    }
    
    func showAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
        
    }
    func setWeatherDeatils(){
        DispatchQueue.main.async {
            self.weatherLabel.text = self.weatherModel?.timezone ?? "Invalid Resp"
        }
        

}
}
