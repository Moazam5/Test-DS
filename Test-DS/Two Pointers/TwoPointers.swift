//
//  TwoPointers.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/28/25.
//

import Foundation

protocol TwoPointersProblems {
	/// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward.
	/// Alphanumeric characters include letters and numbers.
	/// Given a string s, return true if it is a palindrome, or false otherwise.
	func isPalindrome(_ s: String) -> Bool
}

enum TwoPointers: TwoPointersProblems {
	func isPalindrome(_ s: String) -> Bool {
		return ValidPalindrome.isPalindrome(s)
	}
	
}


