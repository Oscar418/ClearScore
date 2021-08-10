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
        guard let url = URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values") else {
            output.modelDidFail(HomeModelError.invalidLink)
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            do {
                guard let jsonData = data else { return }
                let decoder = JSONDecoder()
                let items = try decoder.decode(HomeItem.self, from: jsonData)
                DispatchQueue.main.async {
                    self.output.modelDidLoad(items)
                }
            } catch {
                DispatchQueue.main.async {
                    self.output.modelDidFail(error)
                }
            }
        })
        task.resume()
    }
}
