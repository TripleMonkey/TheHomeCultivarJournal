//
//  LightSource+CoreDataProperties.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/28/22.
//
//

import Foundation
import CoreData


extension LightSource {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LightSource> {
        return NSFetchRequest<LightSource>(entityName: "LightSource")
    }

    @NSManaged public var artificial: Bool
    @NSManaged public var type: String?
    @NSManaged public var watts: Double
    @NSManaged public var growSpace: GrowSpace?

}
