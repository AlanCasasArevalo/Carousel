//
//  HomeViewController.swift
//  Carousel
//
//  Created by Alan Casas on 24/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discoverButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var interestArray = [InterestEntity]()

    let cellScale: CGFloat = 0.9
    
    override func viewDidLoad() {
        super.viewDidLoad()        

        interestArray = HomeFactory().getAllInterest()
        setupCollection()
    }
    
    func setupCollection () {
        setupRegister()
        setupCollectionDelegate()
        setupCollectionCellUI()
        setupPageControl()
    }
    
    func setupRegister () {
        cardCollectionView.register(UINib.init(nibName: NibName.homeCollectionCell, bundle: nil), forCellWithReuseIdentifier: NibName.homeCollectionCell)
    }
    
    func setupCollectionDelegate () {
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
    }
    
    func setupCollectionCellUI () {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (screenSize.width - cellWidth) / 2.0
        let insetY = (screenSize.height - cellHeight) / 2.0

        let layout = cardCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        cardCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
                
    }
    
    func setupPageControl () {
        pageControl.numberOfPages = interestArray.count
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
    }
    
    @IBAction func discoverButton(_ sender: Any) {
    }
    
    @IBAction func editProfileButton(_ sender: UIButton) {
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NibName.homeCollectionCell, for: indexPath) as! HomeCollectionCell

        let interestToShow = interestArray[indexPath.row]
        
        cell.interest = interestToShow
        
        cell.layer.cornerRadius = 30.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = cardCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee

        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing

        let roundedIndex = round(index)
        pageControl.currentPage = Int(roundedIndex)
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)

        targetContentOffset.pointee = offset
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let index = Int(scrollView.contentOffset.x / cardCollectionView.frame.size.width)
//        pageControl.currentPage = index
//    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pag = pageControl.currentPage
        cardCollectionView.scrollToItem(at: IndexPath(item: pag , section: 0), at: .centeredHorizontally, animated: true)
        cardCollectionView.layoutSubviews() // **Sin esta linea el efecto no será visible.**
    }
    
}
