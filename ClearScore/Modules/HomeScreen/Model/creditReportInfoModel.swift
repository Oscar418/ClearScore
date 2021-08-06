//
//  creditReportInfoModel.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import Foundation

struct creditReportInfo: Decodable {
    let score: Int?
    let maxScoreValue: Int?
    let minScoreValue: Int?
    let equifaxScoreBandDescription: String?
    let equifaxScoreBand: Int?
    let numPositiveScoreFactors: Int?
    let numNegativeScoreFactors: Int?
    let currentShortTermDebt: Int?
    let currentShortTermCreditLimit: Int?
    let changeInShortTermDebt: Int?
    let currentLongTermDebt: Int?
}
