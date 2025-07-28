//
//  KeyValueStore.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/3/25.
//

import Foundation
/*
 Implement a time-based key-value data structure that supports:

 Storing multiple values for the same key at specified time stamps
 Retrieving the key's value at a specified timestamp
 Implement the TimeMap class:

 TimeMap() Initializes the object.
 void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
 String get(String key, int timestamp) Returns the most recent value of key if set was previously called on it and the most recent timestamp for that key prev_timestamp is less than or equal to the given timestamp (prev_timestamp <= timestamp).

 If there are no values, it returns "".
 Note: For all calls to set, the timestamps are in strictly increasing order.
 def set(self, key: str, value: str, timestamp: int) -> None:
 def get(self, key: str, timestamp: int) -> str:
 Recommended Time: O(logN) for get
 */

class TimeMap {
	var keyStore: [String: [KeyStoreItem]] = [:]
	func set(key: String, value: String, timestamp: Int) {
		if keyStore[key] != nil {
			self.keyStore[key]?.append(KeyStoreItem(value: value, timestamp: timestamp))
		} else {
			keyStore[key] = [KeyStoreItem(value: value, timestamp: timestamp)]
		}
	}

	func get(key: String, timestamp: Int) -> String {
		guard let value = self.keyStore[key] else {
			return ""
		}
		var l = 0
		var r = value.count - 1
		var res = ""
		while l <= r {
			let m = l + (r - l) / 2
			if value[m].timestamp <= timestamp {
				l = m + 1
				res = value[m].value
			} else {
				r = m - 1
			}
		}
		return res
	}
	struct KeyStoreItem {
		let value: String
		let timestamp: Int
	}
}
