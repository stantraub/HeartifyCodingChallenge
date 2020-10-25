//
//  Service.swift
//  HeartifyCodingChallenge
//
//  Created by Stanley Traub on 10/24/20.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Service {
    static func fetchRingtones(completion: @escaping ([Card]?, Error?) -> Void) {
        AF.request("https://ringtones-kodi.s3.amazonaws.com/data/top_ringtones.json").responseJSON { response in
            guard let data = response.data else { return }
            do {
                let json = try JSON(data: data)
                let cards = try JSONDecoder().decode([Card].self, from: try json.rawData())
                completion(cards, nil)
                
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }
    }
}
