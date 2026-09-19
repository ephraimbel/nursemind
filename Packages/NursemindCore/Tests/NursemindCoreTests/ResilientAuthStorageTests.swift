import Foundation
import Testing
import Supabase
@testable import NursemindCore

@Suite("Resilient auth storage")
struct ResilientAuthStorageTests {
    /// Stand-in Keychain whose failure can be switched on per call type.
    final class FakeKeychain: AuthLocalStorage, @unchecked Sendable {
        struct Failure: Error {}
        var items: [String: Data] = [:]
        var failStore = false
        var failRetrieve = false
        var failRemove = false

        func store(key: String, value: Data) throws {
            if failStore { throw Failure() }
            items[key] = value
        }
        func retrieve(key: String) throws -> Data? {
            if failRetrieve { throw Failure() }
            return items[key]
        }
        func remove(key: String) throws {
            if failRemove { throw Failure() }
            items[key] = nil
        }
    }

    let session = Data("session".utf8)

    @Test func keychainIsTheSourceOfTruthWhenItWorks() throws {
        let keychain = FakeKeychain()
        let storage = ResilientAuthStorage(backing: keychain)
        try storage.store(key: "k", value: session)
        #expect(keychain.items["k"] == session)
        keychain.items["k"] = Data("newer".utf8)
        #expect(try storage.retrieve(key: "k") == Data("newer".utf8))
    }

    @Test func storeFailureKeepsTheSessionForThisLaunch() throws {
        let keychain = FakeKeychain()
        keychain.failStore = true
        let storage = ResilientAuthStorage(backing: keychain)
        try storage.store(key: "k", value: session)
        #expect(keychain.items["k"] == nil)
        #expect(try storage.retrieve(key: "k") == session)
    }

    @Test func retrieveFailureFallsBackToTheLastGoodValue() throws {
        let keychain = FakeKeychain()
        let storage = ResilientAuthStorage(backing: keychain)
        try storage.store(key: "k", value: session)
        keychain.failRetrieve = true
        #expect(try storage.retrieve(key: "k") == session)
    }

    @Test func aSuccessfulKeychainReadRefreshesTheMemoryCopy() throws {
        let keychain = FakeKeychain()
        keychain.items["k"] = session
        let storage = ResilientAuthStorage(backing: keychain)
        #expect(try storage.retrieve(key: "k") == session)
        keychain.failRetrieve = true
        #expect(try storage.retrieve(key: "k") == session)
    }

    @Test func removeClearsBothCopiesEvenWhenTheKeychainFails() throws {
        let keychain = FakeKeychain()
        let storage = ResilientAuthStorage(backing: keychain)
        try storage.store(key: "k", value: session)
        keychain.failRemove = true
        try storage.remove(key: "k")
        keychain.failRemove = false
        keychain.failRetrieve = true
        #expect(try storage.retrieve(key: "k") == nil)
    }

    @Test func missingKeyIsNilNotAStaleValue() throws {
        let keychain = FakeKeychain()
        let storage = ResilientAuthStorage(backing: keychain)
        #expect(try storage.retrieve(key: "absent") == nil)
    }
}
