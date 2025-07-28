//
//  Test_DSTests.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 9/5/24.
//

import XCTest
import Test_DS

class Test_DSTests: XCTestCase {
	func simpleArraySum(ar: [Int]) -> Int {
		if ar.isEmpty {
			return 0
		}
		return ar[0] + simpleArraySum(ar: Array(ar.dropFirst()))
	}

	func test_simpleArraySumWithFiniteArrayOfElements() {
		let testArr = [1,2,3,4,5]
		let sum = simpleArraySum(ar: testArr)
		XCTAssertEqual(sum, 15)
	}

	func test_simpleArraySumWithEmptyArrayOfElements() {
		let testArr: [Int] = []
		let sum = simpleArraySum(ar: testArr)
		XCTAssertEqual(sum, 0)
	}

	func test_simpleArraySumWithArrayContainingNegativeNumbers() {
		let testArr: [Int] = [1,2,-2,-1]
		let sum = simpleArraySum(ar: testArr)
		XCTAssertEqual(sum, 0)
	}

	func diagonalDifference(arr: [[Int]]) -> Int {
		// Write your code here
		var leftToRightDiagonalSum = 0
		var rightToLeftDiagonalSum = 0

		arr.indices.forEach { i in
			arr[i].indices.forEach { j in
				if i == j {
					leftToRightDiagonalSum += arr[i][j]
					rightToLeftDiagonalSum += arr.reversed()[i][j]
					print("Element \(arr.reversed()[i][j])")
				}
			}
		}

		return abs(leftToRightDiagonalSum - rightToLeftDiagonalSum)
	}

	// ChatGPT
	func diagonalDifference(matrix: [[Int]]) -> Int {
		let n = matrix.count
		var primaryDiagonalSum = 0
		var secondaryDiagonalSum = 0

		for i in 0..<n {
			primaryDiagonalSum += matrix[i][i] // Sum of primary diagonal (left-to-right)
			secondaryDiagonalSum += matrix[i][n - i - 1] // Sum of secondary diagonal (right-to-left)
		}

		return abs(primaryDiagonalSum - secondaryDiagonalSum)
	}

	func test_diagonalDifference() {

		let array = [
			[11, 2, 4],
			[4, 5, 6],
			[10, 8, -12]
		]
		let sum = diagonalDifference(arr: array)
		XCTAssertEqual(sum, 15)
	}

	/*
	 Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with  places after the decimal.
	 Note: This challenge introduces precision problems. The test cases are scaled to six decimal places, though answers with absolute error of up to  are acceptable.
	 */
	func plusMinus(arr: [Int]) -> Void {
		// Write your code here
		var positiveNumbersCounts: Double = 0
		var negativeNumbersCount: Double = 0
		var zeroCount: Double = 0
		let count = Double(arr.count)
		for number in arr {
			if number == 0 {
				zeroCount += 1
			} else if number > 0 {
				positiveNumbersCounts += 1
			} else {
				negativeNumbersCount += 1
			}
		}
		print(String(format: "%f", positiveNumbersCounts/count))
		print(String(format: "%.6f", negativeNumbersCount/count))
		print(String(format: "%.6f", zeroCount/count))
	}

	/*
	 Staircase detail
	 This is a staircase of size n = 4
		#
	   ##
	  ###
	 ####	 
	 */


	func staircase(n: Int) {
			// Write your code here
			if n <= 0 {
				return
			}
		   stairCaseHelper(numberSpaces: n - 1, n: 1)
		}

	func stairCaseHelper(numberSpaces: Int, n: Int) {
		 if numberSpaces < 0 {
				return
			}
			for _ in 0..<numberSpaces {
				print(" ", terminator: "")
			}
			for _ in 0..<n {
				print("#", terminator: "")
			}
			print()
		stairCaseHelper(numberSpaces: numberSpaces - 1, n: n + 1)
	}


	// CHATGPT :( --- MUCH BETTER.

	func staircaseCHATGPT(n: Int) {
		for i in 1...n {
			// Print spaces
			let spaces = String(repeating: " ", count: n - i)
			// Print hash symbols
			let hashes = String(repeating: "#", count: i)
			// Print the full line
			print(spaces + hashes)
		}
	}

