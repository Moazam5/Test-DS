//
//  LCSProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/28/25.
//

import Foundation
import Playgrounds

struct LCSSolution: LCS {
	static let shared = LCSSolution()
}

#Playground {
	let str1 = "abc"
	let str2 = "def"
	let str3 = str1 + str2
	let lcs = LCSSolution()
	lcs.shortestCommonSupersequence("geek", "eke")
	lcs.printLCS("geek", "eekee")
	print(str1 + str2)
}

