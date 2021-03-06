//
//  Application+Static.swift
//  FeatherCMS
//
//  Created by Tibor Bodecs on 2020. 01. 26..
//

import Vapor

extension Application {

    static let baseUrl = Environment.get("BASE_URL")!
    static let databaseUrl = URL(string: Environment.get("DB_URL")!)!
    
    // paths are always absolute, with a trailing slash
    struct Paths {
        static let base: String = Environment.get("BASE_PATH")!
        static let `public`: String = Paths.base + "Public/"
        static let assets: String = Paths.public + "assets/"
        static let resources: String = Paths.base + "Resources/"
    }

    // locations are always relative with a trailing slash
    struct Locations {
        static let assets: String = "assets/"
        static let css: String = "css/"
        static let images: String = "images/"
        static let javascript: String = "javascript/"
    }
}
