//
//  DesignTwitter.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

class Twitter {
	var users: [Int: User] = [:]
	var time = 0

	func postTweet(_ userId: Int, _ tweetId: Int) {
		var user = users[userId, default: User(userId)]
		user.addTweet(id: tweetId, time: time)
		users[userId] = user
		time += 1
	}

	func getNewsFeed(_ userId: Int) -> [Int] {
		guard let user = users[userId] else { return [] }
		var heap = MyHeap<Tweet>(isMinHeap: false)
		for t in user.tweets { heap.insert(t) }
		for fid in user.following {
			if let u = users[fid] {
				for t in u.tweets { heap.insert(t) }
			}
		}
		var res: [Int] = []
		while res.count < 10, let t = heap.pop() {
			res.append(t.id)
		}
		return res
	}

	func follow(_ followerId: Int, _ followeeId: Int) {
		var user = users[followerId, default: User(followerId)]
		if followerId != followeeId { user.addFollowing(id: followeeId) }
		users[followerId] = user
	}

	func unfollow(_ followerId: Int, _ followeeId: Int) {
		guard var user = users[followerId] else { return }
		user.removeFollowing(id: followeeId)
		users[followerId] = user
	}

	struct User: Identifiable {
		let id: Int
		var tweets: [Tweet] = []
		var following: Set<Int> = []
		init(_ id: Int) { self.id = id }
		mutating func addTweet(id: Int, time: Int) {
			tweets.append(Tweet(id, time: time))
		}
		mutating func addFollowing(id: Int) {
			following.insert(id)
		}
		mutating func removeFollowing(id: Int) {
			following.remove(id)
		}
	}

	struct Tweet: Identifiable, Comparable {
		let id: Int
		let time: Int
		init(_ id: Int, time: Int) {
			self.id = id
			self.time = time
		}
		static func < (lhs: Tweet, rhs: Tweet) -> Bool {
			lhs.time < rhs.time
		}
	}
}
