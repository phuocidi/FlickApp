//
//  Base.swift
//  Base
//
//  Created by Huu Phuoc Tran on 1/2/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//

import Foundation
struct Root : Codable {
	let photos : Photos?
	let stat : String?

	enum CodingKeys: String, CodingKey {

		case photos = "photos"
		case stat = "stat"
	}
}
