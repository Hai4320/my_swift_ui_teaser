import SwiftUI

struct ContentView: View {
    @State private var showExchangeInfor = false
    @State private var showSelectCurrency = false
    @State private var exchangeRate = 0.0
    @State private var currentAmount = ""
    @State private var exchangeAmount = ""
    @FocusState private var currentTyping
    @FocusState private var exchangeTyping
    @State var fromCurrency = Currency.goldPenny
    @State var toCurrency = Currency.silverPenny

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
                            Image(fromCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text(fromCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $currentAmount)
                            .focused($currentTyping)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .onChange(of: currentAmount) {
                                if currentTyping == true {
                                    exchangeAmount = fromCurrency.convert(amountString: currentAmount, currency: toCurrency)
                                }
                            }
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                        .padding()
                    VStack {
                        HStack {
                            Image(toCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text(toCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $exchangeAmount)
                            .focused($exchangeTyping)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .multilineTextAlignment(.center)
                            .onChange(of: exchangeAmount) {
                                if exchangeTyping == true {
                                    currentAmount = toCurrency.convert(amountString: exchangeAmount, currency: fromCurrency)
                                }
                            }
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
        .sheet(isPresented: $showExchangeInfor) {
            InfoView()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(selectedFromCurrency: fromCurrency, selectedToCurrency: toCurrency)
        }
    }
}

#Preview {
    ContentView()
}
