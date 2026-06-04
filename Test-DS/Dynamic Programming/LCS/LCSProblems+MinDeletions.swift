//
//  LCSProblems+MinDeletions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation

extension LCSSolution {
	/// Minimum number of deletions to make a string palindrome
	/// Given a string of size ‘n’. The task is to remove or delete minimum number of characters from the string so that the resultant string is palindrome.
	func minDeletions(_ s: String) -> Int {
		let lcsCount = self.longestCommonSubsequence(s, String(s.reversed()))
		return s.count - lcsCount
	}
}
