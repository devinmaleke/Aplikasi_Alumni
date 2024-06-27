//
//  ClosestEventTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class ClosestEventTVC: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var closestEventData: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
        setCollectionView()
    }
    
    private func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nibCell = UINib(nibName: "ClosestEventCVC", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "ClosestEventCVC")
    }
    
    
    private func initLoad(){
        titleLbl.setFont(type: .semiBold, size: 16)
        seeAllButton.setAttributedTitle("Lebih Banyak", poppinsFont: .medium, size: 13, color: UIColor.init(hex: "#1B66FF"), for: .normal)
    }
    
    func setupCell(data: [String]){
        closestEventData = data
        collectionView.reloadData()
    }
}

extension ClosestEventTVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return closestEventData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = closestEventData else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClosestEventCVC", for: indexPath) as! ClosestEventCVC
        cell.setup(data: data[indexPath.row])
        return cell
    }
}
