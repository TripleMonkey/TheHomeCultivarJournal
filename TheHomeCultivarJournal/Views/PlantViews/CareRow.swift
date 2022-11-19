//
//  CareRow.swift
//  GrowHome
//
//  Created by Nigel Krajewski on 2/1/22.
//


import SwiftUI
import CoreData

struct CareRow: View {
    @State var isEditing = false
    var careDate: String
    var careNote: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline){
                    Text("Date:  ")
                        .sfRoundFont(for: .subheadline)
                    Text(careDate)
                        .sfRoundFont()
                    Spacer()
                    Button("Edit", action: { isEditing.toggle()} )
                        .sheet(isPresented: $isEditing) {
                            CareRow(careDate: careDate, careNote: careNote)
                        }
                        .padding()
                }
                .padding(.leading)
                .padding(.top)
                HStack(alignment: .firstTextBaseline){
                    Text("Notes:")
                        .sfRoundFont(for: .subheadline)
                    Text(careNote)
                        .sfRoundFont()
                }
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(UIColor.systemGray4))
                .overlay(RoundedRectangle(
                    cornerRadius: 5,
                    style: .continuous)
                            .stroke(Color.purple, lineWidth: 4)
                )
        }
    }
}

struct FeedingRow_Previews: PreviewProvider {
 //   static var modelData = ModelData.shared
//    static var date = modelData.notes[0].careDate
//    static var value = modelData.notes[0].careNote
    
    static var previews: some View {
        CareRow(careDate: "Date", careNote: "value")
    }
}
