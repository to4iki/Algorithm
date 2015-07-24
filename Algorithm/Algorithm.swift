//
//  Algorithm.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

/**
FizzBuzz
*/
public func fizzbuzz(size: Int) -> [String] {
    func exec(n: Int) -> String {
        if n % 15 == 0 {
            return "FizzBuzz"
        } else if n % 5 == 0 {
            return "Buzz"
        } else if n % 3 == 0 {
            return "Fizz"
        } else {
            return String(n)
        }
    }
    
    return Array(1...size).map { exec($0) }
}

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

/**
ハノイの塔
*/
public func hanoi(n: Int) -> Int {
    return hanoi(n-1) + 1 + hanoi(n-1)
}

/**
ピタゴラスの定理
*/
public func pythagoreanTriples(n: Int) -> [[Int]] {
    return Array(1...n).flatMap { z in
        Array(1...z).flatMap { x in
            Array(x...z).filter({ y in x**2 + y**2 == z**2 }).map {
                [x, $0, z]
            }
        }
    }
}