//
//  ViewController.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import UIKit

protocol DetailsViewInput: AnyObject, HomeItemViewType {}

final class ViewController: UIViewController {
    var model: HomeModelInput!
    lazy var contentView: HomeViewInput = { return view as! HomeViewInput }()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.activity(true)
        contentView.drawBaseCircle(view)
        model.load()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
            let controller = segue.destination as? DetailsViewControllerInput,
            let item = sender as? HomeItem {
            controller.set(item)
        }
    }
}

extension ViewController: HomeModelOutput {
    func modelDidLoad(_ items: HomeItem) {
        contentView.activity(false)
        contentView.display(items)
        contentView.drawCircle(view, score: items.creditReportInfo?.score ?? 0)
        contentView.itemAction = { [unowned self] in
            self.performSegue(withIdentifier: "showDetails", sender: items)
        }
    }
    
    func modelDidFail(_ error: Error?) {
        contentView.activity(false)
        UIAlertController.show(self, error: error)
    }
}

extension ViewController: HomeViewControllerInput {}
