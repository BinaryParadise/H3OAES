import XCTest
import class Foundation.Bundle
import CryptoKit
@testable import H3OAES

final class H3OAESTests: XCTestCase {
    
    func testExample() throws {
        let x: [UInt8] = [1,2,3,4,5,6]
        XCTAssertEqual(x.batched(by: 7), [[1,2,3,4,5,6]])
        XCTAssertEqual(x.batched(by: 6), [[1,2,3,4,5,6]])
        XCTAssertEqual(x.batched(by: 5), [[1,2,3,4,5],[6]])
        XCTAssertEqual(x.batched(by: 4), [[1,2,3,4], [5,6]])
        XCTAssertEqual(x.batched(by: 3), [[1,2,3], [4,5,6]])
        XCTAssertEqual(x.batched(by: 1), [[1],[2],[3],[4],[5],[6]])
    }
    
    func testEncryption() throws {
        let key: [UInt8] = "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F".uint8Array
        let plaintext: [UInt8] = "AA00112233445566778899AABBCCDDEEFF".uint8Array
        
        let iv: [UInt8] = [1,1,1,1, 2,2,2,2, 3,3,3,3]
        let aes = H3O.AES_GCM(key, iv)
        let encrypted = aes.encrypt(plaintext: plaintext)
        XCTAssertEqual(encrypted.toHexString(), "1CD1C93494707CC06CF0D08947C120DF65")
        
        let decrypted = aes.decrypt(cipherText: encrypted)
        XCTAssertEqual(decrypted.toHexString(), plaintext.toHexString())        
    }
    
    func testCryptoKit() throws {
        let key: [UInt8] = "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F".uint8Array
        let input: [UInt8] = "AA00112233445566778899AABBCCDDEEFF".uint8Array
        //加密
        let sealedBox = try CryptoKit.AES.GCM.seal(input, using: .init(data: key), nonce: .init(data: Data([1,1,1,1, 2,2,2,2, 3,3,3,3])))
        XCTAssertEqual(sealedBox.ciphertext.bytes.toHexString(), "1CD1C93494707CC06CF0D08947C120DF65")

        //解密
        let decrypted = try CryptoKit.AES.GCM.open(.init(nonce: sealedBox.nonce, ciphertext: sealedBox.ciphertext, tag: sealedBox.tag), using: .init(data: key))
        XCTAssertEqual(decrypted.bytes, input)
    }
}
