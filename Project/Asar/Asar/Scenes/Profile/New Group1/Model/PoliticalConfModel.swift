//
//  PoliticalConfModel.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 12.06.2022.
//

import Foundation
import UIKit

struct PoliticalConfModel: Hashable{
    let conflabel: String
    let firstlabel: String
    let secondlabel: String
    let thirdlabel: String
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(conflabel)
            hasher.combine(firstlabel)
            hasher.combine(secondlabel)
            hasher.combine(thirdlabel)
       }
}
