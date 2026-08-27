//
//  QueueViaStack.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 8/26/26.
//

import Foundation

extension StackSolution {
	class QueueViaStack<S: Stack>: Queue where S.Item == Int {
		private var _storage: S
		private var _temp: S

		init(stackOne: S, stackTwo: S) {
			self._storage = S()
			self._temp = stackTwo
		}

		func add(_ item: Int) {
			self._storage.push(item)
		}

		func remove() -> Int? {
			if _temp.isEmpty() {
				while !_storage.isEmpty() {
					_temp.push(_storage.pop()!)
				}
			}
			return _temp.pop()
		}

		func isEmpty() -> Bool {
			self._storage.isEmpty()
		}
	}
}
