//
//  TwoPointers.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/28/25.
//

import Foundation

enum TwoPointers: TwoPointersProblems {
	func isPalindrome(_ s: String) -> Bool {
		return ValidPalindrome.isPalindrome(s)
	}
}

protocol TwoPointersProblems {
	func isPalindrome(_ s: String) -> Bool
}
