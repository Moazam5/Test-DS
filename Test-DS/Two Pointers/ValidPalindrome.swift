//
//  ValidPalindrome.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/28/25.
//

import Foundation

extension TwoPointers {
	struct ValidPalindrome {
		static func isPalindrome(_ s: String) -> Bool {
			var left = s.startIndex
			var right = s.index(before: s.endIndex)
			
			while left < right {
				if s[left] != s[right] {
					return false
				}
			}
		}
	}
}
