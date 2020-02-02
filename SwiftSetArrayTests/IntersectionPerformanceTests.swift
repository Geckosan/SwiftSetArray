//
//  IntersectionPerformanceTests.swift
//  SwiftSetArrayTests
//
//  Created by Daniel Hudson on 01/02/2020.
//  Copyright © 2020 Heavy Gecko. All rights reserved.
//

import XCTest

class IntersectionPerformanceTests: XCTestCase {
	
	let lowerTen: [Int] = Array(0..<10)
	let upperTen: [Int] = Array(7..<17)
	let resultsTen = [7,8,9]
	
	let lowerThirty: [Int] = Array(0..<30)
	let upperThirty: [Int] = Array(20..<50)
	let resultsThirty: [Int] = Array(20..<30)
	
	let firstRandomHundred = [8,26,55,43,88,53,98,19,56,10,57,90,73,2,44,84,18,86,61,67,61,8,81,85,3,42,47,12,96,2,67,76,9,16,75,67,96,4,33,42,48,72,77,71,100,9,47,40,94,84,17,68,72,70,4,95,11,18,100,50,5,70,34,37,33,24,33,88,90,95,43,54,62,78,90,53,77,75,48,59,73,77,40,47,15,43,30,88,10,43,37,47,47,71,9,17,71,13,85,4]
	let secondRandomHundred = [37,12,38,16,64,90,60,95,30,24,17,89,33,38,38,74,22,40,3,16,22,17,96,59,49,28,52,29,1,73,57,86,96,88,56,35,92,60,27,45,95,16,97,19,60,57,55,59,93,81,21,59,13,95,31,4,33,73,76,20,68,95,59,28,18,59,98,11,10,25,45,94,70,100,49,66,16,96,31,65,5,82,2,58,2,91,64,8,13,71,35,85,68,11,69,8,92,11,31,7]
	
	var firstSortedHundred: [Int] = []
	var secondSortedHundred: [Int] = []
	var sortedIntersection: [Int] = []
	
	override func setUp() {
		let firstSet = Set<Int>(firstRandomHundred);
		let secondSet = Set<Int>(secondRandomHundred);
		firstSortedHundred = firstSet.sorted();
		secondSortedHundred = secondSet.sorted();
		sortedIntersection = firstSet.intersection(secondSet).sorted();
	}
	
	// MARK: SetArray Size 10
	func testIntersect10LowerFirstSetArray() {
		let initialLower = SetArray<Int>(self.lowerTen);
		let initialUpper = SetArray<Int>(self.upperTen);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.resultsTen);
	}
	func testIntersect10UpperFirstSetArray() {
		let initialLower = SetArray<Int>(self.lowerTen);
		let initialUpper = SetArray<Int>(self.upperTen);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.resultsTen);
	}
	func testIntersect10CombinedSetArray() {
		let initialLower = SetArray<Int>(self.lowerTen);
		let initialUpper = SetArray<Int>(self.upperTen);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.resultsTen);
	}
	
	// MARK: SetArray Size 30
	func testIntersect30LowerFirstSetArray() {
		let initialLower = SetArray<Int>(self.lowerThirty);
		let initialUpper = SetArray<Int>(self.upperThirty);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.resultsThirty);
	}
	func testIntersect30UpperFirstSetArray() {
		let initialLower = SetArray<Int>(self.lowerThirty);
		let initialUpper = SetArray<Int>(self.upperThirty);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.resultsThirty);
	}
	func testIntersect30CombinedSetArray() {
		let initialLower = SetArray<Int>(self.lowerThirty);
		let initialUpper = SetArray<Int>(self.upperThirty);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.resultsThirty);
	}
	
	// MARK: SetArray Random 100
	func testIntersectRandom100SetArray() {
		let initialFirst = SetArray<Int>(self.firstRandomHundred);
		let initialSecond = SetArray<Int>(self.secondRandomHundred);
		var workingSet: SetArray<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialFirst.intersection(initialSecond);
			}
		}
		XCTAssertTrue(initialFirst.asArray() == self.firstSortedHundred);
		XCTAssertTrue(initialSecond.asArray() == self.secondSortedHundred);
		XCTAssertTrue(workingSet.asArray() == self.sortedIntersection);
	}
	
	
	// MARK: Set Size 10
	func testIntersect10LowerFirstSet() {
		let initialLower = Set<Int>(self.lowerTen);
		let initialUpper = Set<Int>(self.upperTen);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.resultsTen);
	}
	func testIntersect10UpperFirstSet() {
		let initialLower = Set<Int>(self.lowerTen);
		let initialUpper = Set<Int>(self.upperTen);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.resultsTen);
	}
	func testIntersect10CombinedSet() {
		let initialLower = Set<Int>(self.lowerTen);
		let initialUpper = Set<Int>(self.upperTen);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.resultsTen);
	}
	
	// MARK: Set Size 30
	func testIntersect30LowerFirstSet() {
		let initialLower = Set<Int>(self.lowerThirty);
		let initialUpper = Set<Int>(self.upperThirty);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.resultsThirty);
	}
	func testIntersect30UpperFirstSet() {
		let initialLower = Set<Int>(self.lowerThirty);
		let initialUpper = Set<Int>(self.upperThirty);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.resultsThirty);
	}
	func testIntersect30CombinedSet() {
		let initialLower = Set<Int>(self.lowerThirty);
		let initialUpper = Set<Int>(self.upperThirty);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialLower.intersection(initialUpper);
				workingSet = initialUpper.intersection(initialLower);
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.resultsThirty);
	}
	
	// MARK: Set Random 100
	func testIntersectRandom100Set() {
		let initialFirst = Set<Int>(self.firstRandomHundred);
		let initialSecond = Set<Int>(self.secondRandomHundred);
		var workingSet: Set<Int> = [];
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialFirst.intersection(initialSecond);
			}
		}
		XCTAssertTrue(initialFirst.sorted() == self.firstSortedHundred);
		XCTAssertTrue(initialSecond.sorted() == self.secondSortedHundred);
		XCTAssertTrue(workingSet.sorted() == self.sortedIntersection);
	}
}
