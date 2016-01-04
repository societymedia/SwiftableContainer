import Foundation
import Quick
import Nimble
import SwiftableContainer

class NotSwiftable {

}

class ContainerSpec : QuickSpec {
    override func spec() {



        beforeEach {
            Container.empty()
        }


        describe("Container") {

            context("SharedInstance") {
                it("should be a singleton") {
                    expect(Container.itemCount).to(equal(0))
                }
            }

            context("Binds Types conforming to Swiftable") {
                it("TestClassA") {

                    Container.bind(TestClassA)
                    expect(Container.itemCount).to(equal(1))
                }

                it("TestClassB") {
                    Container.bind(TestClassB)
                    expect(Container.itemCount).to(equal(1))
                }

                it("TestClassC") {
                    Container.bind(TestClassC)
                    expect(Container.itemCount).to(equal(1))
                }

                it("TestClassC") {
                    Container.bind(TestClassD)
                    expect(Container.itemCount).to(equal(1))
                }
            }

            context("Resolves") {
                it("TestClassA") {

                    let a = TestClassA()
                    Container.bind(TestClassA)
                    var instance = Container.resolve(TestClassA)


                    expect(instance).toNot(beNil())
                }
                it("Singleton TestClassA") {

                    Container.bind(TestClassA.self, withScope: ContainerScope.Singleton)

                    var instance = Container.resolve(TestClassA)
                    expect(instance).toNot(beNil())
                }

                it("Transient TestClassA") {

                    Container.bind(TestClassA.self, withScope: ContainerScope.Transient)

                    var instance = Container.resolve(TestClassA)
                    expect(instance).toNot(beNil())
                }
            }
        }
    }
}
