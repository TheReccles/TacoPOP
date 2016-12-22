//
//  UICollectionView+Ext.swift
//  TacoPOP
//
//  Created by Richard Eccles on 12/21/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

//all collection views in the code will have this fucntionality
extension UICollectionView {
    //create a generic
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        //register nib with reuseidentifier that we definied in ReusableView protocol
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T:ReusableView {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else{
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionViewCell: ReusableView {}
