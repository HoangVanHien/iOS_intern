//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var coinManager = CoinManager()
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource=self
        currencyPicker.delegate=self
        coinManager.delegate=self
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let coinName = coinManager.currencyArray[row]
        currencyLabel.text = coinName
        coinManager.getCoinPrice(for: coinName)
    }
}

//MARK: - CoinMangerDelegate
extension ViewController: CoinManagerDelegate{
    func didUpdateCoin(data: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.3lf", data.rate ?? 0)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

