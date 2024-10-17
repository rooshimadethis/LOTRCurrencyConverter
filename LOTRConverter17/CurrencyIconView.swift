//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Rooshi Patidar on 6/10/24.
//

import SwiftUI

struct CurrencyIconView: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            //Currency Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            //Currency Name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIconView(currencyImage: .copperpenny, currencyName: "Copper Penny")
}
