//
//  ArraySolutions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/17/26.
//

import Foundation
import Playgrounds

struct ArraySolutions: ArrayQuestions {
	func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
		let set1 = Set(nums1)
//		let set2 = Set(nums2)

		var intersectionSet = Set<Int>()
		for num in nums2 {
			if set1.contains(num) {
				intersectionSet.insert(num)
			}
		}
		return Array(intersectionSet)

	}

	func isAnagram(_ s: String, _ t: String) -> Bool {
		guard s.count == t.count else {
			return false
		}
		var dict: [Character: Int] = [:]
		for char in s {
			dict[char, default: 0] += 1
		}
		for char in t {
			if let count = dict[char], count > 0 {
				dict[char] = count - 1
			} else {
				return false
			}
		}
		return true
	}

	func sortedSquares(_ nums: [Int]) -> [Int] {
		let n = nums.count
		let splitIndex = nums.firstIndex { $0 >= 0 } ?? n
		let negativeNums = nums[0..<splitIndex]
		let positiveNums = nums[splitIndex..<n]
		let positiveSquares = positiveNums.map { $0 * $0 }
		let negativeSquares = Array(negativeNums.map { $0 * $0 }.reversed())
		var resArray: [Int] = []
		var (p,q) = (0,0)

		while p < positiveSquares.count && q < negativeSquares.count {
			if positiveSquares[p] < negativeSquares[q] {
				resArray.append(positiveSquares[p])
				p += 1
			} else {
				resArray.append(negativeSquares[q])
				q += 1
			}
		}
		
		while p < positiveSquares.count {
			resArray.append(positiveSquares[p])
			p += 1
		}

		while q < negativeNums.count {
			resArray.append(negativeSquares[q])
			q += 1
		}
		
		return resArray
	}

}

#Playground {
	let arr = ArraySolutions()
	let res = arr.isAnagram("a", "abb")
	let res2 = arr.sortedSquares([-4,-1,0,3,10]) == [0,1,9,16,100]
}
