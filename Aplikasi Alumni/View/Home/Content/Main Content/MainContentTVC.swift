//
//  MainContentTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class MainContentTVC: UITableViewCell {

    @IBOutlet weak var mainContentCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var mainContentData: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
    }
    
    private func setCollectionView(){
        mainContentCV.dataSource = self
        mainContentCV.delegate = self
        
        let nibCell = UINib(nibName: "MainContentCVC", bundle: nil)
        mainContentCV.register(nibCell, forCellWithReuseIdentifier: "MainContentCVC")
    }
    
    func setupCell(data: [String]){
        mainContentData = data
        pageControl.currentPage = 1
        pageControl.numberOfPages = mainContentData?.count ?? 0
        mainContentCV.reloadData()
    }

}

extension MainContentTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainContentData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = mainContentData else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainContentCVC", for: indexPath) as! MainContentCVC
        cell.setup(data: data[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: mainContentCV.contentOffset, size: mainContentCV.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = mainContentCV.indexPathForItem(at: visiblePoint) {
            pageControl.currentPage = visibleIndexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
