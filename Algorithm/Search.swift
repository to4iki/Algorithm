//
//  Search.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

/**
線形探索
*/
public func linearSearch(nx: [Int], target: Int) -> Bool {
    for t in nx {
        if t == target {
            return true
        }
    }
    return false
}

/**
二分探索
*/
public func binarySearch(size: Int, target: Int) -> Bool {
    var nx = (1...size).toArray()
    var l = 0
    var r = nx.last!
    var m = 0
    
    while l <= r {
        m = (l + r) >> 1
        if nx[m] == target {
            return  true
        } else if nx[m] < target {
            l = m + 1
        } else {
            r = m - 1
        }
    }
    return false
}