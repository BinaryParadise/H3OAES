//
//  File.swift
//  
//
//  Created by Rake Yang on 2021/10/29.
//

import Foundation

public extension Array where Element == UInt8 {
    func batched(by size: Int) -> [Self] {
        if size <= 0 {
            fatalError("The size must be greater than zero.")
        }
        
        if count <= size {
            return [self]
        }
        
        return stride(from: 0, to: count + count % size, by: size).map { i in
            if i+size < count {
                return Array(self[i..<i+size])
            } else {
                return Array(self[i...])
            }
        }
    }
}

extension Int {
    public var bytes: [UInt8] {
        return UInt(self).bytes
    }
}

extension UInt {
    public var bytes: [UInt8] {
        return [UInt8(truncatingIfNeeded: self >> 24),
                UInt8(truncatingIfNeeded: self >> 16),
                UInt8(truncatingIfNeeded: self >> 8),
                UInt8(truncatingIfNeeded: self)]
    }
}
