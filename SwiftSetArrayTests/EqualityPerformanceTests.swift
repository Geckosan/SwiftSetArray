//
//  EqualityPerformanceTests.swift
//  SwiftSetArrayTests
//
//  Created by Daniel Hudson on 01/02/2020.
//  Copyright © 2020 Heavy Gecko. All rights reserved.
//

import XCTest

class EqualityPerformanceTests: XCTestCase {
	
	let sortedTen = [0, 7, 11, 28, 33, 46, 49, 58, 62, 82]
	let shuffledTen = [0, 11, 49, 58, 46, 7, 33, 28, 82, 62]
	var reversedTen: [Int] = []
	
	let sortedThirty = [0, 2, 4, 11, 15, 16, 21, 23, 25, 28, 29, 30, 33, 35, 38, 40, 44, 45, 50, 52, 58, 63, 72, 85, 88, 90, 91, 92, 95, 96]
	let shuffledThirty = [88, 30, 38, 11, 63, 40, 35, 16, 25, 0, 91, 50, 33, 92, 2, 28, 72, 95, 23, 96, 85, 45, 44, 15, 58, 29, 4, 52, 90, 21]
	var reversedThirty: [Int] = []
	
	let sortedHundred = [0, 6, 8, 10, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 33, 34, 35, 39, 44, 47, 49, 51, 56, 57, 59, 61, 62, 64, 66, 69, 70, 77, 80, 81, 82, 83, 86, 89, 94, 99, 102, 103, 109, 113, 114, 118, 120, 121, 122, 124, 133, 134, 136, 138, 141, 142, 144, 147, 150, 153, 154, 159, 160, 162, 165, 166, 170, 173, 174, 177, 185, 187, 188, 189, 192, 193, 195, 198, 202, 206, 207, 209, 211, 212, 213, 214, 216, 217, 220, 221, 222, 225, 227, 232, 234, 242, 244, 250, 251, 254]
	let shuffledHundred = [114, 217, 35, 94, 66, 13, 141, 209, 254, 18, 160, 83, 198, 133, 251, 202, 80, 216, 99, 232, 20, 211, 82, 61, 81, 189, 23, 187, 250, 62, 177, 185, 57, 242, 70, 21, 113, 195, 124, 212, 15, 142, 174, 16, 220, 221, 64, 59, 173, 134, 49, 121, 86, 120, 144, 33, 193, 159, 214, 22, 47, 206, 147, 118, 0, 34, 165, 109, 56, 213, 225, 188, 44, 234, 122, 39, 136, 102, 166, 19, 77, 170, 227, 10, 69, 207, 51, 138, 89, 150, 222, 192, 8, 162, 103, 154, 6, 14, 244, 153]
	var reversedHundred: [Int] = []
	
	override func setUp() {
		reversedTen = sortedTen.reversed();
		reversedThirty = sortedThirty.reversed();
		reversedHundred = sortedHundred.reversed();
	}
	
