import XCTest
import class Foundation.Bundle
import CryptoKit
@testable import H3OAES

final class H3OAESTests: XCTestCase {
    
    func testExample() throws {
        let i = 0x1D2C3A4F
        //((i << 8) & 0xFFFFFFFF) ^ (i >> 24)
        XCTAssertEqual(i << 8 & 0xFFFFFFFF ^ i >> 24, 0x2C3A4F1D)
    }
    
    func testEncryption() throws {
        let key: [UInt8] = "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F".uint8Array
        var input: [UInt8] = "00112233445566778899AABBCCDDEEFF".uint8Array
        
        var output: [UInt8] = [UInt8](repeating: 0, count: input.count)
        let aes = H3O.AES_GCM(key)
        aes.encrypt(input: &input, out: &output)
        XCTAssertEqual(output.count, 16)
        XCTAssertEqual(output.toHexString(), "8EA2B7CA516745BFEAFC49904B496089")
    }
    
    func testCryptoKit() throws {
        let key: [UInt8] = "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F".uint8Array
        let input: [UInt8] = "00112233445566778899AABBCCDDEEFF".uint8Array
        let sealedBox = try CryptoKit.AES.GCM.seal(input, using: .init(data: key), nonce: .init(data: Data("000000000000000000000000".uint8Array)))
        let decrypted = try CryptoKit.AES.GCM.open(.init(nonce: sealedBox.nonce, ciphertext: sealedBox.ciphertext, tag: sealedBox.tag), using: .init(data: key))
        XCTAssertEqual(decrypted.bytes, input)
        //XCTAssertEqual(aes.ciphertext.bytes.toHexString(), "8EA2B7CA516745BFEAFC49904B496089")
    }
}
