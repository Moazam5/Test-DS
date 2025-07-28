//
//  Problem1.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/17/25.
//

import Foundation

/*
 Best Time to Buy and Sell Stock
 You are given an integer array prices where prices[i] is the price of NeetCoin on the ith day.

 You may choose a single day to buy one NeetCoin and choose a different day in the future to sell it.

 Return the maximum profit you can achieve. You may choose to not make any transactions, in which case the profit would be 0.

 Example 1:

 Input: prices = [10,1,5,6,7,1]

 Output: 6
 Explanation: Buy prices[1] and sell prices[4], profit = 7 - 1 = 6.

 Example 2:

 Input: prices = [10,8,7,5,2]

 Output: 0
 */


func maxProfit(_ prices: [Int]) -> Int {
	guard !prices.isEmpty else {
		return 0
	}

	var maxProfit = 0
	var leftPointer = 0
	var rightPointer = 1
	while rightPointer < prices.count {
		let leftValue = prices[leftPointer]
		let rightValue = prices[rightPointer]
		if leftValue > rightValue {
			leftPointer = rightPointer
			rightPointer += 1
		} else {
			maxProfit = max(maxProfit, rightValue - leftValue)
			rightPointer += 1
		}
	}
	return maxProfit
}
