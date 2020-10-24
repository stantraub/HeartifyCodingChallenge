//
//  CardTabViewController.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class CardController: UIViewController {
    
    //MARK: - Properties
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchRingtones()
        view.backgroundColor = .systemBackground
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Card"
    }
    
    //MARK: - Helpers
    
    //MARK: - API
    
//    func fetchRingtones() {
//        AF.request("https://ringtones-kodi.s3.amazonaws.com/data/top_ringtones.json").responseJSON { response in
//            switch response.result {
//                case .success(let value):
//                    let json = JSON(value)
//                    print(json)
//                case .failure(let error):
//                    print(error)
//
//            }
//        }
//    }
    


    
    //MARK: - Actions
    
}

//MARK: - UICollectionViewDataSource

extension CardController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension CardController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width * 0.8
        let height = view.frame.height * 0.4
        return CGSize(width: width, height: height)
    }
}
