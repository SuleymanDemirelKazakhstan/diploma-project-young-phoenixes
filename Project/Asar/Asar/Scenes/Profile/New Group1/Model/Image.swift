//
//  image.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 09.06.2022.
//

import Foundation
import UIKit

struct ImageAvatar: Hashable {
    let imageView: UIImage
    let labelImage: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imageView)
        hasher.combine(labelImage)
    }
}
