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

    typealias ResolvableType
    init()
}

public class SwiftableStruct : Swiftable, Any {

    public typealias ResolvableType = AnyClass
    public required init() {

    }

}

public class TestClassA : SwiftableStruct {

}

public class TestClassB : SwiftableStruct {

}

public class TestClassC : SwiftableStruct {

}

public class TestClassD : SwiftableStruct {

}

//private let __ContainerSharedInstance = Container()

public class Container {

    private static let sharedInstance = Container()
    private var container = Dictionary<String, () -> SwiftableStruct>()

    init() { }


    public class var itemCount:Int {
        return sharedInstance.container.count
    }

    class public func bind<T:SwiftableStruct>(bindableType: T.Type) {

        let instance = T()

        let myStr = String(bindableType)

        sharedInstance.container[myStr] = {
            return instance
        }
    }

    class public func bind<T:SwiftableStruct>(bindableType: T.Type, withScope scope:ContainerScope) {


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
