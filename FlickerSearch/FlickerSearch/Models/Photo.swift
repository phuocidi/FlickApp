//
//  Photo.swift
//  Photo
//
//  Created by Huu Phuoc Tran on 1/2/19.
//  Copyright © 2019 a.b.c. All rights reserved.
//
import Foundation
struct Photo : Codable {
	let id : String?
	let owner : String?
	let secret : String?
	let server : String?
	let farm : Int?
	let title : String?
	let ispublic : Int?
	let isfriend : Int?
	let isfamily : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case owner = "owner"
		case secret = "secret"
		case server = "server"
		case farm = "farm"
		case title = "title"
		case ispublic = "ispublic"
		case isfriend = "isfriend"
		case isfamily = "isfamily"
	}

}
