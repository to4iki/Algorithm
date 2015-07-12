//
//  Range.swift
//  Algorithm
//
//  Created by to4iki on 7/12/15.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

extension Range {
    func toArray() -> [T] {
        return reduce(self, []) { $0 + [$1] }
    }
}