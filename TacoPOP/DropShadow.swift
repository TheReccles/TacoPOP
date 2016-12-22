//
//  DropShadow.swift
//  TacoPOP
//
//  Created by Richard Eccles on 12/21/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

protocol DropShadow {}
//extensions will do all the work
//when dealing with protocols and extensions self has capital S
extension DropShadow where Self: UIView {
    func addDropShadow() {
        //implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
    
}
