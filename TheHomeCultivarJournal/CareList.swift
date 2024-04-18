//
//  CareList.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 2/1/22.
//

import SwiftUI

struct CareList: View {
    
    @StateObject var currentPlant: Plant
    
    var body: some View {
        VStack(alignment: .leading) {
//            if !plant.notes.isEmpty {
//                ForEach(0...plant.notes.count-1, id: \.self) {
//                    CareRow(careDate: plant.notes[$0].careDate, careNote: plant.notes[$0].careNote)
//                }
////            } else{
////                Text("Notes Appear Here.")
//            }
        }
    }
}

struct FeedingsList_Previews: PreviewProvider {
    
    static var previews: some View {
        CareList(currentPlant: Plant())
    }
}
