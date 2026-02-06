//
//  LinkedListNode.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/14/25.
//

import Foundation

class ListNode {
	var value: Int
	var next: ListNode?

	init(value: Int, next: ListNode? = nil) {
		self.value = value
		self.next = next
	}
}

/*
 It was create a function that takes a string and returns the length of the longest substring with no repeating letters.
 */

import Playgrounds
#Playground {
	func longestSubstring(_ str: String) -> Int {

	}

	longestSubstring("abccdef")
}
