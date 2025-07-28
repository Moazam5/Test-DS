//
//  Page3.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 10/6/24.
//

import XCTest
import Testing
import SwiftUI

func matrixVisualization(rows: Int, columns: Int) {
	for row in 0..<rows {
		for column in 0..<columns {
			print("[\(row) \(column)]", separator: "", terminator: " ")
		}
		print("")
	}
}

class Page3Tests: XCTestCase {
	func test_matrixVisualization() {
		matrixVisualization(rows: 2, columns: 3)
	}

	func testFunc() {
		let arr = [1,2,3,1]
		arr.filter { $0 == 1}
	}

	func test_testFunc() {
		testFunc()
	}
}

/*
 Group Anagrams
 Given an array of strings strs, group all anagrams together into sublists. You may return the output in any order.

 An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.

 Example 1:

 Input: strs = ["act","pots","tops","cat","stop","hat"]

 Output: [["hat"],["act", "cat"],["stop", "pots", "tops"]]
 Example 2:

 Input: strs = ["x"]

 Output: [["x"]]

 Input: strs = [""]

 Output: [[""]]
 */

func groupAnagrams(from strs: [String]) -> [[String]] {
	var result: [[String]] = [[String]]()
	if strs.count == 1 {
		 result.append(strs)
	}
	return result
}

@Test
func groupAnagramsReturnsCorrectResultType() {
	let strs = ["act", "pots", "tops", "cat", "stop", "hat"]
	let expectedResult: [[String]] = []
	let result = groupAnagrams(from: strs)
	#expect(expectedResult == result)
}

@Test
func groupAnagramsReturnsArrayWithOneSubArrayContainingEmptyString() {
	let strs = [""]
	let expectedResult: [[String]] = [[""]]
	let result = groupAnagrams(from: strs)
	#expect(expectedResult == result)
}

@Test
func groupAnagramsReturnsArrayWithOneSubArrayContainingOneElement() {
	let strs = ["x"]
	let expectedResult: [[String]] = [["x"]]
	let result = groupAnagrams(from: strs)
	#expect(expectedResult == result)
}

//@Test
//func groupAnagramsReturnsCorrectResult() {
//	let strs = ["act", "pots", "tops", "cat", "stop", "hat"]
//	let expectedResult: [[String]] = [["hat"], ["act", "cat"], ["stop", "pots", "tops"]]
//	let result = groupAnagrams(from: strs)
//
//	let testClassItem = TestClass(item: MockMyFirstClass())
//	testClassItem.item.testFunc()
//
//	#expect(expectedResult == result)
//}
//



protocol ObservableTestClass {
	var name: String { get set }
}

class MyFirstClass: NSObject, ObservableTestClass {
	@objc dynamic var name: String = "dog"
	func testFunc() {
		print("dog")
	}
}

class ObservableObjectTestClass: ObservableObject, ObservableTestClass {
	@Published var name: String = "dog"
}

@Observable
class TestClass {
	let item: ObservableTestClass
	private(set) var name: String
	private var observation: Any? // To hold either NSKeyValueObservation or Cancellable
	
	init(item: ObservableTestClass) {
		self.item = item
		self.name = item.name
		setupObservation()
	}
	
	private func setupObservation() {
		if let objcItem = item as? MyFirstClass {
			// Handle NSObject KVO observation
			let observation = objcItem.observe(\.name) { [weak self] object, _ in
				self?.name = object.name
				print(object.name)
			}
			self.observation = observation
		} else if let publishedItem = item as? ObservableObjectTestClass {
			// Handle Combine publisher observation
			let cancellable = publishedItem.$name
				.sink { [weak self] newValue in
					self?.name = newValue
					print(newValue)
				}
			self.observation = cancellable
		}
	}
}

class TestClassTests: XCTestCase {
	func testObservationTracking() {
		// Arrange
		let myFirstClass = MyFirstClass()
		let testClass = TestClass(item: myFirstClass)

		// Create an expectation for the observation
		let expectation = XCTestExpectation(description: "Name change observed")

		// Act
		// Change the name property
		myFirstClass.name = "bat"

		// Wait briefly for the observation to trigger
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			expectation.fulfill()
		}

		// Assert
		wait(for: [expectation], timeout: 1.0)
		XCTAssertEqual(testClass.name, "bat")
	}

	func testObservationTrackingWithObservableObject() {
		// Arrange
		let myFirstClass = ObservableObjectTestClass()
		let testClass = TestClass(item: myFirstClass)

		// Create an expectation for the observation
		let expectation = XCTestExpectation(description: "Name change observed")

		// Act
		// Change the name property
		myFirstClass.name = "bat"

		// Wait briefly for the observation to trigger
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			expectation.fulfill()
		}

		// Assert
		wait(for: [expectation], timeout: 1.0)
		XCTAssertEqual(testClass.name, "bat")
	}
}

class MockMyFirstClass: MyFirstClass {
	override func testFunc() {
		print("cat")
	}
}

@Test func dynamicObservationTest() {
	let item = TestClass(item: MyFirstClass())
}

