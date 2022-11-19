//
//  Plant+CoreDataProperties.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/16/22.
//
//

import Foundation
import CoreData


extension Plant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }

    @NSManaged public var currentStageStart: String?
    @NSManaged public var growMedium: String?
    @NSManaged public var growStage: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var strainName: String
    @NSManaged public var careNotes: NSSet?
    @NSManaged public var growSpace: GrowSpace?
    @NSManaged public var imageAssets: NSSet?

}

// MARK: Generated accessors for careNotes
extension Plant {

    @objc(addCareNotesObject:)
    @NSManaged public func addToCareNotes(_ value: CareNote)

    @objc(removeCareNotesObject:)
    @NSManaged public func removeFromCareNotes(_ value: CareNote)

    @objc(addCareNotes:)
    @NSManaged public func addToCareNotes(_ values: NSSet)

    @objc(removeCareNotes:)
    @NSManaged public func removeFromCareNotes(_ values: NSSet)

}

// MARK: Generated accessors for imageAssets
extension Plant {

    @objc(addImageAssetsObject:)
    @NSManaged public func addToImageAssets(_ value: ImageAsset)

    @objc(removeImageAssetsObject:)
    @NSManaged public func removeFromImageAssets(_ value: ImageAsset)

    @objc(addImageAssets:)
    @NSManaged public func addToImageAssets(_ values: NSSet)

    @objc(removeImageAssets:)
    @NSManaged public func removeFromImageAssets(_ values: NSSet)

}

extension Plant : Identifiable {

}
