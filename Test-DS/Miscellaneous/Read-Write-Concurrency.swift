//
//  Read-Write-Concurrency.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/27/26.
//

import Foundation

final class MyType: @unchecked Sendable {
	private var _myValue: Int = 0
	private let queue = DispatchQueue(label: "com.example.MyType", attributes: .concurrent)

	var myValue: Int {
		queue.sync { _myValue }
	}

	func setValue(_ newVal: Int) {
		queue.async(flags: .barrier) {
			self._myValue = newVal
		}
	}
}
