//
//  MinStack.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/17/26.
//

import Foundation

/*
 Design a stack class that supports the push, pop, top, and getMin operations.

 MinStack() initializes the stack object.
 void push(int val) pushes the element val onto the stack.
 void pop() removes the element on the top of the stack.
 int top() gets the top element of the stack.
 int getMin() retrieves the minimum element in the stack.
 Each function should run in O(1) time.
 */


class MinStack {
	private var stack: [(element: Int, min: Int)] = []

	init() {}

	func push(_ val: Int) {
		let currentMin = self.getMin()
		let newMin = min(currentMin, val)
		let newElement = (element: val, min: newMin)
		self.stack.append(newElement)
	}

	func pop() {
		_ = self.stack.popLast()
	}

	func top() -> Int {
		self.stack.last?.element ?? Int.max
	}

	func getMin() -> Int {
		self.stack.last?.min ?? Int.max
	}
}

// Uses a node instead of a stack/array.
class MinStack2 {
	private var head: Node<Int>!

		func push(_ x: Int) {
			if head == nil {
				head = Node(value: x, min: x)
			} else {
				head = Node(value: x, min: min(head.min, x), next: head)
			}
		}

		func pop() {
			head = head.next
		}

		func top() -> Int {
			return head.value
		}

		func getMin() -> Int {
			return head.min
		}

	class Node<Value> {
		var next: Node?
		var value: Value
		var min: Value

		init(value: Value, min: Value, next: Node? = .none) {
			self.value = value
			self.min = min
			self.next = next
		}
	}
}
