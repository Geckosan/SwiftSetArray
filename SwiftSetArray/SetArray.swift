//
//  SetArray.swift
//  SwiftSetArray
//
//  Created by Daniel Hudson on 22/06/2019.
//  Copyright © 2019 Heavy Gecko. All rights reserved.
//

import Foundation

public struct SetArray<Element: Comparable>
{
	var rawArray = [Element]();
	public subscript(i: Int) -> Element { return rawArray[i] }
	
	public var isEmpty: Bool { return rawArray.isEmpty }
	public var count: Int { return rawArray.count }
	public var last: Element? { return rawArray.last }
	
	public init() { rawArray = [Element]() }
	public init(_ initialElement: Element) { rawArray = [initialElement] }
	public init(_ copySetArray: SetArray<Element>) { rawArray = copySetArray.rawArray }
	
	public init(_ copyArray: [Element])
	{
		guard (!copyArray.isEmpty) else { return }
		
		let sorted = copyArray.sorted();
		rawArray = [sorted.first!];
		
		for value in sorted {
			guard (value > rawArray.last!) else { continue }
			rawArray.append(value);
		}
	}
	
	public mutating func removeAll() { rawArray.removeAll() }
	public func asArray() -> [Element] { return self.rawArray }
}

// MARK: Binary Search
extension SetArray
{
	// Returns optional index (Int) to the first element in the array that is not less than value
	public func lowerBound(_ value: Element) -> Int?
	{
		// return nil if empty or all elements are less than value
		guard (!rawArray.isEmpty && rawArray.last! >= value) else { return nil }
		
		var step: Int;
		var index: Int;
		var first = 0;
		var dist = rawArray.count;
		
		while(dist > 0) {
			step = (dist - (dist % 2)) / 2;
			index = first + step;
			
			if(rawArray[index] < value) {
				first = index + 1;
				dist = dist - (step + 1);
			}
			else {
				dist = step;
			}
		}
		return first;
	}
	
	// Returns true if given value is in the array (more efficient than indexOf in larger arrays)
	public func binarySearch(_ value: Element) -> Bool
	{
		guard let index = lowerBound(value) else { return false }
		return (rawArray[index] == value);
	}
	
	// Returns the index of the given element if it exists, nil if not
	public func getIndex(_ element: Element) -> Int? {
		guard let index = lowerBound(element) else { return nil }
		return rawArray[index] == element ? index : nil;
	}
}

// MARK: Conform to Equatable & Comparable
extension SetArray: Equatable, Comparable
{
	public static func == (lhs: SetArray<Element>, rhs: SetArray<Element>) -> Bool {
		return lhs.rawArray == rhs.rawArray;
	}
	
	// As each element is already sorted and automatically comparable, each element can be checked in turn
	public static func < (lhs: SetArray<Element>, rhs: SetArray<Element>) -> Bool
	{
		for(i, value) in lhs.rawArray.enumerated() {
			guard (i < rhs.count && rhs[i] >= value) else { return false }
			guard (value == rhs[i]) else { return true }
		}
		return (rhs.count > lhs.count);
	}
}

// MARK: Conform to Sequence
extension SetArray: Sequence
{
	public typealias Iterator = AnyIterator<Element>;
	public func makeIterator() -> Iterator
	{
		var index = 0;
		return AnyIterator {
			if index < self.rawArray.count {
				let i = index;
				index = index + 1;
				return self.rawArray[i];
			}
			else {
				return nil;
			}
		}
	}
}

// MARK: Conform to Collection
extension SetArray: Collection
{
	public typealias Index = Int;
	public var startIndex: Int { return 0; }
	public var endIndex: Int { return count; }
	public func index(after: Int) -> Int { return after + 1; }
}

// MARK: Conform to SetAlgebra
extension SetArray: SetAlgebra
{
	// True if given element is in the array
	public func contains(_ member: Element) -> Bool { return binarySearch(member) }
	
