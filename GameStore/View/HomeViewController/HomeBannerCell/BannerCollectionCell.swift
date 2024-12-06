//
//  BannerCollectionCell.swift
//  GameStore
//
//  Created by Rafael on 05/12/24.
//

import UIKit

class BannerCollectionCell: UICollectionViewCell {
    
    static let  identifier = "bannerCollectionCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        //imageView.image = UIImage(named: "questionmark")
        imageView.clipsToBounds = true
        return imageView
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configureImage(with image: UIImage) {
        self.imageView.image = image

        contentView.addSubview(self.imageView)
        
        imageView.layer.cornerRadius = 1
        imageView.layer.borderWidth =  2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView .bottomAnchor).isActive = true
        
    }
    


}
