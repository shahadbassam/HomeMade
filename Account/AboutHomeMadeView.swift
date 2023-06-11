//
//  About Home made.swift
//  Home Made
//
//  Created by Jawaher Almutiri on 03/11/1444 AH.
//

import SwiftUI

struct AboutHomeMadeView: View {
    var body: some View {
        Text(" Home Made is an advancedelectronic\n  platform that provides accounts for\n productive families and makes it easier\n        for the user to access them.")
            .foregroundColor(Color("orange"))
            .font(.headline)
            .navigationTitle("About Home Made")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct About_Home_made_Previews: PreviewProvider {
    static var previews: some View {
        AboutHomeMadeView()
    }
}
