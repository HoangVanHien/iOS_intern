//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(data: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "FA9DDDF4-0AED-4D76-A7A9-F817EBDE2550"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
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
                    if let decodedData = parseJSON(jsonData: safeData){
                        self.delegate?.didUpdateCoin(data: decodedData)
                    }
                }
            }
            
            //4. start the task
            task.resume()
        }
    }
    
    func parseJSON(jsonData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: jsonData)
            
            return CoinModel(name: decodedData.asset_id_quote, rate: decodedData.rate)
        }
        catch{
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
