//
//  WeatherManager.swift
//  Clima
//
//  Created by Lefteris Kostakis on 2/7/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {

    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=de8e45b46c229cd13cec34fd9a90098f&units=metric"
    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }

    func fetchWeather(latitude: CLLocationDegrees, longitute: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitute)"
        print(urlString)
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String) {

        guard let url = URL(string: urlString) else {
            return
        }

        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                delegate?.didFailWithError(error: error)
                return
            }

            if let safeData = data {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(WeatherData.self, from: safeData)
                    let id = decodedData.weather[0].id
                    let temp = decodedData.main.temp
                    let name = decodedData.name

                    let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                    delegate?.didUpdateWeather(self, weather: weather)
                } catch {
                    delegate?.didFailWithError(error: error)
                }
            }
        }
        task.resume()
    }
}
