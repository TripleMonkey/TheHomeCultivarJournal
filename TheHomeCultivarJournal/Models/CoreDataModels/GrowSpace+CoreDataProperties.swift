//
//  GrowSpace+CoreDataProperties.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/28/22.
//
//

import Foundation
import CoreData


extension GrowSpace {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GrowSpace> {
        return NSFetchRequest<GrowSpace>(entityName: "GrowSpace")
    }

    @NSManaged private var enclosed: Bool
    @NSManaged private var careNotes: NSSet?
    @NSManaged private var imageAssets: NSSet?
    @NSManaged private var lightSources: NSSet?
    @NSManaged private var plants: NSSet?
    @NSManaged private var roomSize: RoomSize?
    
//    public var spaceEnclosed: Bool {
//        enclosed ?? true
//    }
//    public var spaceCareNotes: [CareNotes] {
//        
//    }
//    public var 
//    public var 
//    public var 
//    public var 
//    
}

// MARK: Generated accessors for careNotes
extension GrowSpace {

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
extension GrowSpace {

    @objc(addImageAssetsObject:)
    @NSManaged public func addToImageAssets(_ value: ImageAsset)

    @objc(removeImageAssetsObject:)
    @NSManaged public func removeFromImageAssets(_ value: ImageAsset)

    @objc(addImageAssets:)
    @NSManaged public func addToImageAssets(_ values: NSSet)

    @objc(removeImageAssets:)
    @NSManaged public func removeFromImageAssets(_ values: NSSet)

}

// MARK: Generated accessors for lightSources
extension GrowSpace {

    @objc(addLightSourcesObject:)
    @NSManaged public func addToLightSources(_ value: LightSource)

    @objc(removeLightSourcesObject:)
    @NSManaged public func removeFromLightSources(_ value: LightSource)

    @objc(addLightSources:)
    @NSManaged public func addToLightSources(_ values: NSSet)

    @objc(removeLightSources:)
    @NSManaged public func removeFromLightSources(_ values: NSSet)

}

// MARK: Generated accessors for plants
extension GrowSpace {

    @objc(addPlantsObject:)
    @NSManaged public func addToPlants(_ value: Plant)

    @objc(removePlantsObject:)
    @NSManaged public func removeFromPlants(_ value: Plant)

    @objc(addPlants:)
    @NSManaged public func addToPlants(_ values: NSSet)

    @objc(removePlants:)
    @NSManaged public func removeFromPlants(_ values: NSSet)

}
