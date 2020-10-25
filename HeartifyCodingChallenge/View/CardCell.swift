//
//  CardCell.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit
import SDWebImage



class CardCell: UIView {
    
    //MARK: - Properties
    
    var data: Card? {
        didSet {
            guard let data = data else { return }
            backgroundImage.sd_setImage(with: data.backgroundImage)
            titleLabel.text = data.title
            descriptionLabel.text = data.description
        }
    }

    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Ringtone Title"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.text = "Ringtone Description"
        return label
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    
    private func configureUI() {
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
        
        addSubview(containerView)
        containerView.frame = CGRect(
            x: 0,
            y: 0,
            width: frame.width,
            height: frame.height
        )
        
        configureGradient()
        configureInfoStack()
    }
    
    private func configureGradient() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        gradientLayer.frame = containerView.frame
        containerView.layer.addSublayer(gradientLayer)
    }
    
    private func configureInfoStack() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        stack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20, paddingBottom: 20)
    }
}
