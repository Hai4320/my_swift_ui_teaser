//
//  IconGrid.swift
//  HariConverter
//
//  Created by ho.duc.haib on 3/5/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency
    var body: some View {
        HStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(Currency.allCases) { currency in
                    if (currency != selectedCurrency) {
                        ExchangeIcon(icon: currency.image, name: currency.name)
                            .onTapGesture {
                                selectedCurrency = currency
                            }
                    } else {
                        ExchangeIcon(icon: currency.image, name: currency.name)
                            .shadow(radius: 10)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .background(.black)
                                    .opacity(0.4)
                            }
                    }
                    
                }
            }
        }
    }
}
#Preview {
    @Previewable @State var selectedCurrency = Currency.goldPenny
    
    IconGrid(selectedCurrency: $selectedCurrency)
}
