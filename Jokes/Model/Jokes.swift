//
//  Jokes.swift
//  Jokes
//
//  Created by Александр Уткин on 06.03.2020.
//  Copyright © 2020 Александр Уткин. All rights reserved.
//

import Foundation

struct Jokes: Decodable {
    let type: String
    let value: [Value]
}

struct Value: Decodable {
    let id: Int
    let joke: String
    let categories: [String]
}
