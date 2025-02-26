//
//  ExchangeInfoItem.swift
//  HariConverter
//
//  Created by ho.duc.haib on 2/26/25.
//

import SwiftUI

struct ExchangeInfoItem: View {
    let imageLeft: ImageResource
    let imageRight: ImageResource
    let content: String
    var body: some View {
        HStack {
            Image(imageLeft)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
            Text(content)
            Image(imageRight)
                .resizable()
                .scaledToFit()
                .frame(height: 30)
        }
    }
}
#Preview {
    ExchangeInfoItem(imageLeft: .goldpiece, imageRight: .goldpenny, content: "1 Gold Piece = 4 Gold Pennies")
}
