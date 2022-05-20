//
//  BullseyesTests.swift
//  BullseyesTests
//
//  Created by Jackson Cuevas on 5/18/22.
//

import XCTest
@testable import bullseyes_swifUI

class BullseyesTests: XCTestCase {
    var game: Game!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testExample() throws {
        XCTAssertEqual(game.points(sliderValue: 50), 999)

    }
}
