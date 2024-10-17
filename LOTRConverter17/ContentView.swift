//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Rooshi Patidar on 5/19/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var showExchangeInfo = false
    @State private var showSelectCurrency = false
    
    @State private var leftAmount = ""
    @State private var leftCurrency: Currency = .silverPiece
    @FocusState private var leftTyping
    
    @State private var rightAmount = ""
    @State private var rightCurrency: Currency = .goldPiece
    //@FocusState private var rightTyping
    
    
    var body: some View {
        ZStack {
            //background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                //prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //Conversion section
                HStack {
                    
                    //Left conversion section
                    VStack {
                        
                        //Currency
                        HStack {
                            //currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(.top)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .top)
                        
                        //Text Field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
                        
                    }
                    
                    
                    //Equals
                    Image(systemName: "equal")
                        .font(.title)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //Right conversion section
                    VStack {
                        
                        //Currency
                        HStack {
                            //currency image
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(.top)
                            //currency text
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        //Text Field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            //.focused($rightTyping)
                            .keyboardType(.decimalPad)
                    }

                }
                .padding()
                .background(.black.opacity(0.8))
                .sheet(isPresented: $showSelectCurrency, content: {
                    SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                })
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate)
                    ])
                }
                .onChange(of: leftAmount, {
                    if (leftTyping) {
                        rightAmount = leftCurrency.convertTo(leftAmount, to: rightCurrency)
                    }
                })
                .onChange(of: rightAmount, {
                    if !leftTyping {
                        leftAmount = rightCurrency.convertTo(rightAmount, to: leftCurrency)
                    }
                })
                .onChange(of: leftCurrency) {
                leftAmount = rightCurrency.convertTo(rightAmount, to: leftCurrency)
                }
                .onChange(of: rightCurrency) {
                    rightAmount = leftCurrency.convertTo(leftAmount, to: rightCurrency)
                }
                
                Spacer()
                    
                HStack {
                    
                    Spacer()
                    
                    //Info button
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfoView()
                    }
                }
            }
            .padding(.top, 30)
        }
    }
}

#Preview {
    ContentView()
}
