//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Rooshi Patidar on 6/17/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title: Text {
        Text("Change Currency")
    }
    
    var message: Text? {
        Text("Tap on either currency to change it")
    }
    
    
}
