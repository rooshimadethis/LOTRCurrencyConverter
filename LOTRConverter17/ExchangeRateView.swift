//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Rooshi Patidar on 6/4/24.
//

import SwiftUI

struct ExchangeRateView: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let exchangeRateText: String
    
    var body: some View {
        HStack {
            
            //left current image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //exchange rate text
            Text(exchangeRateText)
            
            //right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRateView(
        leftImage: .goldpiece,
        rightImage: .goldpenny,
        exchangeRateText: "1 Gold Piece = 4 Gold Pennies"
    )
}
