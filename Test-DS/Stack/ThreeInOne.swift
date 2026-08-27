//
//  ThreeInOne.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 8/25/26.
//

import Foundation

extension StackSolution {
	struct ThreeInOne {
		private var storage: Array<Int>
		private var pointers: Array<Int>
		init(capacity: Int) {
			self.storage = Array(repeating: 0, count: capacity)
			self.pointers = [0, capacity / 2, capacity * (2 / 3)]
		}

		func push(to stack: Int, _ element: Int) {}

		func pop(from stack: Int) -> Int? {
			guard stack < 3 else { return nil }
			let pointer = self.pointers[stack]
			let index = pointer / stack
			guard index < 3 else { return nil }
			return self.storage[pointer]
		}

		func peek(from stack: Int) -> Int? {
			self.storage[stack]
		}
	}
}

protocol P {
	func req() -> String        // a requirement
}
extension P {
	func req() -> String { "P.req" }
	func nonReq() -> String { "P.nonReq" }   // NOT a requirement, only in the extension
}

struct S: P {
	func req() -> String { "S.req" }
	func nonReq() -> String { "S.nonReq" }
}


import Playgrounds

#Playground {
	let s = S()
	s.req()      // "S.req"
	s.nonReq()   // "S.nonReq"

	let p: P = S()
	p.req()      // "S.req"     ← dynamic dispatch
	p.nonReq()   // "P.nonReq"  ← static dispatch, S's version is ignored!
}
