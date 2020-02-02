//
//  SpeedTests.swift
//  SwiftSetArrayTests
//
//  Created by Daniel Hudson on 31/01/2020.
//  Copyright © 2020 Heavy Gecko. All rights reserved.
//

import XCTest

class InsertPerformanceTests: XCTestCase {
	let randomHundred = [8,26,55,43,88,53,98,19,56,10,57,90,73,2,44,84,18,86,61,67,61,8,81,85,3,42,47,12,96,2,67,76,9,16,75,67,96,4,33,42,48,72,77,71,100,9,47,40,94,84,17,68,72,70,4,95,11,18,100,50,5,70,34,37,33,24,33,88,90,95,43,54,62,78,90,53,77,75,48,59,73,77,40,47,15,43,30,88,10,43,37,47,47,71,9,17,71,13,85,4]
	var sortedHundred: [Int] = []
	
	var ascendingTen: [Int] = []
	var descendingTen: [Int] = []
	var sortedAscendingTen: [Int] = []
	var sortedDescendingTen: [Int] = []
	var sortedCombinedTen: [Int] = []
	
	var ascendingThirty: [Int] = []
	var descendingThirty: [Int] = []
	var sortedAscendingThirty: [Int] = []
	var sortedDescendingThirty: [Int] = []
	var sortedCombinedThirty: [Int] = []
	
	override func setUp() {
		sortedHundred = Set<Int>(randomHundred).sorted();
		
		ascendingTen = Array(20..<30);
		descendingTen = Array(70..<80).reversed();
		sortedAscendingTen = ascendingTen;
		sortedDescendingTen = descendingTen.sorted();
		sortedCombinedTen = Set<Int>(sortedAscendingTen + sortedDescendingTen).sorted();
		
		ascendingThirty = Array(100..<130);
		descendingThirty = Array(170..<300).reversed();
		sortedAscendingThirty = ascendingThirty;
		sortedDescendingThirty = descendingThirty.sorted();
		sortedCombinedThirty = Set<Int>(sortedAscendingThirty + sortedDescendingThirty).sorted();
	}
	
	// MARK: SetArray Size 10
	func testInsert10AscendingSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.ascendingTen {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedAscendingTen);
	}
	func testInsert10DescendingSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingTen {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedDescendingTen);
	}
	func testInsert10CombinedSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingTen {
					workingSet.insert(element);
				}
				for element in self.ascendingTen {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedCombinedTen);
	}
	
	// MARK: SetArray Size 30
	func testInsert30AscendingSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.ascendingThirty {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedAscendingThirty);
	}
	func testInsert30DescendingSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingThirty {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedDescendingThirty);
	}
	func testInsert30CombinedSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingThirty {
					workingSet.insert(element);
				}
				for element in self.ascendingThirty {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedCombinedThirty);
	}
	
	// MARK: SetArray Random Hundred
	func testInsertRandomHundredSetArray() {
		let initialSet = SetArray<Int>();
		var workingSet = SetArray<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.randomHundred {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.asArray() == self.sortedHundred);
	}
	
	
	// MARK: Set Size 10
	func testInsert10AscendingSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.ascendingTen {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedAscendingTen);
	}
	func testInsert10DescendingSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingTen {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedDescendingTen);
	}
	func testInsert10CombinedSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingTen {
					workingSet.insert(element);
				}
				for element in self.ascendingTen {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedCombinedTen);
	}
	
	// MARK: Set Size 30
	func testInsert30AscendingSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.ascendingThirty {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedAscendingThirty);
	}
	func testInsert30DescendingSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingThirty {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedDescendingThirty);
	}
	func testInsert30CombinedSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.descendingThirty {
					workingSet.insert(element);
				}
				for element in self.ascendingThirty {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedCombinedThirty);
	}
	
	// MARK: Set Random Hundred
	func testInsertRandomHundredSet() {
		let initialSet = Set<Int>();
		var workingSet = Set<Int>();
		self.measure {
			for _ in 0..<10000 {
				workingSet = initialSet;
				for element in self.randomHundred {
					workingSet.insert(element);
				}
			}
		}
		XCTAssertTrue(workingSet.sorted() == self.sortedHundred);
	}
}
