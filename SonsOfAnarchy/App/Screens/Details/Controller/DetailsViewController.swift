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
    
    init(diggoResponse: DiggoResponse) {
        self.viewModel = DetailsViewModel(diggoResponse: diggoResponse)
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
        detailsView.configure(diggoResponse: viewModel.diggoResponse)
    }
    
    private func setNavBar() {
        title = viewModel.diggoResponse.firstName
        view.backgroundColor = .systemBackground
    }
}
