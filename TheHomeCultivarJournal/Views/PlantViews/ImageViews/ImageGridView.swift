//
//  ImageGridView.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/6/22.
//

import SwiftUI

struct ImageGridView: View {
    
   // @ObservedObject var imagesVM = ImageAssetsViewModel()
    //var assets: NSSet
    var images: [ImageAsset]
//    {
//        assets.allObjects as! [ImageAsset]
//    }
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 70, maximum: 100), spacing: nil, alignment: nil)
    ]
    
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(images, id: \.objectID) { image in
                
                Image(uiImage: UIImage(data: image.imageData!)!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                    .border(.white, width: 2.0)
                    //.shadow(color: .gray, radius: 1)
            }
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageGridView(images: [])
    }
}
