//
//  MutableCollection+Ext.swift
//  TacoPOP
//
//  Created by Richard Eccles on 12/21/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import Foundation

//here we are randomizing our array of objects
extension MutableCollection where Index == Int {
    mutating func shuffle() {
        if count < 2 {return}
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
