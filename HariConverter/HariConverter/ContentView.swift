
import SwiftUI

struct ContentView: View {
    @State private var showExchangeInfor = false
    @State private var exchangeRate = 0.0
    @State private var currentAmount = ""
    @State private var exchangeAmount = ""

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Converter")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                VStack{
                    VStack {
                        HStack {
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text("silver piece")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        TextField("Amount", text: $currentAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                        .padding()
                    VStack {
                        HStack {
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text("gold piece")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        TextField("Amount", text: $exchangeAmount)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(10)
                .padding()
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfor.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                            .symbolEffect(.pulse)
                    }
                    .padding(.trailing)
            
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
