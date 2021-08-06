//
//  HomeView.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import UIKit

protocol HomeViewInput: AnyObject {
    var itemAction: (() -> Void)? { get set }
    func activity(_ show: Bool)
    func display(_ items: HomeItem)
    func drawCircle(_ view: UIView)
}

final class HomeView: UIView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    var itemAction: (() -> Void)?
    @IBAction func viewDetailsDidTap(_ sender: Any) {
        itemAction?()
    }
}

extension HomeView: HomeViewInput {
    func activity(_ show: Bool) {
        show ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        activityIndicator.isHidden = !show
    }
    
    func display(_ item: HomeItem) {
        let score = item.creditReportInfo?.score ?? 0
        let totalScoreText = item.creditReportInfo?.maxScoreValue ?? 0
        scoreLabel.text = "\(score)"
        totalScoreLabel.text = "out of \(totalScoreText)"
    }
    
    func drawCircle(_ view: UIView) {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: width/2, y: height/2), radius: CGFloat(125), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        view.layer.addSublayer(shapeLayer)
    }
}
