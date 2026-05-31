//
//  BotChallenge.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/4/26.
//

import Foundation

protocol Bot {
	var keywords: [BotKeywords] { get set }
}

struct BotKeywords {
	let title: String
	let action: (Int, String) -> String
}

protocol BotParser {
	func receive(messages: [String], from bot: Bot) -> [[String]]
}

struct BotImpl: BotParser {
	func receive(messages: [String], from bot: Bot) -> [[String]] {
		var res: [[String]] = []
		var seenKeywords: [String: [BotKeywords]] = [:]

		for message in messages {
			let item = message.split(separator: ":", maxSplits: 1)
			guard item.count == 2 else { continue }
			let person = String(item[0])
			let contents = String(item[1])
			res.append([contents])

			for keyword in bot.keywords {
				if contents.contains(keyword.title) {
					seenKeywords[person, default: []].append(keyword)
					if let allKeywords = seenKeywords[person] {
						let count = allKeywords.filter({ $0.title == keyword.title }).count
						res.append([keyword.action(count, person)])
					}
				}
			}
		}
		return res
	}
}
