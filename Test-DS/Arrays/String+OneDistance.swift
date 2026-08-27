//
//  String+OneDistance.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/28/26.
//

import Foundation
import Playgrounds

extension ArraySolutions {
	/// https://algo.monster/liteproblems/161
	func oneEditAway(_ str1: String, _ str2: String) -> Bool {
		let diff = abs(str1.count - str2.count)
		guard diff <= 1 else {
			return false
		}
		let (a, b) = (Array(str1), Array(str2))
		let (smaller, larger) = a.count > b.count ? (b, a) : (a, b)

		var i = 0

		while i < smaller.count {
			if smaller[i] != larger[i] {
				if smaller.count == larger.count {
					return smaller[(i + 1)...] == larger[(i + 1)...]
				} else {
					return smaller[i...] == larger[(i + 1)...]
				}
			}
			i += 1
		}
		return larger.count == smaller.count + 1
	}

	func compressString(_ str: String) -> String {
		var curr: Character = str.first!
		var count = 1
		var res = ""

		for char in str.dropFirst() {
			if char == curr {
				count += 1
			} else {
				res.append(curr)
				res.append("\(count)")
				curr = char
				count = 1
			}
		}
		res.append(curr)
		res.append("\(count)")
		return res
	}
}

#Playground {
	_ = ArraySolutions.shared.oneEditAway("pale", "ple")
	_ = ArraySolutions.shared.oneEditAway("pale", "pales")
	_ = ArraySolutions.shared.oneEditAway("pale", "bale")
	_ = ArraySolutions.shared.oneEditAway("pale", "bae") // false
	_ = ArraySolutions.shared.compressString("aabbcccc")
}
