//
//  WeatherManager.swift
//  Sunny
//
//  Created by Daniil Belyaev on 16.06.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import Foundation

struct WeatherManager {
    func fetchWeather(city: String, completionHandler: @escaping (WeatherModel) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=53676b15af78e5f5a6027e1b9734a918&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let weather = parseJSON(data: data) else {return}
                completionHandler(weather)
            }
        }
        task.resume()

        
    }
    func parseJSON(data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherModel.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