	func test_Staircase() {
		staircase(n: 5)
	}


	/*
	 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
	 Example

	 The minimum sum is  and the maximum sum is . The function prints
	 16 24
	 */

	// Failed one test
	func miniMaxSum(arr: [Int]) -> Void {
		// Write your code here
		let min = arr.min()
		let max = arr.max()
		var maxSum = 0
		var minSum = 0

		maxSum = arr.reduce(0) { result, element in
			if element != min {
				return result + element
			}
			return result
		}
		minSum = arr.reduce(0) { result, element in
			if element != max {
				return result + element
			} else {
				return result
			}
		}
		print(minSum, " ", maxSum)
	}
	
	// Passed
	func miniMaxSumChatGPT(arr: [Int]) -> Void {
			// Write your code here
		   let totalSum = arr.reduce(0, +)

		// Find the minimum and maximum values in the array
		let minValue = arr.min() ?? 0
		let maxValue = arr.max() ?? 0

		// The minimum sum is totalSum excluding the maximum value
		let minSum = totalSum - maxValue

		// The maximum sum is totalSum excluding the minimum value
		let maxSum = totalSum - minValue

		// Print the result as space-separated values
		print("\(minSum) \(maxSum)")
		}


	func testMinMaxSum() {
		miniMaxSum(arr: [1,3,9,7,5])
	}

	/*
	 You are in charge of the cake for a child's birthday. You have decided the cake will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Count how many candles are tallest.
	 */

	// Complexity: O(*n*)
	func birthdayCakeCandles(candles: [Int]) -> Int {
		// Write your code here
		let max = candles.max()
		var totalTallestCandles = 0
		for candle in candles {
			if candle == max {
				totalTallestCandles += 1
			}
		}
		return totalTallestCandles
	}

	// Easier, I like this better since it uses filter instead of for loop which makes mine look like a beginner and not one written by a professional.
	func birthdayCakeCandlesChatGPT(candles: [Int]) -> Int {
		// Find the tallest candle
		guard let tallest = candles.max() else { return 0 }

		// Count how many candles are as tall as the tallest
		return candles.filter { $0 == tallest }.count
	}

	func test_birthdayCakeCandles_forSetNumberOfCandles() {
		let candles = [4, 4, 1, 3]
		let totalTallest = self.birthdayCakeCandles(candles: candles)
		XCTAssertEqual(totalTallest, 2)
	}

	func test_birthdayCakeCandles_forSetEmptyCandleSet() {
		let candles: [Int] = []
		let totalTallest = self.birthdayCakeCandles(candles: candles)
		XCTAssertEqual(0, 0)
	}

	/*
	 Given a time in -hour AM/PM format, convert it to military (24-hour) time.
	 Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
	 - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.
	 */

	func timeConversion(s: String) -> String {
		// Write your code here
//		var militaryTime = ""
//
//		if s.contains("AM") {
//			if s.contains("12") {
//				var updatedString = s.replacingOccurrences(of: "12", with: "00")
//			}
//			return s.replacingOccurrences(of: "AM", with: "")
//		} else {
//			var updatedString = s.replacingOccurrences(of: "PM", with: "")
//
//		}
//
//		return parsed

		let period = String(s.suffix(2))

		// Remove the AM/PM part from the time string
		let timeWithoutPeriod = s.prefix(8)

		// Split the time into components (hours, minutes, seconds)
		let timeComponents = timeWithoutPeriod.split(separator: ":")

		// Convert the hour to an integer
		var hour = Int(timeComponents[0]) ?? 0
		let minute = String(timeComponents[1])
		let second = String(timeComponents[2])

		// Adjust the hour for 12 AM and 12 PM
		if period == "AM" && hour == 12 {
			hour = 0 // Midnight case
		} else if period == "PM" && hour != 12 {
			hour += 12 // Convert PM hours to 24-hour format
		}

		// Return the formatted time in 24-hour format
		return String(format: "%02d:%@:%@", hour, minute, second)
	}

	func test_timeConversion_whenTimeIsInPM() {
		
//		print(self.timeConversion(s: "12:00PM"))
	}



}
