//
//  picView.swift
//  HomeMade
//
//  Created by shahad on 05/11/1444 AH.
//

import SwiftUI

struct picView: View {
    var body: some View {
       Image("HomeLogo")
            .clipShape(Square())
            .overlay (Circle().stroke(Color.white , lineWidth: 4))
            .shadow(radius: 7)
            }
    }


struct picView_Previews: PreviewProvider {
    static var previews: some View {
        picView()
    }
}

