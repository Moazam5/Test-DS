//
//  Page5.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 3/15/25.
//

import Foundation
import Testing

// Int linked list node Swift.
class Node<T> {
	var value: T
	var next: Node?

	init(value: T, next: Node? = nil) {
		self.value = value
		self.next = next
	}
}

func traverseList<T>(node: Node<T>?) {
	var temp = node
	while temp != nil {
		print(temp?.value ?? "")
		temp = temp?.next
	}
}

@Test func testTraverList() {
	// Create individual nodes
	let node1 = Node(value: "A")
	let node2 = Node(value: "B")
	let node3 = Node(value: "C")

	// Link the nodes together
	node1.next = node2
	node2.next = node3

	traverseList(node: node1)
}


func reverseLinkedList<T>(head: Node<T>?) -> Node<T>?{
	var prev: Node<T>?
	var current = head

	while current != nil {
		var temp = current?.next
		current?.next = prev
		prev = current
		current = temp
	}
	return prev
}

@Test
func testReverseLinedList() {
	// Create individual nodes
	let node1 = Node(value: "A")
	let node2 = Node(value: "B")
	let node3 = Node(value: "C")

	// Link the nodes together
	node1.next = node2
	node2.next = node3

	reverseLinkedList(head: node1)
	traverseList(node: node3)
}

