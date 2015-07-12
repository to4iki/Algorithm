//
//  Sort.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

/**
バケットソート
*/
public func bucketSort(nx: [Int], max: Int) -> [Int] {
    func build(size: Int) -> [Int] {
        var result: [Int] = []
        for i in 0..<10 { result.append(0) }
        return result
    }
    
    var bucket = build(max)
    for n in nx {
        bucket[n] = n
    }
    
    return bucket.filter { $0 != 0 }
}

/**
バブルソート
*/
public func bubbleSort(nx: [Int]) -> [Int] {
    var dup: [Int] = nx
    let size = nx.count
    
    for i in 0..<size {
        for j in 1..<(size - i) {
            if dup[j-1] > dup[j] {
                // swap
                var swap = dup[j]
                dup[j] = dup[j-1];
                dup[j-1] = swap
            }
        }
    }
    return dup
}

/**
挿入ソート
*/
public func insertionSort(nx: [Int]) -> [Int] {
    var dup = nx
    var size = nx.count
    var index = 0 // 交換要素用のindex
    
    for i in 0..<size {
        var tmp = dup[i]
        index = i
        
        while i > 0 && dup[i-1] > dup[i] {
            swap(&dup[i-1], &dup[i])
            index--
        }
        if dup[index] != tmp {
            dup[index] = tmp
        }
    }
    return dup
}

/**
クイックソート
*/
func quickSort(nx: [Int]) -> [Int] {
    if let (pivot, rest) = nx.decompose {
        let (l, g) = rest.partition { $0 < pivot }
        return quickSort(l) + [pivot] + quickSort(g)
    } else {
        return []
    }
}

