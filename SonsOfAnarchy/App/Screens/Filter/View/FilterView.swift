//
//  FilterView.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 04/04/24.
//

import UIKit

class FilterView: UIView {
    lazy var tableViewFilter: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilterCell.self, forCellReuseIdentifier: FilterCell.identifier)
        tableView.rowHeight = 40
        return tableView
    }()
    
    let viewModel: FilterViewModel
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(tableViewFilter)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableViewFilter.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableViewFilter.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableViewFilter.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableViewFilter.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension FilterView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.identifier, for: indexPath) as? FilterCell else { return UITableViewCell() }
        let filter = viewModel.cellForRowAt(indexPath: indexPath)
        cell.configure(filter: filter)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath: indexPath)
        tableView.reloadData()
    }
}
