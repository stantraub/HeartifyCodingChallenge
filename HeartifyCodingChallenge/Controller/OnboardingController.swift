//
//  ViewController.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit

class OnboardingController: UIViewController {
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 18)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(handleContinueTappped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBlue
        
        view.addSubview(continueButton)
        continueButton.centerX(inView: view)
        continueButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16)
        continueButton.setDimensions(height: 50, width: 175)
    }
    
    @objc private func handleContinueTappped() {
        let vc = MainTabBarController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        

    }


}

