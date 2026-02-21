//
//  WordLadder-II.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/21/26.
//

import Foundation

extension GraphsImpl {
	/// This approach gets TLE in leet-code but is recommended approach for interview.
	func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
		var wordSet = Set(wordList)

		guard wordSet.contains(endWord) else {
			return []
		}
		let letters = (97...122).map { Character(UnicodeScalar($0)!) }
		var q: [[String]] = [[beginWord]]
		var head = 0
		var level = 1
		var usedOnLevel = Set<String>()
		var ans = [[String]]()

		while head < q.count {
			let nodes = q[head]
			head += 1

			// stop if we are deeper than the shortest answer
			if !ans.isEmpty && nodes.count > ans[0].count {
				break
			}

			if nodes.count > level {
				// entering next level: remove words used in previous level
				for w in usedOnLevel { wordSet.remove(w) }
				usedOnLevel.removeAll()
				level = nodes.count
			}

			guard let word = nodes.last else { continue }

			if word == endWord {
				if ans.isEmpty || ans[0].count == nodes.count {
					ans.append(nodes)
				}
				continue
			}

			var chars = Array(word)
			for i in 0..<chars.count {
				let original = chars[i]
				for ch in letters {
					if ch == original { continue }
					chars[i] = ch
					let next = String(chars)

					if wordSet.contains(next) {
						var newPath = nodes          // ✅ don't mutate `nodes`
						newPath.append(next)
						q.append(newPath)
						usedOnLevel.insert(next)
					}
				}
				chars[i] = original
			}
		}

		return ans
	}
}
