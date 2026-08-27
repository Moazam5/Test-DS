//
//  Stack.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 8/26/26.
//

import Foundation

protocol Stack {
	associatedtype Item

	func push(_ item: Item)
	func pop() -> Item?
	func isEmpty() -> Bool

	init()
}
