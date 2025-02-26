import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Exchange Rates")
                    .font(.title)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding()
                    .font(.title3)
                ExchangeInfoItem(imageLeft: .goldpiece, imageRight: .goldpenny, content: "1 Gold Piece = 4 Gold Pennies")
                ExchangeInfoItem(imageLeft: .goldpenny, imageRight: .silverpenny, content: "4 Gold Penny = 4 Silver Pennies")
                ExchangeInfoItem(imageLeft: .silverpiece, imageRight: .silverpenny, content: "1 Silver Penny = 4 Silver Pennies")
                ExchangeInfoItem(imageLeft: .silverpenny, imageRight: .copperpenny, content: "1 Silver Penny = 100 Copper Pennies")
                Button("OK") {
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .padding()
            }
        }
    }
}


#Preview {
    InfoView()
}
