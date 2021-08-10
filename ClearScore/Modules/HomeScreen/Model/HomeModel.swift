//
//  HomeModel.swift
//  ClearScore
//
//  Created by Oscar on 2021/08/05.
//

import Foundation

enum HomeModelError: Error {
    case invalidLink
}

extension HomeModelError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidLink:
            return "Something is wrong with the link"
        }
    }
}

final class HomeModel: HomeModelInput {
    weak var output: HomeModelOutput!
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let url = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values") else {
                self?.output.modelDidFail(HomeModelError.invalidLink)
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let items = try decoder.decode(HomeItem.self, from: data)
                DispatchQueue.main.async {
                    self?.output.modelDidLoad(items)
                }
            } catch {
                DispatchQueue.main.async {
                    self?.output.modelDidFail(error)
                }
            }
        }
    }
}
