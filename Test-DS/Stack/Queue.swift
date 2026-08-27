//
//  Queue.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 8/26/26.
//

import Foundation

protocol Queue {
	associatedtype Item

	func add(_ item: Item)
	func remove() -> Item?
	func isEmpty() -> Bool
}
