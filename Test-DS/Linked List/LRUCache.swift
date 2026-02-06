//
//  LRUCache.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/5/26.
//

import Foundation

class LRUCache {
	final class Node {
		let key: Int
		var value: Int
		var next: Node?
		var prev: Node?

		init(key: Int, value: Int) {
			self.key = key
			self.value = value
		}
	}

	let capacity: Int
	var lookupTable: [Int: Node] = [:]
	var listHead: Node? = nil
	var listTail: Node? = nil
	init(_ capacity: Int) {
		self.capacity = capacity
	}

	func get(_ key: Int) -> Int {
		guard let node = self.lookupTable[key] else {
			return -1
		}
		// update the nodes in the linked list
		moveToTail(node)
		return node.value
	}


	func put(_ key: Int, _ value: Int) {
	// update existing
	if let node = lookupTable[key] {
		node.value = value
		moveToTail(node)
		return
	}

	// evict if full (before inserting new)
	if lookupTable.count == capacity {
		if let head = listHead {
			lookupTable.removeValue(forKey: head.key)

			let newHead = head.next
			listHead = newHead
			newHead?.prev = nil

			// if we evicted the only node
			if newHead == nil {
				listTail = nil
			}

			head.next = nil
			head.prev = nil
		}
	}

	// insert new node at tail
	let node = Node(key: key, value: value)
	lookupTable[key] = node

	if listTail == nil {
		listHead = node
		listTail = node
		return
	}

	node.prev = listTail
	listTail?.next = node
	listTail = node
}

	// MARK: Private Helpers

	private func moveToTail(_ node: Node) {
		// already MRU
		if node === listTail { return }

		// detach node from current position
		let prev = node.prev
		let next = node.next

		if node === listHead {
			 listHead = next
		}
		prev?.next = next
		next?.prev = prev

		// append to tail
		node.prev = listTail
		node.next = nil
		listTail?.next = node
		listTail = node

		// handle empty list
		if listHead == nil {
			 listHead = node
		}
	}
}
