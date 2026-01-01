//
//  ValidPalindrome.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/28/25.
//

import Foundation

extension TwoPointers {
	// I also tried using `.replaceOccurancesOf` but that didn't work because the string can also have ",", ":", etc.
	struct ValidPalindrome {
		static func isPalindrome(_ s: String) -> Bool {
			let chars = Array(s.lowercased())
			var left = 0
			var right = chars.count - 1
			
			while left < right {
				while left < right && !chars[left].isLetter && !chars[left].isNumber {
					left += 1
				}
				while left < right && !chars[right].isLetter && !chars[right].isNumber {
					right -= 1
				}
				if chars[left] != chars[right] {
					return false
				}
				left += 1
				right -= 1
			}
			return true
		}
	}
}
