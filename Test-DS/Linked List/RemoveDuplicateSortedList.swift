//
//  RemoveDuplicateSortedList.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 3/2/26.
//

import Foundation

extension LinkedListSolutions {
	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
		var trav = head
		while trav != nil {
			while let curr = trav?.value, let next = trav?.next?.value, curr == next {
				trav?.next = trav?.next?.next
			}
			trav = trav?.next
		}
		return head
	}
}
