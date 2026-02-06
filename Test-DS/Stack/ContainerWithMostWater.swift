//
//  ContainerWithMostWater.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/17/25.
//

import Foundation
import Testing

extension StackSolution {
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
}
