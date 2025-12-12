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
	var tail: ListNode? {
		var current = head
		while current?.next != nil {
			current = current?.next
		}
		return current
	}

	var isEmpty: Bool {
		head == nil ? true : false
	}

	var count: Int {
		var current = head
		var count = 0
		while current != nil {
			current = current?.next
			count += 1
		}
		return count
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
		guard index >= 0 else {
			return nil
		}
		var current = head
		var currentIndex = index
		while current != nil && currentIndex > 0 {
			current = current?.next
			currentIndex -= 1
		}
		return current?.value
	}

	func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
		let dummy = ListNode(value: 0)
		var current: ListNode? = dummy
		var l1 = list1
		var l2 = list2

		while let n1 = l1, let n2 = l2 {
			if n1.value < n2.value {
				current?.next = n1
				l1 = n1.next
			} else {
				current?.next = n2
				l2 = n2.next
			}
			current = current?.next
		}

		current?.next = l1 ?? l2
		return dummy.next
	}

///	 Given the beginning of a linked list head, return true if there is a cycle in the linked list. Otherwise, return false.
///
/// There is a cycle in a linked list if at least one node in the list can be visited again by following the next pointer.
///
/// Internally, index determines the index of the beginning of the cycle, if it exists. The tail node of the list will set it's next pointer to the index-th node. If index = -1, then the tail node points to null and no cycle exists.
///
///	 Note: index is not given to you as a parameter.
	func hasCycle(_ head: ListNode?) -> Bool {
		guard head != nil else {
			return false
		}
		var slow = head
		var fast = head
		while fast != nil, fast?.next != nil {
			slow = slow?.next
			fast = fast?.next?.next
			if slow === fast {
				return true
			}
		}
		return false 
	}
}
