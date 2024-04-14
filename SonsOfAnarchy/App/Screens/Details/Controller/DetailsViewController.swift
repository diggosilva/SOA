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
        self.viewModel = DetailsViewModel(id: viewModel.id)
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
//        detailsView.configure(personagem: <#T##Personagem#>)
        viewModel.loadDataDetails(id: <#T##Int#>)
    }
    
    private func setNavBar() {
//        title = viewModel.diggoResponse.firstName
        view.backgroundColor = .systemBackground
    }
}
