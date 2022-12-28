//
//  DeviceSettings.swift
//  TheHomeCultivarJournal
//
//  Created by Nigel Krajewski on 12/6/22.
//

import SwiftUI

struct DeviceSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("darkMode") var darkMode: Bool = false
    @AppStorage("userName") var userName: String = ""
    @Binding var isShown: Bool
    
    
    var body: some View {
        if isShown {
            ZStack {
                Color("NavBgColor")
                VStack(spacing: 20) {
                    HStack {
                        Text("User Name:")
                            .padding()
                        TextField("User name", text: $userName)
                            .padding()
                    }
                    
                    HStack {
                        Toggle(isOn: $darkMode) {
                            Text("Dark Mode:")
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Button("Save".uppercased()) {
                        isShown.toggle()
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

//struct DeviceSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        DeviceSettingsView(isShown: true)
//    }
//}
