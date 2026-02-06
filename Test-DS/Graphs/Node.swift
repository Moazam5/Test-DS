//
//  Node.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/21/26.
//

import Foundation
public class Node:  Equatable {
	public var val: Int
	public var neighbors: [Node?]
	public init(_ val: Int) {
		self.val = val
		self.neighbors = []
	}


	public static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.val == rhs.val && lhs.neighbors == rhs.neighbors
	}
}
