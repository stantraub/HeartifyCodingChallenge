//
//  CardCell.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit
import SDWebImage



class CardCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var data: Card? {
        didSet {
            guard let data = data else { return }
            backgroundImage.sd_setImage(with: data.backgroundImage)
        }
    }
    
    private var backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    static let identifier = "CardCell"
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerCurve = .continuous
        layer.cornerRadius = 50
        clipsToBounds = true
        
        addSubview(backgroundImage)
        backgroundImage.frame = CGRect(
            x: 0,
            y: 0,
            width: frame.width,
            height: frame.height
        )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
}
