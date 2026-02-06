//
//  PayPalProtocol.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/17/26.
//

import Foundation

protocol PayPalProtocol {
	/// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
	/// Link to problem: https://leetcode.com/problems/zigzag-conversion/description/
	func convert(_ s: String, _ numRows: Int) -> String
}

class PayPalSolution: PayPalProtocol {
	func convert(_ s: String, _ numRows: Int) -> String {
		if numRows == 1 || s.count <= numRows {
			return s
		}
		var rows = Array(repeating: "", count: numRows)
		var currentRow = 0
		var goingDown = false
		for char in s {
			rows[currentRow].append(char)
			if currentRow == 0 || currentRow == numRows - 1 {
				goingDown.toggle()
			}
			if goingDown {
				currentRow += 1
			} else {
				currentRow -= 1
			}
		}
		return rows.joined()
	}
}
