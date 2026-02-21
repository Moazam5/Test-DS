//
//  WordLadder.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/21/26.
//

import Foundation

extension GraphsImpl {
	/// This is a very important problem, its a leet-code HARD but the logic is very simple once you work through it.
	func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
		var wordSet = Set(wordList)
		var q = [(word: String, level: Int)]()
		q.append((beginWord, 1))
		wordSet.remove(beginWord)
		let letters = (97...122).map { Character(UnicodeScalar($0)!) }
		var head = 0
		while head < q.count {
			let node = q[head]
			head += 1
			for i in 0..<node.word.count {
				for letter in letters {
					var newWord = Array(node.word)
					newWord[i] = letter
					let newString = String(newWord)
					if wordSet.contains(newString) {
						if newString == endWord {
							return node.level + 1
						}
						q.append((newString, node.level + 1))
						wordSet.remove(newString)
					}
				}
			}
		}
		return 0
	}

	func ladder() {
		class Solution {
			func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
				var wordSet = Set(wordList)
				var q = [(word: String, words: [String])]()
				q.append((beginWord, [beginWord]))
				wordSet.remove(beginWord)
				var res = [[String]]()
				let letters = (97...122).map { Character(UnicodeScalar($0)!) }
				var head = 0
				var prevLevel =  1

				while head < q.count {
					let node = q[head]
					head += 1

					if node.words.count == prevLevel + 1 {
						wordSet.remove(node.word)
					} else {
						prevLevel = node.words.count
					}

					if let last = node.words.last, last == endWord {
						res.append(node.words)
						continue
					}

					for i in 0..<node.word.count {
						for letter in letters {
							var newWord = Array(node.word)
							newWord[i] = letter
							let newString = String(newWord)
							if wordSet.contains(newString) {
								q.append((newString, node.words + [newString]))
							}

						}
					}
				}
				return res
			}
		}
	}
}
