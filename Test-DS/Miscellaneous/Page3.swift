//
//  Page3.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 10/6/24.
//

import XCTest
import Testing
import SwiftUI


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

