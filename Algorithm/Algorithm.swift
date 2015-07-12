//
//  Algorithm.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

/**
ユークリッドの互除法
*/
public func euclidGCD(x: Int, y: Int) -> Int {
    return y == 0 ? x : euclidGCD(y, x % y)
}

/**
エラトステネスの篩
*/
public func prime(max: Int) -> [Int] {
    var ns = (2...max).toArray()
    return reduce(2...Int(sqrt(Double(max))), ns) { (r: [Int], n: Int) -> [Int] in
        return r.reject {
            ($0 % n == 0) && $0 > n
        }
    }
}

/**
階上(末尾再帰)
*/
func factorial(n: Int, acc: Int = 1) -> Int {
    return n == 1 ? acc : factorial(n-1, acc: acc * n)
}