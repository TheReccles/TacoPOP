//
//  ReusableView.swift
//  TacoPOP
//
//  Created by Richard Eccles on 12/21/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit
//when you conform to this protocol, it takes the name of your class and puts it in the reuseIdentifer
protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
