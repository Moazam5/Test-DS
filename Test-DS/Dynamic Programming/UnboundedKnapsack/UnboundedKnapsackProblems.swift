//
//  UnboundedKnapsackProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/31/26.
//

import Foundation

protocol UnboundedKnapsack {
	/// Given a knapsack weight, say capacity and a set of n items with certain value vali and weight wti, The task is to fill the knapsack in such a way that we can get the maximum profit. This is different from the classical Knapsack problem, here we are allowed to use an unlimited number of instances of an item.
	func unboundedKnapsack(_ weights: [Int], _ values: [Int], capacity: Int) -> Int

	func coinChange(_ list: [Int], _ sum: Int) -> Int
	///	Coin Change Problem Minimum Numbers of coins
	///	Given a value V, if we want to make change for V cents, and we have infinite supply of each of C = { C1, C2, .. , Cm} valued coins, what is the minimum number of coins to make the change?
	///	Example:
	///
	///	Input: coins[] = {25, 10, 5}, V = 30
	///	Output: Minimum 2 coins required
	///	We can use one coin of 25 cents and one of 5 cents
	///	https://neetcode.io/problems/coin-change-ii/question?list=neetcode250
	func coinChangeII(_ coins: [Int], _ amount: Int) -> Int
}
