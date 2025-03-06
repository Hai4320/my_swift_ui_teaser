//
//  IconGrid.swift
//  HariConverter
//
//  Created by ho.duc.haib on 3/5/25.
//

import SwiftUI

struct IconGrid: View {
    let currency: Currency
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
