//
//  HomeModelOutput.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import Foundation

protocol HomeModelOutput: AnyObject {
    func modelDidLoad(_ items: HomeItem)
    func modelDidFail(_ error: Error?)
}
