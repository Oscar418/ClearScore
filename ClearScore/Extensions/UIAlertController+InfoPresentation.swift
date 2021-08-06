//
//  UIAlertController+InfoPresentation.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import UIKit

extension UIAlertController {
    static func show(_ vc: UIViewController, error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
