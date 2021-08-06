//
//  Currency.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/06.
//

import Foundation

class Currency {
    func getCurrency(amount: Int) -> String{
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        return "\(currencySymbol) \(amount)"
    }
}
