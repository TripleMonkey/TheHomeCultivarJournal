//
//  CircleCrop.swift
//  THCJournal
//
//  Created by Nigel Krajewski on 1/13/23.
//

import SwiftUI

struct CircleCrop: View {
    
    var image: Image
    
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.brown, lineWidth: 4)
            )
            .shadow(radius: 7)
            .padding()
    }
}

struct CirclCrop_Previews: PreviewProvider {
    static var previews: some View {
        CircleCrop(image: Image("budonpurplebg"))
    }
}
