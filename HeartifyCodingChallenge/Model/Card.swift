//
//  Card.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/24/20.
//

import Foundation

struct Card: Decodable {
    let description: String?
    let backgroundImage: URL?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case description, title
        
        // Map img urls
        case backgroundImage = "image_aws_url"
    }
}
