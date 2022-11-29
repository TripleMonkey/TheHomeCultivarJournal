//
//  PlantValues.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/28/22.
//

import Foundation
import SwiftUI

struct PlantValues {
    
    var strainName: String?
    var growStage: String?
    var growMedium: String?
    var startDate: Date?
    
    init(strainName: String? = nil, growStage: String? = nil, growMedium: String? = nil, startDate: Date? = nil) {
        self.strainName = strainName
        self.growStage = growStage
        self.growMedium = growMedium
        self.startDate = startDate
    }
}
