//
//  CareNote+CoreDataProperties.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/28/22.
//
//

import Foundation
import CoreData


extension CareNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CareNote> {
        return NSFetchRequest<CareNote>(entityName: "CareNote")
    }

    @NSManaged public var note: String?
    @NSManaged public var timeStamp: Date?
    @NSManaged public var growSpace: GrowSpace?
    @NSManaged public var plant: Plant?

}
