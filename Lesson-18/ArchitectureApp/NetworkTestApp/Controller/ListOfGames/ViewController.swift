//
//  ViewController.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 28.05.2021.
//

import UIKit

struct GameItem {
	var title: String
}

protocol GamesView: AnyObject {
	func showGames(_ games: [GameItem])
	func showError(_ error: Error)
}


class ViewController: BaseViewController, GamesView {

	private var games = [GameItem]()
	
	func showGames(_ games: [GameItem]) {
		self.games = games
		self.tableView.reloadData()
	}
	
	func showError(_ error: Error) {
		
	}
	
    // MARK: - Init

	init(
		networkService: TwitchNetworkServiceProtocol,
		itemSelectedBlock: @escaping (GetGamesDataResponse)->Void
	){
		super.init(nibName: nil, bundle: nil)
		self.presenter = GamesPresenter(
			view: self,
			networkService: networkService,
			itemSelectedBlock:itemSelectedBlock
		)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var presenter: GamesPresenterProtocol?

    // MARK: - UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.indentifirer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
		presenter?.requestData()
    }

    deinit {
        print("ViewController deinit")
    }

    // MARK: - Private methods

    private func configureUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    private func showAlert(for error: NetworkServiceError) {
        let alert = UIAlertController(title: "Опаньки, что-то пошло не так",
                                      message: message(for: error),
                                      preferredStyle: .alert)
        present(alert, animated: true)
    }

    private func message(for error: NetworkServiceError) -> String {
        switch error {
        case .network:
            return "Упал запрос"
        case .decodable:
            return "Не смогли распарсить"
        case .unauthorize:
            return "Вы не авторизованы"
        case .unknown:
            return "????"
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.indentifirer, for: indexPath) as! GameCell
		
		let item = games[indexPath.row]
		
		cell.configure(with: item.title)
				
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		if indexPath.row == viewModel.dataSource.count - 1, !isLoading {
//            isLoading = true
////            networkService.getGames(after: cursor) { self.process($0) }
//        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
		presenter?.itemSelected(indexPath.item)
//		let viewController = ImageViewController(networkService: networkService, imageUrl: viewModel.dataSource[indexPath.row].boxArtUrl)
//        navigationController?.present(viewController, animated: true, completion: nil)
    }
}

