//
//  IconGridView.swift
//  LOTRConverter17
//
//  Created by Rooshi Patidar on 6/16/24.
//

import SwiftUI

struct IconGridView: View {
    
    @Binding var selectedCurrency: Currency

    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) //3 for the number we want in a column
        {
            ForEach(Currency.allCases) { currency in
                if currency == selectedCurrency {
                    
                    CurrencyIconView(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                    
                } else {
                    
                    CurrencyIconView(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                    
                }
            }
        }    }
}

#Preview {
    IconGridView(selectedCurrency: .constant(Currency.goldPiece))
}
