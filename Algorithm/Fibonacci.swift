//
//  Fibonacci.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

private func memoize<T: Hashable, U>(block: (T -> U, T) -> U) -> T -> U {
    var cache: [T:U] = [:]
    var function: (T -> U)!
    function = { (p: T) -> U in
        if let val = cache[p] {
            return val
        } else {
            cache[p] = block(function, p)
            return cache[p]!
        }
    }
    
    return function!
}

/// フィボナッチ数列(メモ化)
public let fibMemo = memoize { (fib: Int -> Int, val: Int) -> Int in
    return val < 2 ? val : fib(val - 1) + fib(val - 2)
}

/**
フィボナッチ数列(末尾再帰)
*/
public func fib(n: Int, acc1: Int = 1, acc2: Int = 0) -> Int {
    if n == 0 { return 0 }
    return n == 1 ? acc1 : fib(n - 1, acc1: acc1 + acc2, acc2: acc1)
}