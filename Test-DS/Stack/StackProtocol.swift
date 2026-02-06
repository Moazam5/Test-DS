//
//  StackProtocol.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/17/26.
//

import Foundation

protocol Stack {
	func isValid(_ str: String) -> Bool

	/// Container With Most Water
	/// You are given an integer array heights where heights[i] represents the height of the ith bar.
	///	You may choose any two bars to form a container. Return the maximum amount of water a container can store.
	func maxArea(_ heights: [Int]) -> Int

	/// https://leetcode.com/problems/evaluate-reverse-polish-notation/description/
	func evalRPN(_ tokens: [String]) -> Int
}
