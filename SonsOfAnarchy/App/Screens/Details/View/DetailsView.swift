//
//  DetailsView.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 09/04/24.
//

import UIKit
import SDWebImage

class DetailsView: UIView {
    lazy var imageChar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jax Teller"
        label.font = .preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()
    
    lazy var labelGender: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Masculino"
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var labelOccupation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Presidente"
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var labelPlayedBy: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do ator"
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(diggoResponse: DiggoResponse) {
        imageChar.sd_setImage(with: diggoResponse.imageChar)
        labelName.text = diggoResponse.firstName
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(imageChar)
        addSubview(labelName)
        addSubview(labelGender)
        addSubview(labelOccupation)
        addSubview(labelPlayedBy)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageChar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            imageChar.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageChar.widthAnchor.constraint(equalToConstant: 200),
            imageChar.heightAnchor.constraint(equalToConstant: 250),
            
            labelName.topAnchor.constraint(equalTo: imageChar.bottomAnchor, constant: 6),
            labelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            labelName.heightAnchor.constraint(equalToConstant: 30),
            
            labelGender.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelGender.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelGender.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            
            labelOccupation.topAnchor.constraint(equalTo: labelGender.bottomAnchor, constant: 10),
            labelOccupation.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelOccupation.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            
            labelPlayedBy.topAnchor.constraint(equalTo: labelOccupation.bottomAnchor, constant: 10),
            labelPlayedBy.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelPlayedBy.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
        ])
    }
}
