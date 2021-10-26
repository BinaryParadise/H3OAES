//
//  File.swift
//  
//
//  Created by Rake Yang on 2021/10/25.
//

import Foundation

public enum H3O {
}

var SBox:[[UInt8]] = [
            [0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76],
            [0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0],
            [0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15],
            [0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75],
            [0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84],
            [0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF],
            [0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8],
            [0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2],
            [0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73],
            [0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB],
            [0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79],
            [0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08],
            [0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A],
            [0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E],
            [0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF],
            [0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16],]

var InverseSBox: [[UInt8]] = [
            [0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB],
            [0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB],
            [0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E],
            [0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25],
            [0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92],
            [0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84],
            [0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06],
            [0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B],
            [0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73],
            [0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E],
            [0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B],
            [0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4],
            [0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F],
            [0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF],
            [0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61],
            [0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D],]

extension H3O {
    enum Cipher: Int {
        case aes128 = 16
        case aes192 = 24
        case aes256 = 32
    }
    
    class AES_GCM {
        var Nk: Int = 4
        var Nr: Int = 10
        let Nb: Int = 4
        private var w: [UInt8]
        private var R: [UInt8] = [0x02, 0x00, 0x00, 0x00]
        var cipher: Cipher {
            willSet {
                switch newValue {
                case .aes128:
                    Nk = 4; Nr = 10
                case .aes192:
                    Nk = 6; Nr = 12
                case .aes256:
                    Nk = 8; Nr = 14
                }
            }
        }
        
        init(_ secretKey: [UInt8]) {
            guard let c = Cipher(rawValue: secretKey.count) else {
                fatalError("secret key length must be one of [16,24,32]")
            }
            cipher = c
            w = [UInt8](repeating: 0, count: Nb*(Nr+1)*4)
            keyExpansion(key: secretKey)
        }
        
        /*
         * Key Expansion
         */
        func keyExpansion(key: [UInt8]) {

            var tmp = [UInt8](repeating: 0, count: 4)

            for i in 0..<Nk {
                w[4*i+0] = key[4*i+0];
                w[4*i+1] = key[4*i+1];
                w[4*i+2] = key[4*i+2];
                w[4*i+3] = key[4*i+3];
            }

            for i in Nk..<Nb*(Nr+1) {
                tmp[0] = w[4*(i-1)+0];
                tmp[1] = w[4*(i-1)+1];
                tmp[2] = w[4*(i-1)+2];
                tmp[3] = w[4*(i-1)+3];

                if i % Nk == 0 {
                    rotateWord(&tmp)
                    subWord(&tmp)
                    var r = UInt8(i/Nk)
                    coefAdd(tmp, Rcon(&r), &tmp);

                } else if (Nk > 6 && i%Nk == 4) {
                    subWord(&tmp)
                }

                w[4*i+0] = w[4*(i-Nk)+0]^tmp[0];
                w[4*i+1] = w[4*(i-Nk)+1]^tmp[1];
                w[4*i+2] = w[4*(i-Nk)+2]^tmp[2];
                w[4*i+3] = w[4*(i-Nk)+3]^tmp[3];
            }
        }
        
        func rotateWord(_ input: inout [UInt8]) {
            let first = input.first!
            for i in 0..<input.count-1 {
                input[i] = input[i+1]
            }
            input[input.count-1] = first
        }
        
        func subWord(_ input: inout [UInt8]) {
            for i in 0..<4 {
                let byte = w[i]
                w[i] = SBox[Int((byte & 0xF0) >> 4)][Int(byte & 0x0F)]
            }
        }
        
        func coefAdd(_ a: [UInt8], _ b: [UInt8], _ d: inout [UInt8]) {
            d[0] = a[0] ^ b[0]
            d[1] = a[1] ^ b[1]
            d[2] = a[2] ^ b[2]
            d[3] = a[3] ^ b[3]
        }
        
        func Rcon(_ i: inout UInt8) -> [UInt8] {
            if i == 1 {
                R[0] = 0x01; // x^(1-1) = x^0 = 1
            } else if (i > 1) {
                R[0] = 0x02;
                i -= 1
                while (i > 1) {
                    R[0] = GMULT_AES[256*Int(R[0]) + 0x02]
                    i -= 1
                }
            }
            
            return R
        }
    
