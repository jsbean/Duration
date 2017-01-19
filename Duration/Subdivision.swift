//
//  Subdivision.swift
//  Duration
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation
import ArithmeticTools


public struct Subdivision: IntegerLiteralConvertible {
    
    public typealias IntegerLiteralType = Int
    
    // MARK: - Instance Properties
    
    /// Positive integer value analogous to the amount of beams in graphical representation.
    public var level: Int { return Int(log(Double(value))/log(2)) - 2 }
    
    /**
     - returns: `true` if `Subdivision` is a power-of-two. Otherwise `false`.
     */
    public var isValid: Bool { return value.isPowerOfTwo }
    
    internal let value: Int
    
    public init(integerLiteral value: Int) {
        self.value = value
    }
    
    /**
     Create a Subdivision with a level.
     
     - parameter level: Positive integer value analogous to the amount of beams in
     graphical representation.
     
     - returns: Initialized Subdivision structure
     */
    public init(level: Int) {
        self.value = Int(pow(2.0, (Double(level) + 2.0)))
    }
    
    /**
     Create a Subvisiion with a value.
     
     - parameter value: Power-of-two value of the subdivision (e.g., 4, 8, 16, 32, etc.)
     
     - returns: Initialized Subdivision structure, if possible. Returns `nil` if value
     is not greater than 0, or a power-of-two
     */
    public init?(value: Int) {
        guard value.isPowerOfTwo else { return nil }
        self.init(value)
    }
    
    public init(_ int: Int) {
        self.init(integerLiteral: int)
    }
    
    public init(_ float: Float) {
        self.value = Int(float)
    }
}

extension Subdivision: Comparable { }

public func == (lhs: Subdivision, rhs: Subdivision) -> Bool {
    return lhs.value == rhs.value
}

public func < (lhs: Subdivision, rhs: Subdivision) -> Bool {
    return lhs.value < rhs.value
}

extension Float {
    
    init(_ subdivision: Subdivision) {
        self.init(subdivision.value)
    }
}

/*
/**
 Subdivision of `MetricalDuration`.
 */
public typealias Subdivision = Int

public extension Subdivision {
    
    // MARK: - Instance Properties
    
    /// Positive integer value analogous to the amount of beams in graphical representation.
    public var level: Int { return Int(log(Double(self))/log(2)) - 2 }
    
    // MARK: - Initializers
    
    /**
    Create a Subvisiion with a value.
    
    - parameter value: Power-of-two value of the subdivision (e.g., 4, 8, 16, 32, etc.)
    
    - returns: Initialized Subdivision structure, if possible. Returns `nil` if value 
        is not greater than 0, or a power-of-two
    */
    public init?(value: Int) {
        guard value.isPowerOfTwo else { return nil }
        self = value
    }
    
    /**
     Create a Subdivision with a level.
     
     - parameter level: Positive integer value analogous to the amount of beams in 
     graphical representation.
     
     - returns: Initialized Subdivision structure
     */
    public init(level: Int) {
        self = Int(pow(2.0, (Double(level) + 2.0)))
    }
    
    /**
     - returns: `true` if `Subdivision` is a power-of-two. Otherwise `false`.
     */
    public var isValid: Bool { return self.isPowerOfTwo }
}
*/
