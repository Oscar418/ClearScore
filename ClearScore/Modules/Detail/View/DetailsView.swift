//
//  DetailsView.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/06.
//

import UIKit

final class DetailsView: UIView {
    let currency = Currency()
    @IBOutlet weak var scoreStatusLabel: UILabel!
    @IBOutlet weak var minScoreLabel: UILabel!
    @IBOutlet weak var maxScoreLabel: UILabel!
    @IBOutlet weak var equifaxStatusLabel: UILabel!
    @IBOutlet weak var equifaxScoreLabel: UILabel!
    @IBOutlet weak var positiveFactorLabel: UILabel!
    @IBOutlet weak var negativeFactorLabel: UILabel!
    @IBOutlet weak var shortTermDebtLabel: UILabel!
    @IBOutlet weak var shortTermCreditLabel: UILabel!
    @IBOutlet weak var changeInShortTermDebtLabel: UILabel!
    @IBOutlet weak var longTermDebtLabel: UILabel!
}

extension DetailsView: DetailsViewInput {
    func display(_ item: HomeItem) {
        let score = item.creditReportInfo?.score ?? 0
        let minScore = item.creditReportInfo?.minScoreValue ?? 0
        let maxScore = item.creditReportInfo?.maxScoreValue ?? 0
        let equifaxStatus = item.creditReportInfo?.equifaxScoreBandDescription ?? ""
        let equifaxScore = item.creditReportInfo?.equifaxScoreBand ?? 0
        let positiveFactor = item.creditReportInfo?.numPositiveScoreFactors ?? 0
        let negativeFactor = item.creditReportInfo?.numNegativeScoreFactors ?? 0
        let shortTermDebt = item.creditReportInfo?.currentShortTermDebt ?? 0
        let shortTermCredit = item.creditReportInfo?.currentShortTermCreditLimit ?? 0
        let changeInShortDebt = item.creditReportInfo?.changeInShortTermDebt ?? 0
        let longTermDebt = item.creditReportInfo?.currentLongTermDebt ?? 0
        scoreStatusLabel.text = "\(score)"
        minScoreLabel.text = "Min score: \(minScore)"
        maxScoreLabel.text = "Max score: \(maxScore)"
        equifaxStatusLabel.text = equifaxStatus
        equifaxScoreLabel.text = "\(equifaxScore)"
        positiveFactorLabel.text = "\(positiveFactor)"
        negativeFactorLabel.text = "\(negativeFactor)"
        shortTermDebtLabel.text = currency.getCurrency(amount:shortTermDebt)
        shortTermCreditLabel.text = currency.getCurrency(amount:shortTermCredit)
        changeInShortTermDebtLabel.text = currency.getCurrency(amount: changeInShortDebt)
        longTermDebtLabel.text = currency.getCurrency(amount: longTermDebt)
    }
}
