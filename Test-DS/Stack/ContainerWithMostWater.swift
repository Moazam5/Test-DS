//
//  ContainerWithMostWater.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/17/25.
//

import Foundation
import Testing

/*
 Container With Most Water
 You are given an integer array heights where heights[i] represents the height of the ith bar.

 You may choose any two bars to form a container. Return the maximum amount of water a container can store.
 */
func maxArea(_ heights: [Int]) -> Int {
	// Two pointers at the two ends
	// find area and store max
	// move the smaller of the two

	var i = 0
	var j = heights.count - 1
	var maxArea = 0
	while i < j {
		let area = (j - i) * min(heights[i], heights[j])
		maxArea = max(maxArea, area)
		if heights[i] < heights[j] {
			i += 1
		} else {
			j -= 1
		}
	}
	return maxArea
}

@Suite("Container with most water") struct ContainerWithMostWaterTests {
	// This can be tested for multiple values using the same test
	@Test
	func returnsMaxAreaForExample1() {
		let heights = [1,7,2,5,4,7,3,6]
		let expectedArea = 36
		#expect(maxArea(heights) == expectedArea)
	}


}
