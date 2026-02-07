//
//  FloodFill.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/6/26.
//

import Foundation

extension GraphsImpl {
	func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
		let m = image.count
		let n = image[0].count
		let dirs = [(0,1), (1,0), (-1, 0), (0, -1)]
		var image = image
		let startColor = image[sr][sc]

		if startColor == color {
			return image
		}
		func dfs(_ i: Int, _ j: Int) {
			guard i >= 0, i < m, j >= 0, j < n, image[i][j] == startColor else {
				return
			}

			image[i][j] = color
			for dir in dirs {
				dfs(dir.0 + i, dir.1 + j)
			}
		}

		dfs(sr, sc)
		return image
	}
}
