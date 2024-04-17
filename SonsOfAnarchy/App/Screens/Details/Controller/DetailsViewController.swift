//
//  DetailsViewController.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 09/04/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    lazy var detailsView = DetailsView()
    var viewModel: DetailsViewModel
    
    init(id: Int) {
        self.viewModel = DetailsViewModel(id: id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        handleStates()
        viewModel.loadDataDetails()
    }
    
    private func setNavBar() {
        view.backgroundColor = .systemBackground
    }
    
    func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .loading:
                break
            case .loaded(let personagem):
                self.showLoadedState(personagem: personagem)
            case .error(_):
                self.showErrorState()
            }
        }
    }
    
    
    func showLoadingState() {
        detailsView.removeFromSuperview()
    }
    
    func showLoadedState(personagem: Personagem) {
        detailsView.configure(personagem: personagem)
        detailsView.spinner.stopAnimating()
    }
    
    func showErrorState() {
        let alert = UIAlertController(title: "Ocorreu um erro!", message: "Tentar Novamente?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sim", style: .default) { action in
            self.viewModel.loadDataDetails()
        }
        let nok = UIAlertAction(title: "Não", style: .cancel) { action in

        }
        alert.addAction(ok)
        alert.addAction(nok)
        present(alert, animated: true)
    }
}
