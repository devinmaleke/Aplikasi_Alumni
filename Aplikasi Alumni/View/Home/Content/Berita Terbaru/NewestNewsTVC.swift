//
//  NewestNewsTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class NewestNewsTVC: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cvHeight: NSLayoutConstraint!
    
    var newestNewsData: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
        setCollectionView()
    }
    
    private func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        let nibCell = UINib(nibName: "NewestNewsCVC", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "NewestNewsCVC")
    }
    
    private func initLoad(){
        titleLabel.setFont(type: .semiBold, size: 16)
        seeAllButton.setAttributedTitle("Lebih Banyak", poppinsFont: .medium, size: 13, color: UIColor.init(hex: "#1B66FF"), for: .normal)
    }
    
    func setupCell(data: [String]){
        newestNewsData = data
        updateCollectionViewHeight()
        collectionView.reloadData()
    }
    
    private func updateCollectionViewHeight() {
        let itemHeight: CGFloat = 140
        let totalHeight = itemHeight * CGFloat(newestNewsData?.count ?? 0)
        cvHeight.constant = totalHeight

        layoutIfNeeded()
    }
}

extension NewestNewsTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newestNewsData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = newestNewsData else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewestNewsCVC", for: indexPath) as! NewestNewsCVC
        cell.setup(data: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = screenWidth
        return CGSize(width: width, height: 130) // Adjust the height as needed
    }
}


