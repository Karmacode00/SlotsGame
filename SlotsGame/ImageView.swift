//
//  ImageView.swift
//  SlotsGame
//
//  Created by Andrea on 18-03-22.
//

import SwiftUI

struct ImageView: View {
    @Binding var image:String
    @Binding var background:Color
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.5))
            .cornerRadius(20)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Binding.constant("cherry"), background: Binding.constant(Color.green))
        }
}
