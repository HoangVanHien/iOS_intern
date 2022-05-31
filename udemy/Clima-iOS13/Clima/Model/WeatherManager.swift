//
//  WeatherManager.swift
//  Clima
//
//  Created by mk1 on 30/05/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=7fb7c390494da91aa7ff109549e27581&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) -> Void {
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequestURL(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) -> Void {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longtitude)"
        
        performRequestURL(urlString: urlString)
    }
    
    
    private func performRequestURL(urlString: String){
        //1. creat URL
        if let url = URL(string: urlString){
            
            //2. create URLSession
            let session = URLSession(configuration: .default)
            
            //3. give the session a task
            let task = session.dataTask(with: url){
                (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            
            //4. start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let weather = WeatherModel(cityName: decodedData.name, temperature: decodedData.main.temp, conditionID: decodedData.weather[0].id)
            return weather
        }
        catch{
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
    
}
