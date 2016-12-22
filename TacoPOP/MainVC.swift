//
//  MainVC.swift
//  TacoPOP
//
//  Created by Richard Eccles on 12/21/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit

class MainVC: UIViewController, DataServiceDelegate {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //now can get to any of the data in this file
    var ds: DataService = DataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ds.delegate = self
        ds.loadDeliciousTacoData()
        ds.tacoArray.shuffle()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        headerView.addDropShadow()
        
        //the following commented code was the old way before protocols to get the nib to load
        //let nib = UINib(nibName: "TacoCell", bundle: nil)
        //collectionView.register(nib, forCellWithReuseIdentifier: "TacoCell")
        
        //new way with protocols
        collectionView.register(TacoCell.self)
    }
    
    func deliciousTacoDataLoaded() {
        print("Delicious Taco Data Loaded!")
        collectionView.reloadData()
    }

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ds.tacoArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //comentted code below is the old way to do it before using protocols
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell {
//            cell.configureCell(taco: ds.tacoArray[indexPath.row])
//            return cell
//        }
//        else{
//            return UICollectionViewCell()
//        }
        
        let cell = collectionView.dequeReusableCell(forIndexPath: indexPath) as TacoCell
        cell.configureCell(taco: ds.tacoArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            cell.shake()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 95)
    }
    
    
}
