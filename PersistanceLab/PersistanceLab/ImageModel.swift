//
//  ImageModel.swift
//  PersistanceLab
//
//  Created by Ian Bailey on 1/21/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import Foundation


struct Images: Decodable {
    let hits: [ImageInfo]
}

struct ImageInfo: Decodable {
    let largeImageUrl: String
    let likes: Int
}
