//
//  HomeModuleInitializer.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import UIKit

final class HomeModuleInitializer: NSObject {
    @IBOutlet weak var viewController: ViewController!
    override func awakeFromNib() {
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
}
