//
//  TaskScheduler.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

extension HeapSolutions {
	func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
		var dict: [Character: Int] = [:]
		for task in tasks {
			dict[task, default: 0] += 1
		}

		let values: [Int] = Array(dict.values)
		var heap = MyHeap(contentsOf: values, isMinHeap: false)
		var q = [(priority: Int, time: Int)]()
		var time = 0

		while !heap.isEmpty || !q.isEmpty {
			time += 1

			if let node = heap.pop() {
				if node > 1 {
					q.append((node - 1, time + n))
				}
			}
			if let waitingTask = q.first, waitingTask.time == time {
				q.removeFirst()
				heap.insert(waitingTask.priority)
			}
		}
		return time
	}
}
