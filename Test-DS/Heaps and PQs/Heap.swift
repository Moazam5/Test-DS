//
//  Heap.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/15/26.
//

import Foundation
import Playgrounds

// Heap is a complete binary tree.
// Heap exists in two flavors, min heap and max heap.
// This is a generic implementation
struct Heap {
	var elements = [Int]()
	let priority: (Int, Int) -> Bool
	
	var isEmpty: Bool {
		self.elements.isEmpty
	}

	var count: Int {
		self.elements.count
	}

	func peek() -> Int? {
		self.elements.first
	}

	init(sort: @escaping (Int, Int) -> Bool) {
		self.priority = sort
	}

	mutating func insert(_ element: Int) {
		self.elements.append(element)
		self.bubbleUp(from: self.elements.count - 1)
	}
	}

	mutating private func bubbleUp(from index: Int) {
		var child = index
		var parent = (child - 1) / 2
		while child > 0 && priority(self.elements[child], self.elements[parent]) {
			self.elements.swapAt(child, parent)
			child = parent
			parent = (child - 1) / 2
		}
	}
}


#Playground {
	var heap = Heap(sort: >)
	heap.insert(3)
	heap.insert(4)
	print(heap.elements)
}
