//
//  NetworkService.swift
//  WeatherProject
//
//  Created by Ayushi Raj on 16/10/21.
//

import Foundation

class NetworkService {
    
    func getWeather (completionHandler: @escaping (Error?, WeatherDetailModel?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=37.785834&lon=-122.406417&units=imperial&appid=c825d2dc1fb2ac72ade1d1fb46833da9"
        
        guard let url = URL(string:urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with fetching films: \(error)")
                completionHandler(error,nil)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completionHandler(error,nil)
                return
            }
            if let data = data,
               let weatherSummary = try? JSONDecoder().decode(WeatherDetailModel.self, from: data) {
                completionHandler(nil,weatherSummary)
            }
        }.resume()
    }
}
