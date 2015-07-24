//
//  Array.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

extension Array {
    var decompose: (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
    
    var decomposeToLast: (inits: [T], last: T)? {
        if let last = last {
            return (Array(self[0..<count-1]), last)
        } else {
            return nil
        }
    }
    
    func flatten() -> [T] {
        return reduce([]) { (r: [T], x: T) -> [T] in
            if let xs = x as? [T] {
                return r + xs.flatten()
            } else {
                return r + [x]
            }
        }
    }
    
    func reject(excludeElement: (T) -> Bool) -> [T] {
        return filter { !excludeElement($0) }
    }
    
    func partition(@noescape predicate: (T) -> Bool) -> (include: [T], exclude: [T]) {
        return self.reduce(([], [])) {
            if predicate($1) {
                return ($0.0 + [$1], $0.1)
            } else {
                return ($0.0, $0.1 + [$1])
            }
        }
    }
    
    func product(xss: [T]...) -> [[T]] {
        return self.flatMap { x in
            if let (inits, last) = xss.decomposeToLast {
                return inits.flatMap { ys in
                    ys.flatMap { y in
                        last.map { z in
                            [x,y,z]
                        }
                    }
                }
            } else {
                return []
            }
        }
    }
}