//
//  DetailsViewController.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 09/04/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    lazy var detailsView = DetailsView()
    var diggoResponse: DiggoResponse
    
    init(diggoResponse: DiggoResponse) {
        self.diggoResponse = diggoResponse
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
        print(diggoResponse)
    }
    
    private func setNavBar() {
        title = "Jax"
        view.backgroundColor = .systemBackground
    }
}
