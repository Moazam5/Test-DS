//
//  String+PalindromePermutation.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/28/26.
//

import Foundation
import Playgrounds

extension ArraySolutions {
	/// https://algo.monster/liteproblems/266
	func isPermutationOfPalindrome(_ str: String) -> Bool {
		var freq: [Character: Int] = [:]
		var foundOdd = false
		for char in str {
			if char == " " { continue }
			freq[char, default: 0] += 1
		}

		for (_, value) in freq {
			if value % 2 == 1 {
				if foundOdd {
					return false
				}
				foundOdd = true
			}
		}
		return true
	}
}

#Playground {
	_ = ArraySolutions.shared.isPermutationOfPalindrome("taco coa")
}
