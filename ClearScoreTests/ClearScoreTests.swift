//
//  ClearScoreTests.swift
//  ClearScoreTests
//
//  Created by Oscar on 2021/08/05.
//

import XCTest
@testable import ClearScore

class ClearScoreTests: XCTestCase {
    weak var output: HomeModelOutput!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ClearScoreTests {
    func testCreditReportInfoDataModel() throws {
        if let path = Bundle.main.path(forResource: "creditDataMock", ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let items = try decoder.decode(HomeItem.self, from: data)
            let score = items.creditReportInfo?.score ?? 0
            let maxScore = items.creditReportInfo?.maxScoreValue ?? 0
            let minScore = items.creditReportInfo?.minScoreValue ?? 0
            let equifaxScoreDescription = items.creditReportInfo?.equifaxScoreBandDescription ?? ""
            XCTAssertEqual(score, 514)
            XCTAssertEqual(maxScore, 700)
            XCTAssertEqual(minScore, 0)
            XCTAssertEqual(equifaxScoreDescription, "Excellent")
        } else {
            print("Can't find json file")
        }
    }
    
    func testSouthAfricanCurrencyUsed() throws {
        let currency = Currency()
        if let path = Bundle.main.path(forResource: "creditDataMock", ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let items = try decoder.decode(HomeItem.self, from: data)
            let shortTermDebt = currency.getCurrency(amount: items.creditReportInfo?.currentShortTermDebt ?? 0)
            XCTAssertEqual(shortTermDebt, "R 13758")
        } else {
            print("Can't find json file")
        }
    }
    
    func testDashboardOutletsConnected() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(
            identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        let customView = sut.view as! HomeView
        XCTAssertNotNil(customView.scoreLabel, "score label is not connected")
        XCTAssertNotNil(customView.totalScoreLabel, "total score label is not connected")
        XCTAssertNotNil(customView.viewDetailsDidTap(_:), "view details button is not connected")
    }
}
