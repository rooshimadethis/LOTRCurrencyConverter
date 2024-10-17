//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Rooshi Patidar on 6/3/24.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            //background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    //.tracking(2)
                
                //description
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                //exchange rates
                ExchangeRateView(
                    leftImage: .goldpiece,
                    rightImage: .goldpenny,
                    exchangeRateText: "1 Gold Piece = 4 Gold Pennies"
                )
                
                ExchangeRateView(
                    leftImage: .goldpenny,
                    rightImage: .silverpiece,
                    exchangeRateText: "1 Gold Penny = 4 Silver Pieces"
                )
                
                ExchangeRateView(
                    leftImage: .silverpiece,
                    rightImage: .silverpenny,
                    exchangeRateText: "1 Silver Piece = 4 Silver Pennies"
                )

                ExchangeRateView(
                    leftImage: .silverpenny,
                    rightImage: .copperpenny,
                    exchangeRateText: "1 Silver Penny = 100 Copper Pennies"
                )

                
                
                //done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}


#Preview {
    ExchangeInfoView()
}
