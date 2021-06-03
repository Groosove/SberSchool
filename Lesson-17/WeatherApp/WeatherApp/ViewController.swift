//
//  ViewController.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/3/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    private let networkService: WeatherNetworkProtocol
    private var dataSource = [CurrentWeatherData]()
    
    init(networkService: WeatherNetworkProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.indentifirer)
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        loadData()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadData() {
        isLoading = true
        networkService.getCountry(with: "UFA") {
            self.process($0)
        }
    }
    
    private func process(_ response: WeatherResult) {
         DispatchQueue.main.async {
             switch response {
             case .success(let data):
                self.dataSource.append(data)
                self.tableView.reloadData()
                
             case .failure(let _):
                print(#function)
             }
             self.isLoading = false
         }
     }
}




extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.indentifirer,
                                                 for: indexPath)
        (cell as? WeatherCell)?.configure(with: dataSource[indexPath.row])
        return cell
    }
}

//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == dataSource.count - 1, !isLoading {
//            isLoading = true
//            networkService.getGames(after: cursor) { self.process($0) }
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        navigationController?.present(viewController, animated: true, completion: nil)
//    }
//}
