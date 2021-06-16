//
//  ViewController.swift
//  Sunny
//
//  Created by Ivan Akulov on 24/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.weatherManager.fetchWeather(city: city) { weather in
                DispatchQueue.main.async {
                    self.cityLabel.text = weather.name
                    self.temperatureLabel.text = "\(weather.main.temp)"
                    self.feelsLikeTemperatureLabel.text = "\(weather.main.feelsLike)"
                }

            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


