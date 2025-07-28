//
//  LinkedList.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/14/25.
//

import Foundation

protocol LinkedListProtocol {
	var node: ListNode? { get set }
	var isEmpty: Bool { get }
	var count: Int { get }
	func append(at index: Int) -> Void
	func remove(at index: Int) -> ListNode?
	func value(at index: Int) -> Int?
}

class LinkedList: LinkedListProtocol {
	var node: ListNode?
	
	var isEmpty: Bool

	var count: Int

	func append(at index: Int) {
		<#code#>
	}

	func remove(at index: Int) -> ListNode? {
		<#code#>
	}

	func value(at index: Int) -> Int? {
		<#code#>
	}

}
