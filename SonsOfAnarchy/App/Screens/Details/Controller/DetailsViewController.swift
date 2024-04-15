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
        viewModel.loadDataDetails { personagem in
            self.detailsView.configure(personagem: personagem)
        }
    }
    
    private func setNavBar() {
        view.backgroundColor = .systemBackground
    }
}
