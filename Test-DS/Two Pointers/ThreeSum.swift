//
//  ThreeSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/14/25.
//

import Foundation
import Testing
import OSLog
let logger = Logger(subsystem: Bundle.main.bundlePath, category: "ThreeSum")
func threeSum(_ nums: [Int]) -> [[Int]] {
	if nums.count < 3 {
		return []
	}
	let sortedNums = nums.sorted()
	var triplets : [[Int]] = []
	for (index,num) in sortedNums.enumerated() {
		let target = 0 - num
		if index > 0, sortedNums[index - 1] != num {
			continue
		}
		let newARr = Array(sortedNums[0..<index] + sortedNums[index + 1..<sortedNums.count])
		var newTriplet = twoSum(Array(sortedNums[0..<index] + sortedNums[index + 1..<sortedNums.count]), target: target)
		logger.debug("New Double \(newARr) \(newTriplet) \(target)")
		if !newTriplet.isEmpty {
			newTriplet.append(num)
			triplets.append(newTriplet)
		}
	}


	logger.info("\(triplets)")
	return triplets
}

@Suite struct TestThreeSum {
	@Test func returnsEmptyArrayWhenGivenEmptyArray() {
		#expect(threeSum([]) == [])
	}

	@Test func returnsEmptyArrayWhenGivenSingleElementArray() {
		#expect(threeSum([1]) == [])
	}

	@Test func returnsEmptyArrayWhenGivenArrayWithNoTwoSum() {
		#expect(threeSum([1,2,3,4]) == [])
	}

	@Test func returnsTwoSumWhenGivenArrayWithTwoSum() {
		let nums =  [-1,0,1,2,-1,-4]
		#expect(threeSum(nums) == [[-1,-1,2],[-1,0,1]])
	}

	@Test func returnsTwoSumWhenGivenAnotherArrayWithTwoSum() {
		let nums = [0,1,1]
		#expect(threeSum(nums) == [])
	}

//	@Test func returnsTwoSumWhenGivenUnsortedArrayWithTwoSum() {
//		let nums = [5, 4,6]
//		#expect(threeSum(nums) == [1,2])
//	}

}
