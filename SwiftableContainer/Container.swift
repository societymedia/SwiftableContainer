//
// Created by Tony Merante on 1/3/16.
// Copyright (c) 2016 Societymedia. All rights reserved.
//

import Foundation

public enum ContainerScope {
    case Singleton
    case Transient
}


public protocol Swiftable {
    init()

}

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

public class TestClassA: BeSwiftable {

 public var item: String = "name"

    public func yo() {

    }
}

public class TestClassB: BeSwiftable { }

public class TestClassC: BeSwiftable { }

public class TestClassD: BeSwiftable { }

public class Container {

    private static let sharedInstance = Container()
    private var container = Dictionary<String, () -> BeSwiftable>()

    init() { }


    public class var itemCount:Int {
        return sharedInstance.container.count
    }

    class public func bind<T:BeSwiftable>(bindableType: T.Type) {
        Container.bind(bindableType, withScope: .Singleton)
    }

    class public func bind<T:BeSwiftable>(bindableType: T.Type, withScope scope:ContainerScope) {

        let myStr = String(bindableType)

        if scope == .Singleton {
            let instance = T()
            sharedInstance.container[myStr] = {
                return instance
            }
        } else {
            sharedInstance.container[myStr] = {
                return T()
            }
        }
    }

    class public func resolve<T>(swiftType: T.Type) -> T {
        let myStr = String(swiftType)

        let value = sharedInstance.container[myStr]!()

        print(value)
        return value as! T
    }

    class public func empty() {
        sharedInstance.container.removeAll(keepCapacity: false)
    }
}
