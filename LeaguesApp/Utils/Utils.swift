//
//  Utils.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 15/08/23.
//

import Foundation
import Kingfisher
import SwiftUI

class Utils {
    class func loadImageWithUrlForImageView(url: String, imageView: UIImageView) {
        
        imageView.kf.indicatorType = .activity
        let image = KF.ImageResource.init(downloadURL: URL(string: url)!, cacheKey: url)
        
        imageView.kf.setImage(with: image, options:[.cacheSerializer(DefaultCacheSerializer.default)]) { result in
            switch result {
            case .success(_): break
            case .failure(_):
                break
            }
        }
        
    }
}
