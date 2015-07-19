//
//  Operator.swift
//  Algorithm
//
//  Created by to4iki on 7/20/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

infix operator ** {
    associativity left
    precedence 150
}

func ** (rhs: Int, lhs: Int) -> Int {
    if lhs <= 0 { return 1 }
    return Array(1..<lhs).reduce(rhs) { (x, y) -> Int in x * rhs }
}

