//
//  Plant+CoreDataClass.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 10/22/22.
//
//

import Foundation
import CoreData

@objc(Plant)
public class Plant: NSManagedObject {

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        growMedium = "None"
        growStage = "N/A"
        id = UUID()
        name = "N/A"
        startDate = Date()
        strainName = "N/A"
    }
}