        func encrypt(input: inout [UInt8], out: inout [UInt8]) {
            var w = [UInt8](repeating: 0, count: Nb*(Nr+1)*4)
            var state = [UInt8](repeating: 0, count: 4 * Nb)

            for i in 0..<4 {
                for j in 0..<Nb {
                    state[Nb*i+j] = input[i+4*j]
                }
            }

            addRoundKey(&state, &w, 0)

            for r in 1..<Nr {
                subBytes(&state)
                shiftRows(&state)
                mixColumns(&state)
                addRoundKey(&state, &w, UInt8(r))
            }

            subBytes(&state)
            shiftRows(&state)
            addRoundKey(&state, &w, UInt8(Nr));

            for i in 0..<4 {
                for j in 0..<Nb {
                    out[i+4*j] = state[Nb*i+j]
                }
            }
        }
        
        func addRoundKey(_ state: inout [UInt8], _ w: inout [UInt8], _ r: UInt8) {
            for c in 0..<Nb {
                let idx = 4 * Nb * Int(r) + 4 * c //表达式太复杂导致编译阻塞
                state[Nb*0+c] = state[Nb * 0 + c] ^ w[idx + 0]   //debug, so it works for Nb !=4
                state[Nb*1+c] = state[Nb * 1 + c] ^ w[idx + 1]
                state[Nb*2+c] = state[Nb * 2 + c] ^ w[idx + 2]
                state[Nb*3+c] = state[Nb * 3 + c] ^ w[idx + 3]
            }
        }
    
        /// 字节替换
        /// - Parameters:
        ///   - byte: 输入
        ///   - inverse: 是否逆向
        /// - Returns: 输出
        func subBytes(_ state: inout [UInt8], _ inverse: Bool = false) {
            let box = inverse ? InverseSBox : SBox
            for i in 0..<4 {
                for j in 0..<Nb {
                    // s_box row: yyyy ----
                    // s_box col: ---- xxxx
                    // s_box[16*(yyyy) + xxxx] == s_box[yyyyxxxx]
                    let byte = state[Nb*i+j]
                    state[Nb*i+j] = box[Int((byte & 0xF0) >> 4)][Int(byte & 0x0F)]
                }
            }
        }
        
        
        /// 行位移
        /// - Parameter bytes: 输出
        /// - Returns: 输出
        func shiftRows(_ state: inout [UInt8]) {
            for i in 1..<4 {
                // shift(1,4)=1; shift(2,4)=2; shift(3,4)=3
                // shift(r, 4) = r;
                var s = 0;
                while (s < i) {
                    let tmp = state[Nb*i+0];
                    
                    for k in 1..<Nb {
                        state[Nb*i+k-1] = state[Nb*i+k]
                    }

                    state[Nb*i+Nb-1] = tmp;
                    s += 1
                }
            }
        }
        
        /// 列混淆
        /// - Parameter bytes: 输入
        /// - Returns: 输出
        func mixColumns(_ state: inout [UInt8]) {
            var a = [UInt8](repeating: 0, count: 4)
            var b = [UInt8](repeating: 0, count: 4)
            var h: UInt8
            /* The array 'a' is simply a copy of the input array 'r'
             * The array 'b' is each element of the array 'a' multiplied by 2
             * in Rijndael's Galois field
             * a[n] ^ b[n] is element n multiplied by 3 in Rijndael's Galois field */
            for c in 0..<4 {
                a[c] = state[c];
                /* h is 0xff if the high bit of r[c] is set, 0 otherwise */
                h = (state[c] >> 7) & 1; /* arithmetic right shift, thus shifting in either zeros or ones */
                b[c] = state[c] << 1; /* implicitly removes high bit because b[c] is an 8-bit char, so we xor by 0x1b and not 0x11b in the next line */
                b[c] ^= h * 0x1B; /* Rijndael's Galois field */
            }
            state[0] = b[0] ^ a[3] ^ a[2] ^ b[1] ^ a[1]; /* 2 * a0 + a3 + a2 + 3 * a1 */
            state[1] = b[1] ^ a[0] ^ a[3] ^ b[2] ^ a[2]; /* 2 * a1 + a0 + a3 + 3 * a2 */
            state[2] = b[2] ^ a[1] ^ a[0] ^ b[3] ^ a[3]; /* 2 * a2 + a1 + a0 + 3 * a3 */
            state[3] = b[3] ^ a[2] ^ a[1] ^ b[0] ^ a[0]; /* 2 * a3 + a2 + a1 + 3 * a0 */
        }
    }
}
