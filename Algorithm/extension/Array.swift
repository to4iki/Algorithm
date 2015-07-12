//
//  Array.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

extension Array {
    var decompose : (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
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
}