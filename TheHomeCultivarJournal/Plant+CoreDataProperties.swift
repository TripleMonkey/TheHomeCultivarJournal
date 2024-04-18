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

    @NSManaged private var currentStageStart: Date?
    @NSManaged public var growMedium: String?
    @NSManaged public var growStage: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var strainName: String?
    @NSManaged public var careNotes: NSSet?
    @NSManaged public var growSpace: GrowSpace?
    @NSManaged public var imageAssets: NSSet?

    public var plantStageStartDate: Date {
        currentStageStart ?? Date()
    }
    public var plantMedium: String {
        growMedium ?? ""
    }
    public var plantStage: String {
        growStage ?? ""
    }
    public var plantStartDate: Date {
        startDate ?? Date()
    }
    public var plantStrain: String {
        strainName ?? ""
    }
    public var plantNotes: [CareNote] {
        let set = careNotes as? Set<CareNote> ?? []
        return set.sorted {
            $0.timeStamp < $1.timeStamp
        }
    }
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
    
    public var imageArray: [ImageAsset] {
        let set = imageAssets as? Set<ImageAsset> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

extension Plant : Identifiable {

}
