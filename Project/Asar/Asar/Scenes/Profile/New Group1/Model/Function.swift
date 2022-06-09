//
//  image.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 09.06.2022.
//

import Foundation
import UIKit

struct Function: Hashable{
    let labelFunction: String

    
    func hash(into hasher: inout Hasher) {
           hasher.combine(labelFunction)
       }
}
