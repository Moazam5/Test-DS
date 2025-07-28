//
//  DailyTemperature.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/10/25.
//

import Foundation
import Testing 
/*
 You are given an array of integers temperatures where temperatures[i] represents the daily temperatures on the ith day.

 Return an array result where result[i] is the number of days after the ith day before a warmer temperature appears on a future day. If there is no day in the future where a warmer temperature will appear for the ith day, set result[i] to 0 instead.

 Example 1:

 Input: temperatures = [30,38,30,36,35,40,28]
 Output: [1,4,1,2,1,0,0]

*/

// Using monotonic decreasing stack
func dailyTemperature(temperatures: [Int]) -> [Int] {
	var result = Array(repeating: 0, count: temperatures.count)
	var stack = [(temp: Int, index: Int)]()
	for (index, value) in temperatures.enumerated() {
		while !stack.isEmpty, value > stack.last!.temp {
			let element = stack.removeLast()
			result[element.index] = index - element.index
		}
		stack.append( (temp: value, index: index) )
	}
	return result
}

@Test(arguments: zip([[22,21,20], [30,38,30,36,35,40,28]], [[0, 0, 0], [1,4,1,2,1,0,0]]))
func testDailyTemperature(temperature: [Int], expectedResult: [Int]) {
	#expect(dailyTemperature(temperatures: temperature) == expectedResult)
}
