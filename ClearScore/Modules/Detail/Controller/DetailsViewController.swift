//
//  DetailsViewController.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/06.
//

import UIKit

final class DetailsViewController: UIViewController {

    var model: DetailsModelInput!
    lazy var contentView: DetailsViewInput = { return view as! DetailsViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.display(model.item)
    }
}

extension DetailsViewController: DetailsModelOutput {}

extension DetailsViewController: DetailsViewControllerInput {
    func set(_ item: HomeItem) {
        model.item = item
    }
}
