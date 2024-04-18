//
//  RoomSize+CoreDataProperties.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/28/22.
//
//

import Foundation
import CoreData


extension RoomSize {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomSize> {
        return NSFetchRequest<RoomSize>(entityName: "RoomSize")
    }

    @NSManaged public var height: Double
    @NSManaged public var length: Double
    @NSManaged public var width: Double
    @NSManaged public var growSpace: GrowSpace?

}
