//
//  String+URLify.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/27/26.
//

import Foundation

extension ArraySolutions {
	func urlify(_ str: inout String, len: Int) {
		var chars = Array(str)
		let numberOfSpaces = chars.prefix(len).filter { $0 == " " }.count
		if numberOfSpaces == 0 {
			return
		}

		var newIdx = len + (numberOfSpaces * 2) - 1

		for i in stride(from: len - 1, through: 0, by: -1) {
			let char = chars[i]
			if char == " " {
				chars[newIdx]     = "0"
				chars[newIdx - 1] = "2"
				chars[newIdx - 2] = "%"
				newIdx -= 3
			} else {
				chars[newIdx] = char
				newIdx -= 1
			}
		}

		str = String(chars)

	}
}
