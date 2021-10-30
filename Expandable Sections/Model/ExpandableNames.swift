//
//  ExpandableNames.swift
//  Expandable Sections
//
//  Created by Esraa Eid on 17/02/2021.
//

import Foundation

protocol Persons { }

class ExpandableNames: Persons {
    var isExpanded: Bool
    let names: [String]
    
    init(isExpanded: Bool, names: [String]) {
         self.isExpanded = isExpanded
         self.names = names
     }
}



