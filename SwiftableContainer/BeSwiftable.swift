//
// Created by Tony Merante on 1/9/16.
// Copyright (c) 2016 Societymedia. All rights reserved.
//

import Foundation
public class BeSwiftable: Swiftable {
    var title: String?
    var pagerank: String?
    var url: String?

    lazy var mirror: Mirror =  {
        let children = DictionaryLiteral<String, Any>(dictionaryLiteral:
        ("title", self.title), ("pagerank", self.pagerank),
                ("url", self.url))


        return Mirror.init(BeSwiftable.self, children: children,
                displayStyle: Mirror.DisplayStyle.Class,
                ancestorRepresentation:.Suppressed)
    }()




    public required init() {
    }


}