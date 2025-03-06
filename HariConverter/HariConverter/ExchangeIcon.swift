//
//  ExchangeIcon.swift
//  HariConverter
//
//  Created by ho.duc.haib on 2/27/25.
//

import SwiftUI

struct ExchangeIcon: View {
    let icon: ImageResource
    let name: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(icon)
                .resizable()
                .scaledToFit()
            Text(name)
                .padding(3)
                .font(.caption)
                .foregroundColor(.white)
                .frame(width: .infinity)
                .background(.brown)
        }
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    ExchangeIcon(icon: .copperpenny, name: "Copper Penny")
}
