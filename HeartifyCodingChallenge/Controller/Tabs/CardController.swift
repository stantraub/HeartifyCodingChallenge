//
//  CardTabViewController.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/23/20.
//

import UIKit

protocol CardControllerDelegate: class {
    func didSelectCardWithTitle(title: String)
}

class CardController: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: CardControllerDelegate?
    
    var cards = [Card]()
    
    private lazy var collectionView: UICollectionView = {
        let frame = CGRect(x: 0, y: (view.frame.height / 2) - (view.frame.height * 0.4 / 2), width: view.frame.width, height: view.frame.height * 0.4)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.itemSize = CGSize(width: view.frame.width * 0.8, height: view.frame.height * 0.4)
        
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .systemBackground
        cv.delegate = self
        cv.dataSource = self
        cv.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        
        return cv
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRingtones()
        configureUI()
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        navigationController?.navigationBar.configureNavBarTitle(with: "Card")
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    private func passTitleToInfoController(with title: String) {
        let navVC = tabBarController?.viewControllers?[1] as! UINavigationController
        let infoVC = navVC.viewControllers.first as! InfoController
        infoVC.lastSelectedCardLabel.text = title
    }
    
    //MARK: - API
    
    private func fetchRingtones() {
        Service.fetchRingtones { cards, error in
            guard let cards = cards else { return }
            self.cards = cards
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK: - UICollectionViewDataSource

extension CardController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = cards[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.data = card
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = cards[indexPath.row]
        guard let title = card.title else { return }
        passTitleToInfoController(with: title)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CardController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

