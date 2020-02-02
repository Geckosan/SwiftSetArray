//
//  SubtractPerformanceTests.swift
//  SwiftSetArrayTests
//
//  Created by Daniel Hudson on 01/02/2020.
//  Copyright © 2020 Heavy Gecko. All rights reserved.
//

import XCTest

class SubtractPerformanceTests: XCTestCase {
	
	let firstTen: [Int] = [0,1,2,6,5,7,3,9,8,4]
	let secondTen: [Int] = [3,4,-1,-2,6,10,0,11,17,12]
	var resultsTenFirstSubSecond: [Int] = []
	var resultsTenSecondSubFirst: [Int] = []
	
	let firstThirty: [Int] = [0,1,2,3,4,5,18,19,20,21,22,23,29,28,27,26,25,24,6,7,8,9,10,11,17,16,15,14,13,12]
	let secondThirty: [Int] = [-4,-3,-2,-1,0,1, 4,6,8,10,12,14, 33,32,31,30,29,28, 38,-38,37,-37,36,-36, 23,18,22,19,21,20]
	var resultsThirtyFirstSubSecond: [Int] = []
	var resultsThirtySecondSubFirst: [Int] = []
	
	let firstRandomHundred = [8,26,55,43,88,53,98,19,56,10,57,90,73,2,44,84,18,86,61,67,61,8,81,85,3,42,47,12,96,2,67,76,9,16,75,67,96,4,33,42,48,72,77,71,100,9,47,40,94,84,17,68,72,70,4,95,11,18,100,50,5,70,34,37,33,24,33,88,90,95,43,54,62,78,90,53,77,75,48,59,73,77,40,47,15,43,30,88,10,43,37,47,47,71,9,17,71,13,85,4]
	let secondRandomHundred = [37,12,38,16,64,90,60,95,30,24,17,89,33,38,38,74,22,40,3,16,22,17,96,59,49,28,52,29,1,73,57,86,96,88,56,35,92,60,27,45,95,16,97,19,60,57,55,59,93,81,21,59,13,95,31,4,33,73,76,20,68,95,59,28,18,59,98,11,10,25,45,94,70,100,49,66,16,96,31,65,5,82,2,58,2,91,64,8,13,71,35,85,68,11,69,8,92,11,31,7]
	var resultsHundredFirstSubSecond: [Int] = []
	var resultsHundredSecondSubFirst: [Int] = []
	
	override func setUp() {
		var firstSet = Set<Int>(firstTen);
		var secondSet = Set<Int>(secondTen);
		resultsTenFirstSubSecond = firstSet.subtracting(secondSet).sorted();
		resultsTenSecondSubFirst = secondSet.subtracting(firstSet).sorted();
		
		firstSet = Set<Int>(firstThirty);
		secondSet = Set<Int>(secondThirty);
		resultsThirtyFirstSubSecond = firstSet.subtracting(secondSet).sorted();
		resultsThirtySecondSubFirst = secondSet.subtracting(firstSet).sorted();
		
		firstSet = Set<Int>(firstRandomHundred);
		secondSet = Set<Int>(secondRandomHundred);
		resultsHundredFirstSubSecond = firstSet.subtracting(secondSet).sorted();
		resultsHundredSecondSubFirst = secondSet.subtracting(firstSet).sorted();
	}
	
	// MARK: SetArray Size 10
	func testSubtract10SetArray() {
		let firstInitial = SetArray<Int>(self.firstTen);
		let secondInitial = SetArray<Int>(self.secondTen);
		var firstSubSecond = SetArray<Int>();
		var secondSubFirst = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				firstSubSecond = firstInitial.subtracting(secondInitial);
				secondSubFirst = secondInitial.subtracting(firstInitial);
			}
		}
		XCTAssertTrue(firstSubSecond.asArray() == self.resultsTenFirstSubSecond);
		XCTAssertTrue(secondSubFirst.asArray() == self.resultsTenSecondSubFirst);
	}
	
	// MARK: SetArray Size 30
	func testSubtract30SetArray() {
		let firstInitial = SetArray<Int>(self.firstThirty);
		let secondInitial = SetArray<Int>(self.secondThirty);
		var firstSubSecond = SetArray<Int>();
		var secondSubFirst = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				firstSubSecond = firstInitial.subtracting(secondInitial);
				secondSubFirst = secondInitial.subtracting(firstInitial);
			}
		}
		XCTAssertTrue(firstSubSecond.asArray() == self.resultsThirtyFirstSubSecond);
		XCTAssertTrue(secondSubFirst.asArray() == self.resultsThirtySecondSubFirst);
	}
	
	// MARK: SetArray Random Hundred
	func testSubtract100SetArray() {
		let firstInitial = SetArray<Int>(self.firstRandomHundred);
		let secondInitial = SetArray<Int>(self.secondRandomHundred);
		var firstSubSecond = SetArray<Int>();
		var secondSubFirst = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				firstSubSecond = firstInitial.subtracting(secondInitial);
				secondSubFirst = secondInitial.subtracting(firstInitial);
			}
		}
		XCTAssertTrue(firstSubSecond.asArray() == self.resultsHundredFirstSubSecond);
		XCTAssertTrue(secondSubFirst.asArray() == self.resultsHundredSecondSubFirst);
	}
	
	
	// MARK: Set Size 10
	func testSubtract10Set() {
		let firstInitial = Set<Int>(self.firstTen);
		let secondInitial = Set<Int>(self.secondTen);
		var firstSubSecond = Set<Int>();
		var secondSubFirst = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				firstSubSecond = firstInitial.subtracting(secondInitial);
				secondSubFirst = secondInitial.subtracting(firstInitial);
			}
		}
		XCTAssertTrue(firstSubSecond.sorted() == self.resultsTenFirstSubSecond);
		XCTAssertTrue(secondSubFirst.sorted() == self.resultsTenSecondSubFirst);
	}
	
	// MARK: Set Size 30
	func testSubtract30Set() {
		let firstInitial = Set<Int>(self.firstThirty);
		let secondInitial = Set<Int>(self.secondThirty);
		var firstSubSecond = Set<Int>();
		var secondSubFirst = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				firstSubSecond = firstInitial.subtracting(secondInitial);
				secondSubFirst = secondInitial.subtracting(firstInitial);
			}
		}
		XCTAssertTrue(firstSubSecond.sorted() == self.resultsThirtyFirstSubSecond);
		XCTAssertTrue(secondSubFirst.sorted() == self.resultsThirtySecondSubFirst);
	}
	
	// MARK: Set Random Hundred
	func testSubtract100Set() {
		let firstInitial = Set<Int>(self.firstRandomHundred);
		let secondInitial = Set<Int>(self.secondRandomHundred);
		var firstSubSecond = Set<Int>();
		var secondSubFirst = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				firstSubSecond = firstInitial.subtracting(secondInitial);
				secondSubFirst = secondInitial.subtracting(firstInitial);
			}
		}
		XCTAssertTrue(firstSubSecond.sorted() == self.resultsHundredFirstSubSecond);
		XCTAssertTrue(secondSubFirst.sorted() == self.resultsHundredSecondSubFirst);
	}
}
