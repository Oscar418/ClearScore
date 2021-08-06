//
//  HomeModuleConfigurator.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import UIKit

final class HomeModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? ViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: ViewController) {
        let model = HomeModel()
        model.output = viewController
        viewController.model = model
    }
}
