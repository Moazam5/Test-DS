//
//  LCSProblems+MinDeletions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation

extension LCSProblems {
	func minDeletions(_ s: String) -> Int {
		let lcsCount = self.longestCommonSubsequence(s, String(s.reversed()))
		return s.count - lcsCount
	}
}
