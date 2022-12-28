//
//  ObjectViewModel.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 11/16/22.
//

import SwiftUI
import CoreData

final class PlantViewModel: ObservableObject {
    
    
    @Published var strainName = ""
    @Published var growStage = ""
    @Published var growMedium = ""
    @Published var startDate = Date()
    @Published var ID: NSManagedObjectID?
    @Published var imageAssets: [ImageAsset] = []
    @Published var currentImageAsset: ImageAsset?
    
    @Published var currentPlant: Plant?
    @Published var headlineImage = Image(systemName: "fanblades.fill")
    
    
    init(for plant: Plant? = nil)  {
        guard let existingPlant = plant else { return }
        self.currentPlant = existingPlant
        self.ID = existingPlant.objectID
        self.strainName = existingPlant.strainName
        self.growStage = existingPlant.growStage ?? "n/a"
        self.growMedium = existingPlant.growMedium ?? ""
        self.startDate = existingPlant.startDate ?? Date()
        //self.imageAssets = existingPlant.imageAssets
        fetchImages()
        if !imageAssets.isEmpty {
            guard let returnData = imageAssets[0].imageData,
                  let uiImage = UIImage(data: returnData) else { return }
            headlineImage = Image(uiImage: uiImage)
        }
    }
    
    func fetchImages() {
        let request = NSFetchRequest<ImageAsset>(entityName: "ImageAsset")
        request.predicate = NSPredicate(format: "plant == %@", ID!)
        do {
            imageAssets = try PersistenceController.shared.container.viewContext.fetch(request)
            
            print("images: \(imageAssets.count)")
        } catch let error {
            print("ERROR FETCHING: \(error)")
        }
    }
    
    func objectId(plant: Plant) {
        self.ID = plant.objectID
    }
    
    // Use on buttons to disable save actions when true
    func isValidObject() -> Bool {
        return !strainName.isEmpty
    }
    
    func updatePlant() {
        var object: Plant
        if self.ID == nil {
            object = Plant(context: PersistenceController.shared.container.viewContext)
        } else {
            guard let id = ID else {
                return
            }
            object = PersistenceController.shared.container.viewContext.object(with: id) as! Plant
        }
        object.strainName = strainName
        object.startDate = startDate
        object.growStage = growStage
        object.growMedium = growMedium
        // Update data VM
        updateImages(plant: object)
    }
    
    // MARK: Functions to keep reference objects current
    private func updateImages(plant: Plant) {
        guard let image = currentImageAsset else { return }
            plant.addToImageAssets(image)
            currentPlant = plant
    }
}
