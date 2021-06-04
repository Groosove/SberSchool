//
//  CityInfoViewController.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/4/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class CityInfoViewController: UIViewController {
    private let data: WeatherData
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = data.name
        label.font = UIFont.systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherDescription: UILabel = {
        let label = UILabel()
        label.text = data.weather.description?.capitalized
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var highLowTemp: UILabel = {
        let label = UILabel()
        var celsiusMax = getCelsius(valueInKelvin: data.main.tempMax!)
        var celsiusMin = getCelsius(valueInKelvin: data.main.tempMin!)
        celsiusMax.round()
        celsiusMin.round()
        label.text = "H: " + String(Int(celsiusMax)) + "℃  L: " + String(Int(celsiusMin)) + "℃"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherTemp: UILabel = {
        let label = UILabel()
        var celsius = getCelsius(valueInKelvin: data.main.temp!)
        celsius.round()
        label.text = String(Int(celsius)) + "℃"
        label.font = UIFont.systemFont(ofSize: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(data: WeatherData) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cityLabel)
        view.addSubview(weatherDescription)
        view.addSubview(weatherTemp)
        view.addSubview(highLowTemp)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            weatherDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDescription.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: -5),
            
            weatherTemp.topAnchor.constraint(equalTo: weatherDescription.bottomAnchor),
            weatherTemp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            highLowTemp.topAnchor.constraint(equalTo: weatherTemp.bottomAnchor),
            highLowTemp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func getCelsius(valueInKelvin: Double) -> Double {
          return valueInKelvin - 273.15
      }
}
