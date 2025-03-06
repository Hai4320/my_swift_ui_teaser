import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency: Currency?
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
                Text("Exchange to:")
                    .font(.title)
                    .tracking(3)
                
               
              
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
    SelectCurrency(selectedCurrency: .goldPenny)
}
