//
//  Playground.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/9/25.
//

import Foundation
import Testing


func playground() {

	print("------ \(Int(8/3))------------" )

	func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
		var result: [String] = []
		let groupSize = Int(ceil(Double(s.count)/Double(k) ))
		for i in 0...groupSize {
			var str = ""
			for j in 0...k {
				let offset = j * i
				if offset < s.count {
					str.append(s[s.index(s.startIndex, offsetBy: offset)])
				} else {
					str.append(fill)
				}
			}
			result.append(str)
		}
		return result
	}
}

@Suite struct Playground {
	@Test("Playground")
	func testPlayground() async throws {
		playground()
	}

}
