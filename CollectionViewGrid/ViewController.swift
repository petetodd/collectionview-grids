//
//  ViewController.swift
//  CollectionViewGrid
//
//  Created by Peter Todd on 29/04/2019.
//  Copyright © 2019 Peter Todd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    // To produce a chess board use:
    // let intItems = 64
    // let intRows = 8
    
    let intItems = 64
    let intRows = 8

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView!.collectionViewLayout = createLayout()

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView!.collectionViewLayout = createLayout()
    }
    
    //MARK: - CollectionView
    //MARK:  CollectionView Datasoure

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return intItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        

        // cell.backgroundColor = UIColor.random
        // Now a chequered pattern for example a chess board
        let chessRow = Int(indexPath.item / 8)
        if indexPath.item % 2 == 0  {
            // if chessRow is even then start with white else dark
            if chessRow % 2 == 0  {
                cell.backgroundColor = UIColor.white
            }else {
                cell.backgroundColor = UIColor.darkGray
            }
        } else {
            if chessRow % 2 == 0  {
                cell.backgroundColor = UIColor.darkGray
            }else {
                cell.backgroundColor = UIColor.white
            }
        }
        return cell
    }
    
    //MARK:  CollectionView Delegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item \(indexPath.row) : \(indexPath.item)")
    }
    
    //MARK:  CollectionView format layout
    /*
     * Produce a grid of squares of the maximum size over the number of rows.
    */
    
    func createLayout()-> UICollectionViewLayout{
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        
        let maxHeight = collectionView.frame.height / CGFloat(intRows)
        let maxWidth = collectionView.frame.width / CGFloat(intItems/intRows)
        let squareSide = min(maxHeight, maxWidth)
        layout.itemSize = CGSize(width: CGFloat(squareSide), height: CGFloat(squareSide))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        // Calculate insets
        let totalWidth = squareSide * CGFloat(intItems/intRows)
        var widthInset = collectionView.frame.width - totalWidth
        if (widthInset > 0){
            widthInset = widthInset / 2
        }
        
        let totalHeigth = squareSide * CGFloat(intRows)
        var heightInset = collectionView.frame.height - totalHeigth
        if (heightInset > 0){
            heightInset = heightInset / 2
        }
        layout.sectionInset = UIEdgeInsets(top: heightInset, left: widthInset, bottom: heightInset, right: widthInset)
        return layout
        
    }
    
  


}

