//
//  DetailsModuleInitializer.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/06.
//

import UIKit

final class DetailsModuleInitializer: NSObject {
    @IBOutlet weak var viewController: DetailsViewController!
    
    override func awakeFromNib() {
        let configurator = DetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
}
