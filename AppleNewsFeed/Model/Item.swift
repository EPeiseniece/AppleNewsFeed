//
//  File.swift
//  AppleNewsFeed
//
//  Created by elina.peiseniece on 27/08/2021.
//

import UIKit
import Gloss

class Item: JSONDecodable {
    
    var desciption: String
    var title: String
    var url: String
    var urlToImage: String
    var image: UIImage?
    var publishedAt: String
    
    
    required init?(json: JSON) {
        self.desciption = "description" <~~ json ?? ""
        self.title = "title" <~~ json ?? ""
        self.url = "url" <~~ json ?? ""
        self.urlToImage = "urlToImage" <~~ json ?? ""
        self.publishedAt = "publishedAt" <~~ json ?? ""
        
        DispatchQueue.main.async {
            self.image = self.loadImage()
        }
    }
    
    private func loadImage() -> UIImage? {
        var returnImage: UIImage?
        
        guard let url = URL(string: urlToImage) else {
            return returnImage
        }
        if let data = try? Data(contentsOf: url){
            if let image = UIImage(data: data){
                returnImage = image
            }
        }
        return returnImage
        
    }
    
    
    
}

