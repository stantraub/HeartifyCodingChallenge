//
//  Carousel.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/25/20.
//

import UIKit
import iCarousel

class CardController: UIViewController {
    
    //MARK: - Properties
    
    var cards = [Card]()
    
    private let cardCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
//        view.scrollToItem(at: 0, animated: true)
//        view.autoscroll = -0.4
        return view
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
//        view.addSubview(collectionView)
        configureCarousel()
    }
    
    private func configureCarousel() {
        view.addSubview(cardCarousel)
        let centerY = (view.frame.height / 2) - (view.frame.height * 0.4 / 2)
        cardCarousel.frame = CGRect(x: 0, y: centerY, width: view.frame.width, height: view.frame.height * 0.4)
        cardCarousel.dataSource = self
        cardCarousel.delegate = self
    }
    
    private func passTitleToInfoController(with title: String) {
        let navVC = tabBarController?.viewControllers?[1] as! UINavigationController
        let infoVC = navVC.viewControllers.first as! InfoController
        infoVC.lastSelectedCardLabel.text = title
    }
    
    private func configureAlert(with title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }
    
    
  
    
    //MARK: - API
    
    private func fetchRingtones() {
        Service.fetchRingtones { cards, error in
            guard let cards = cards else { return }
            self.cards = cards
            
            DispatchQueue.main.async {
                self.cardCarousel.reloadData()
            }
        }
    }
}

//MARK: - iCarouselDataSource

extension CardController: iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return cards.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {

        let cardWidth = self.view.frame.width * 0.8
        let cardHeight = self.view.frame.height * 0.4
        let view = CardCell(frame: CGRect(x: 0, y: 400, width: cardWidth, height: cardHeight))
        view.data = cards[index]
        return view
    }
}

extension CardController: iCarouselDelegate {
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let card = cards[index]
        guard let title = card.title else { return }
        passTitleToInfoController(with: title)
        configureAlert(with: title)
    }
}
