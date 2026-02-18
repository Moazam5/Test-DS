//
//  KClosestPoints.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

extension HeapSolutions {
	func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
		var dict: [Double: [[Int]]] = [:]
		var heap = MyHeap<Double>()
		var res = [[Int]]()
		for point in points {
			let x1 = Double(point[0])
			let y1 = Double(point[1])
			let distance = sqrt(pow(x1, 2) + pow(y1, 2))
			dict[distance, default: []].append(contentsOf: [point])
			heap.insert(distance)
		}
		while res.count < k, let d = heap.pop() {
			guard var bucket = dict[d], !bucket.isEmpty else { continue }

			// take only as many as needed
			while res.count < k, !bucket.isEmpty {
				res.append(bucket.removeLast())
			}
			dict[d] = bucket // write back remaining (if any)
		}
		return res
	}
}