	// MARK: SetArray Size 10
	func testCompareSet10SetArray() {
		let initialSet = SetArray<Int>(self.sortedTen);
		let reversedSet = SetArray<Int>(self.reversedTen);
		let shuffledSet = SetArray<Int>(self.shuffledTen);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet == reversedSet);
				XCTAssertTrue(initialSet == shuffledSet);
				XCTAssertTrue(reversedSet == shuffledSet);
			}
		}
	}
	func testCompareArray10SetArray() {
		let initialSet = SetArray<Int>(self.sortedTen);
		let reversedSet = SetArray<Int>(self.reversedTen);
		let shuffledSet = SetArray<Int>(self.shuffledTen);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet.asArray() == self.sortedTen);
				XCTAssertTrue(reversedSet.asArray() == self.sortedTen);
				XCTAssertTrue(shuffledSet.asArray() == self.sortedTen);
			}
		}
	}
	
	// MARK: SetArray Size 30
	func testCompareSet30SetArray() {
		let initialSet = SetArray<Int>(self.sortedThirty);
		let reversedSet = SetArray<Int>(self.reversedThirty);
		let shuffledSet = SetArray<Int>(self.shuffledThirty);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet == reversedSet);
				XCTAssertTrue(initialSet == shuffledSet);
				XCTAssertTrue(reversedSet == shuffledSet);
			}
		}
	}
	func testCompareArray30SetArray() {
		let initialSet = SetArray<Int>(self.sortedThirty);
		let reversedSet = SetArray<Int>(self.reversedThirty);
		let shuffledSet = SetArray<Int>(self.shuffledThirty);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet.asArray() == self.sortedThirty);
				XCTAssertTrue(reversedSet.asArray() == self.sortedThirty);
				XCTAssertTrue(shuffledSet.asArray() == self.sortedThirty);
			}
		}
	}
	
	// MARK: SetArray Size 100
	func testCompareSet100SetArray() {
		let initialSet = SetArray<Int>(self.sortedHundred);
		let reversedSet = SetArray<Int>(self.reversedHundred);
		let shuffledSet = SetArray<Int>(self.shuffledHundred);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet == reversedSet);
				XCTAssertTrue(initialSet == shuffledSet);
				XCTAssertTrue(reversedSet == shuffledSet);
			}
		}
	}
	func testCompareArray100SetArray() {
		let initialSet = SetArray<Int>(self.sortedHundred);
		let reversedSet = SetArray<Int>(self.reversedHundred);
		let shuffledSet = SetArray<Int>(self.shuffledHundred);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet.asArray() == self.sortedHundred);
				XCTAssertTrue(reversedSet.asArray() == self.sortedHundred);
				XCTAssertTrue(shuffledSet.asArray() == self.sortedHundred);
			}
		}
	}
	
	
	
	// MARK: Set Size 10
	func testCompareSet10Set() {
		let initialSet = Set<Int>(self.sortedTen);
		let reversedSet = Set<Int>(self.reversedTen);
		let shuffledSet = Set<Int>(self.shuffledTen);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet == reversedSet);
				XCTAssertTrue(initialSet == shuffledSet);
				XCTAssertTrue(reversedSet == shuffledSet);
			}
		}
	}
	func testCompareArray10Set() {
		let initialSet = Set<Int>(self.sortedTen);
		let reversedSet = Set<Int>(self.reversedTen);
		let shuffledSet = Set<Int>(self.shuffledTen);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet.sorted() == self.sortedTen);
				XCTAssertTrue(reversedSet.sorted() == self.sortedTen);
				XCTAssertTrue(shuffledSet.sorted() == self.sortedTen);
			}
		}
	}
	
	// MARK: Set Size 30
	func testCompareSet30Set() {
		let initialSet = Set<Int>(self.sortedThirty);
		let reversedSet = Set<Int>(self.reversedThirty);
		let shuffledSet = Set<Int>(self.shuffledThirty);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet == reversedSet);
				XCTAssertTrue(initialSet == shuffledSet);
				XCTAssertTrue(reversedSet == shuffledSet);
			}
		}
	}
	func testCompareArray30Set() {
		let initialSet = Set<Int>(self.sortedThirty);
		let reversedSet = Set<Int>(self.reversedThirty);
		let shuffledSet = Set<Int>(self.shuffledThirty);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet.sorted() == self.sortedThirty);
				XCTAssertTrue(reversedSet.sorted() == self.sortedThirty);
				XCTAssertTrue(shuffledSet.sorted() == self.sortedThirty);
			}
		}
	}
	
	// MARK: Set Size 100
	func testCompareSet100Set() {
		let initialSet = Set<Int>(self.sortedHundred);
		let reversedSet = Set<Int>(self.reversedHundred);
		let shuffledSet = Set<Int>(self.shuffledHundred);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet == reversedSet);
				XCTAssertTrue(initialSet == shuffledSet);
				XCTAssertTrue(reversedSet == shuffledSet);
			}
		}
	}
	func testCompareArray100Set() {
		let initialSet = Set<Int>(self.sortedHundred);
		let reversedSet = Set<Int>(self.reversedHundred);
		let shuffledSet = Set<Int>(self.shuffledHundred);
		self.measure {
			for _ in 0..<10000 {
				XCTAssertTrue(initialSet.sorted() == self.sortedHundred);
				XCTAssertTrue(reversedSet.sorted() == self.sortedHundred);
				XCTAssertTrue(shuffledSet.sorted() == self.sortedHundred);
			}
		}
	}
}
