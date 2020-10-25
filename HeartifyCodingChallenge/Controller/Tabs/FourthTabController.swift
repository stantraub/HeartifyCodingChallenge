//
//  FourthTabController.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit

class FourthTabController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.configureNavBarTitle(with: "Tab 4")
    }
    
    //MARK: - Helpers
}

