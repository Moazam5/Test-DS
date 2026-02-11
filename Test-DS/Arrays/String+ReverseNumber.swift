//
//  String+ReverseNumber.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/10/26.
//

import Foundation

extension ArraySolutions {
	func addBinary(_ a: String, _ b: String) -> String {
		let arr = Array(a)
		let arr2 = Array(b)

		var m = arr.count
		var n = arr2.count
		var carry = 0
		var res = [String]()

		while m > 0 || n > 0 {
			let x = m > 0 ? Int(String(arr[m - 1]))! : 0
			let y = n > 0 ? Int(String(arr2[n - 1]))! : 0

			let sum = x + y + carry
			carry = sum / 2
			res.append(String(sum % 2))

			if m > 0 { m -= 1 }
			if n > 0 { n -= 1 }
		}

		if carry > 0 {
			res.append("1")
		}

		return (res.reversed().joined(separator: ""))
	}
}
