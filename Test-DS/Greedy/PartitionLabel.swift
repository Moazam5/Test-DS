//
//  PartitionLabel.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/8/26.
//

import Foundation
import Playgrounds

protocol Greedy {
	func partitionLabels(_ s: String) -> [Int]
}

struct GreedySolution {
	static let shared = GreedySolution()

	func partitionLabels(_ s: String) -> [Int] {
		var freq = [Character: (start: Int, end: Int)]()

		for (index, char) in s.enumerated() {
			if let val = freq[char] {
				freq[char]?.end = index
			} else {
				freq[char] = (index, index)
			}
		}

		let intervals = freq.values
		
		return []
		}
}

#Playground {
	let s = "xyxxyzbzbbisl"
	GreedySolution.shared.partitionLabels(s)
}
