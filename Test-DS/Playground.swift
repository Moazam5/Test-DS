//
//  Playground.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/9/25.
//

import Foundation
import Playgrounds

#Playground {
	let x = 2
	print(x / 2)
	let res = ["a"]
	var strs = ["a", "b"].joined(separator: "+")
	res.dropFirst()
	res.count
	res.joined(separator: "").reversed()
	var dic1 = ["a": 1, "b": 2]
	let dict2 = ["b": 2, "a": 1]
	dict2 == dic1
	dict2.count
	dic1["a"] = nil
	dic1

}
