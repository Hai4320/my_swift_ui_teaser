import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedFromCurrency: Currency
    @Binding var selectedToCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Exchange from:")
                    .font(.title)
                    .tracking(3)
                IconGrid(selectedCurrency: $selectedFromCurrency)
                Text("Exchange to:")
                    .font(.title)
                    .tracking(3)
                IconGrid(selectedCurrency: $selectedToCurrency)
               
                Button("OK") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .padding()
            }
        }
    }
}


#Preview {
    
    @Previewable  @State var selectedFromCurrency =  Currency.copperPenny
    @Previewable @State var selectedToCurrency =  Currency.goldPenny
    
    SelectCurrency(selectedFromCurrency: $selectedFromCurrency, selectedToCurrency: $selectedToCurrency)
}
