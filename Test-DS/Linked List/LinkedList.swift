//
//  LinkedList.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/14/25.
//

import Foundation

protocol LinkedListConforming {
	var head: ListNode? { get set }
	var isEmpty: Bool { get }
	var count: Int { get }
	func append(value: Int, at index: Int)
	func remove(at index: Int) -> ListNode?
	func value(at index: Int) -> Int?
}

class LinkedList: LinkedListConforming {
	var head: ListNode?

	var isEmpty: Bool {
		head == nil ? true : false
	}

	var count: Int {

	}

	func append(value: Int, at index: Int) {
		let newNode = ListNode(value: value)

		// Case 1: empty list
		if head == nil {
			head = newNode
			return
		}

		var current = head
		while current?.next != nil {
			current = current?.next
		}

		current?.next = newNode
	}

	func remove(at index: Int) -> ListNode? {
		guard index >= 0 else {
			return nil
		}

		if index == 0 {
			let removedNode = head
			head = head?.next
			return removedNode
		}

		var current = head
		var previous: ListNode?
		var currentIndex = 0

		// Traverse until reaching index
		while current != nil && currentIndex < index {
			previous = current
			current = current?.next
			currentIndex += 1
		}

		// If index is out of bounds
		guard current != nil else {
			return nil
		}

		// Remove the node
		previous?.next = current?.next
		return previous
	}

	func value(at index: Int) -> Int? {
		var current = head
		var currentIndex = index
		while current != nil && currentIndex > 0 {
			current = current?.next
			currentIndex -= 1
		}
		return current?.value
	}

	func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
		let dummy: ListNode? = ListNode(value: 0, next: nil)
		var current = dummy
		var (l1, l2) = (list1, list2)

		while l1 != nil || l2 != nil {
			if list1!.value < list2!.value {
				current?.next = list1
				l1 = l1?.next
			} else {
				current?.next = list2
				l2 = l2?.next
			}
			current = current?.next
		}
		current?.next = l1 ?? l2
		return dummy?.next
	}
}
