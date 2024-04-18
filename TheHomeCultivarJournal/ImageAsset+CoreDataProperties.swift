//
//  ImageAsset+CoreDataProperties.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/28/22.
//
//

import Foundation
import CoreData


extension ImageAsset {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageAsset> {
        return NSFetchRequest<ImageAsset>(entityName: "ImageAsset")
    }

    @NSManaged public var imageData: Data?
    @NSManaged public var growSpace: GrowSpace?
    @NSManaged public var plant: Plant?

}
