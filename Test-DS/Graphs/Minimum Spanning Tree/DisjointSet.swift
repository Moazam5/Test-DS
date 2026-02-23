//
//  DisjointSet.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/22/26.
//

import Foundation

struct DisjointSet {
	var rank: [Int] = []
	var parent: [Int] = []
	var size: [Int] = []

	init(n: Int) {
		self.rank = Array(repeating: 0, count: n + 1) // n + 1 to support 1 indexed graphs
		self.size = Array(repeating: 1, count: n + 1)
		self.parent = [Int]()
		self.parent.reserveCapacity(n + 1)
		for i in 0...n {
			self.parent.append(i)
		}
	}

	mutating func findUltimateParent(node: Int) -> Int {
		if node == self.parent[node] {
			return node
		}
		// Path compression.
		self.parent[node] = self.findUltimateParent(node: self.parent[node])
		return self.parent[node]
	}

	mutating func unionByRank(u: Int, v: Int) {
		let ultimateParentU = self.findUltimateParent(node: u)
		let ultimateParentV = self.findUltimateParent(node: v)

		// If they belong to the same component, then return
		if ultimateParentU == ultimateParentV {
			return
		}

		if self.rank[ultimateParentU] < self.rank[ultimateParentV] {
			self.parent[ultimateParentU] = ultimateParentV
		} else if self.rank[ultimateParentV] < self.rank[ultimateParentU] {
			self.parent[ultimateParentV] = ultimateParentU
		} else {
			self.parent[ultimateParentV] = ultimateParentU
			self.rank[ultimateParentU] += 1
		}
	}

	mutating func unionBySize(u: Int, v: Int) {
		let ultimateParentU = self.findUltimateParent(node: u)
		let ultimateParentV = self.findUltimateParent(node: v)

		// If they belong to the same component, then return
		if ultimateParentU == ultimateParentV {
			return
		}

		if self.size[ultimateParentU] < self.size[ultimateParentV] {
			self.parent[ultimateParentU] = ultimateParentV
			self.size[ultimateParentV] += self.size[ultimateParentU]
		} else {
			self.parent[ultimateParentV] = ultimateParentU
			self.size[ultimateParentU] += self.size[ultimateParentV]
		}
	}
}