	// Inserts a new element if not present, if already present returns existing element
	@discardableResult mutating public func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element)
	{
		// check if index for value exists
		if let i = lowerBound(newMember) {
			
			// check if value is equal
			guard (rawArray[i] != newMember) else { return (inserted: false, memberAfterInsert: rawArray[i]) }
			
			// insert new member
			rawArray.insert(newMember, at: i);
		}
		else {
			// add to the back
			rawArray.append(newMember);
		}
		
		return (inserted: true, memberAfterInsert: newMember);
	}
	
	// Removes an element and returns it if present in the array
	@discardableResult mutating public func remove(_ member: Element) -> Element?
	{
		guard let i = lowerBound(member) else { return nil }
		guard (rawArray[i] == member) else { return nil }
		let removedMember = rawArray[i];
		rawArray.remove(at: i);
		return removedMember;
	}
	
	// Inserts a new element, if already present then the old element is swaped with the new then returned
	@discardableResult mutating public func update(with newMember: Element) -> Element?
	{
		// check if index for value exists
		if let i = lowerBound(newMember) {
			
			// check if value is equal
			if(rawArray[i] == newMember) {
				let oldMember = rawArray[i];
				rawArray[i] = newMember;
				return oldMember;
			}
			
			// insert new member
			rawArray.insert(newMember, at: i);
		}
		else {
			// add to the back
			rawArray.append(newMember);
		}
		
		// nothing replaced so return nil
		return nil;
	}
	
	public func intersection(_ other: SetArray<Element>) -> SetArray<Element>
	{
		var newSet = SetArray<Element>();
		var i = 0;
		var j = 0;
		
		while(i < rawArray.count && j < other.count) {
			
			if(rawArray[i] < other[j]) 	{
				i = i + 1;
			}
			else if(rawArray[i] > other[j]) {
				j = j + 1;
			}
			else {
				newSet.rawArray.append(rawArray[i])
				i = i + 1;
				j = j + 1;
			}
		}
		return newSet;
	}
	
	public func subtracting(_ other: SetArray<Element>) -> SetArray<Element>
	{
		var newSet = SetArray<Element>();
		var i = 0;
		var j = 0;
		
		while(i < rawArray.count) {
			
			if(j >= other.count) {
				newSet.rawArray = newSet.rawArray + rawArray[i..<rawArray.count];
				return newSet;
			}
			else if(rawArray[i] < other[j]) {
				newSet.rawArray.append(rawArray[i]);
				i = i + 1;
			}
			else {
				if(!(rawArray[i] > other[j])) {
					i = i + 1;
				}
				j = j + 1;
			}
		}
		
		return newSet;
	}
	
	public func symmetricDifference(_ other: SetArray<Element>) -> SetArray<Element>
	{
		var newSet = SetArray<Element>();
		var i = 0;
		var j = 0;
		
		while(i < rawArray.count) {
			
			if(j >= other.count) {
				newSet.rawArray = newSet.rawArray + rawArray[i..<rawArray.count];
				return newSet;
			}
			else if(rawArray[i] < other[j]) {
				newSet.rawArray.append(rawArray[i]);
				i = i + 1;
			}
			else if(rawArray[i] > other[j]) {
				newSet.rawArray.append(other[j]);
				j = j + 1;
			}
			else {
				i = i + 1;
				j = j + 1;
			}
		}
		
		guard (j < other.count) else { return newSet }
		newSet.rawArray = newSet.rawArray + other.rawArray[j..<other.count];
		return newSet;
	}
	
	public func union(_ other: SetArray<Element>) -> SetArray<Element>
	{
		guard (!isEmpty) else { return other }
		guard (!other.isEmpty) else { return SetArray<Element>(self) }
		
		var newSet = SetArray<Element>();
		var i = 0;
		var j = 0;
		
		while(i < rawArray.count) {
			
			if(j >= other.count) {
				newSet.rawArray = newSet.rawArray + rawArray[i..<rawArray.count];
				return newSet;
			}
			else if(rawArray[i] < other[j]) {
				newSet.rawArray.append(rawArray[i]);
				i = i + 1;
			}
			else if(rawArray[i] > other[j]) {
				newSet.rawArray.append(other[j]);
				j = j + 1;
			}
			else {
				newSet.rawArray.append(rawArray[i]);
				i = i + 1;
				j = j + 1;
			}
		}
		
		guard (j < other.count) else { return newSet }
		newSet.rawArray = newSet.rawArray + other.rawArray[j..<other.count];
		
		return newSet;
	}
	
	mutating public func formIntersection(_ other: SetArray<Element>)
	{
		rawArray = intersection(other).rawArray;
	}
	
	mutating public func subtract(_ other: SetArray<Element>)
	{
		rawArray = subtracting(other).rawArray;
	}
	
	mutating public func formSymmetricDifference(_ other: SetArray<Element>)
	{
		rawArray = symmetricDifference(other).rawArray;
	}
	
	mutating public func formUnion(_ other: SetArray<Element>)
	{
		rawArray = union(other).rawArray;
	}
	
	public func isDisjoint(_ other: SetArray<Element>) -> Bool {
		return intersection(other).isEmpty;
	}
	
	public func isSubset(of other: SetArray<Element>) -> Bool {
		return subtracting(other).isEmpty;
	}
	
	public func isSuperset(of other: SetArray<Element>) -> Bool {
		return other.subtracting(self).isEmpty;
	}
}
