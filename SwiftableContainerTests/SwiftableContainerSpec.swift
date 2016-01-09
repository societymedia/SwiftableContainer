import Foundation
import Quick
import Nimble
import SwiftableContainer

class NotSwiftable {

}

class SwiftableContainerSpec: QuickSpec {
    override func spec() {



        beforeEach {
            SwiftableContainer.empty()
        }


        describe("Container") {

            context("SharedInstance") {
                it("should be a singleton") {
                    expect(SwiftableContainer.itemCount).to(equal(0))
                }
            }

            context("Binds Types conforming to Swiftable") {
                it("TestClassA") {

                    SwiftableContainer.bind(TestClassA)
                    expect(SwiftableContainer.itemCount).to(equal(1))
                }

                it("TestClassB") {
                    SwiftableContainer.bind(TestClassB)
                    expect(SwiftableContainer.itemCount).to(equal(1))
                }

                it("TestClassC") {
                    SwiftableContainer.bind(TestClassC)
                    expect(SwiftableContainer.itemCount).to(equal(1))
                }

                it("TestClassC") {
                    SwiftableContainer.bind(TestClassD)
                    expect(SwiftableContainer.itemCount).to(equal(1))
                }
            }

            context("Resolves") {
                it("TestClassA") {

                    let a = TestClassA()
                    SwiftableContainer.bind(TestClassA)
                    var instance = SwiftableContainer.resolve(TestClassA)


                    expect(instance).toNot(beNil())
                }
                it("Singleton TestClassA") {

                    SwiftableContainer.bind(TestClassA.self, withScope: SwiftableContainerScope.Singleton)

                    var instance = SwiftableContainer.resolve(TestClassA)
                    expect(instance).toNot(beNil())
                }

                it("Transient TestClassA") {

                    SwiftableContainer.bind(TestClassA.self, withScope: SwiftableContainerScope.Transient)

                    var instance = SwiftableContainer.resolve(TestClassA)
                    expect(instance).toNot(beNil())
                }
            }
        }
    }
}
