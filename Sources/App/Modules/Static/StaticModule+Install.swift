//
//  StaticModule+Install.swift
//  FeatherCMS
//
//  Created by Tibor Bodecs on 2020. 07. 12..
//

import Vapor
import Fluent

extension StaticModule {

    func installHook(req: Request) -> EventLoopFuture<Any?>? {
        //req.eventLoop.flatten([
            self.installSampleContent(req)
        //])    
        .map { $0 as Any }
    }

    func installSampleContent(_ req: Request) -> EventLoopFuture<Void> {

        let p1 = StaticPageModel(id: UUID(), title: "Home", content: "[home-page]")
        let p2 = StaticPageModel(id: UUID(), title: "Posts", content: "[posts-page]")
        let p3 = StaticPageModel(id: UUID(), title: "Categories", content: "[categories-page]")
        let p4 = StaticPageModel(id: UUID(), title: "Authors", content: "[authors-page]")
        let c5 = try! String(contentsOfFile: Application.Paths.resources + "Sample/Content/AboutPage.html")
        let p5 = StaticPageModel(id: UUID(), title: "About", content: c5)

        return req.eventLoop.flatten([
            [p1, p2, p3, p4, p5].create(on: req.db),
            try! p1.publishAsHomeContent(on: req.db),
            try! p2.publishContent(on: req.db),
            try! p3.publishContent(on: req.db),
            try! p4.publishContent(on: req.db),
            try! p5.publishContent(on: req.db),
        ])
    }

}
