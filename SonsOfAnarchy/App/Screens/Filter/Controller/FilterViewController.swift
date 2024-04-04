//
//  FilterViewController.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 04/04/24.
//

import UIKit

protocol FilterViewControllerDelegate: AnyObject {
    func didUpdateFilters(filters: [Filter])
}

class FilterViewController: UIViewController {
    
    let filterView: FilterView
    let viewModel: FilterViewModel
    
    weak var delegate: FilterViewControllerDelegate?
    
    init(filters: [Filter], delegate: FilterViewControllerDelegate?) {
        self.viewModel = FilterViewModel(filters: filters)
        self.filterView = FilterView(viewModel: viewModel)
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = filterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
    }
    
    private func setNavBar() {
        title = "Clubes"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
    }
    
    @objc private func didTapDoneButton() {
        delegate?.didUpdateFilters(filters: viewModel.filters)
        navigationController?.popViewController(animated: true)
    }
    
}
