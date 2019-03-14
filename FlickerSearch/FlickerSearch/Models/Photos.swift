//
//  Photos.swift
//  Photos
//
//  Created by Huu Phuoc Tran on 1/2/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//
import Foundation
struct Photos : Codable {
	let page : Int?
	let pages : Int?
	let perpage : Int?
	let total : String?
	let photo : [Photo]?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case pages = "pages"
		case perpage = "perpage"
		case total = "total"
		case photo = "photo"
	}
}
