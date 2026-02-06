//
//  LinkedListProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/28/25.
//

import Foundation

protocol LinkedListProblems {
	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? 
}

struct LinkedListSolutions: LinkedListProblems {
	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
		var fast = head
		var slow = head

		// Move fast pointer n steps ahead
		for _ in 0..<n {
			fast = fast?.next
		}

		// Edge case: removing the head node
		if fast == nil {
			return head?.next
		}

		// Move both pointers until fast reaches the last node
		while fast?.next != nil {
			fast = fast?.next
			slow = slow?.next
		}

		// Remove the nth node from end
		slow?.next = slow?.next?.next

		return head
	}
}
