//
//  DetailsModuleConfigurator.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/06.
//

import UIKit

final class DetailsModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? DetailsViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: DetailsViewController) {
        let model = DetailsModel()
        model.output = viewController
        viewController.model = model
    }
}
