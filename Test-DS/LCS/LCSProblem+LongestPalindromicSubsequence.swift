//
//  LCSProblem+LongestPalindromicSubsequence.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation

extension LCSProblems {
	func longestPalindromeSubseq(_ s: String) -> Int {
		return self.longestCommonSubsequence(s, String(s.reversed()))
	}
}
