//
//  LCSProblems+MinInsertionAndDeletions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation
import Playgrounds

extension LCSProblems {
	func minInsertionAndDeletions(_ s1: String, _ s2: String) -> Int {
		let lcs = self.longestCommonSubsequence(s1, s2)
		return (s1.count - lcs) + (s2.count - lcs)
	}
}

#Playground {
	let lcs = LCSProblems()
	lcs.printLCS("abbc", "bb")
}
