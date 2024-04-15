//
//  CharacterCell.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 04/04/24.
//

import UIKit
import SDWebImage

class CharacterCell: UICollectionViewCell {
    static let identifier = "CharacterCell"
    
    lazy var imageCharacter: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(diggoResponse: PersonagemResponse) {
        imageCharacter.sd_setImage(with: diggoResponse.imageChar)
        nameLabel.text = diggoResponse.firstName
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(imageCharacter)
        addSubview(nameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageCharacter.topAnchor.constraint(equalTo: topAnchor),
            imageCharacter.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCharacter.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCharacter.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageCharacter.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: imageCharacter.trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: -5),
        ])
    }
}
