//
//  LengthOfShortestSuperSequence.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/4/26.
//

import Foundation
import Playgrounds

extension LCSSolution {
	@discardableResult
	func lenghtOfShortestSuperSequence(_ str1: String, _ str2: String) -> Int {
		let lcs = self.longestCommonSubsequence(str1, str2)
		// n(A) U n(B) = n(A) + n(B) - n(A n B)
		return str1.count + str2.count - lcs
	}
}

#Playground {
	LCSSolution.shared.lenghtOfShortestSuperSequence("geek", "eke")
}
