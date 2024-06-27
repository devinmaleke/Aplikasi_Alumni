//
//  FeedsTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class FeedsTVC: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var angkatanLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    
    @IBOutlet weak var imageCV: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageCVHeight: NSLayoutConstraint!
    @IBOutlet weak var imageCVTop: NSLayoutConstraint!
    
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentLbl: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likeLbl: UILabel!
    
    @IBOutlet weak var seperatorView: UIView!
    var imageContentData: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
        setCollectionView()
        seperatorView.isHidden = true
    }
    
    private func setCollectionView(){
        imageCV.dataSource = self
        imageCV.delegate = self
        
        let nibCell = UINib(nibName: "FeedsCVC", bundle: nil)
        imageCV.register(nibCell, forCellWithReuseIdentifier: "FeedsCVC")
    }
    
    func setup(data: String){
        captionLbl.text = data
        nameLbl.text = "John Doe"
        dateLbl.text = "12 Oktober"
        angkatanLbl.text = "Angkatan 1"
    }
    
    
    func setupCell(data: [String]){
        imageContentData = data
        pageControl.currentPage = 1
        pageControl.numberOfPages = imageContentData?.count ?? 0
        imageCV.reloadData()
    }
    
    func setImage(_ hasImage: Bool) {
        if !hasImage{
            imageCV.isHidden = true
            imageCVHeight.constant = 0
            imageCVTop.constant = 0
            pageControl.isHidden = true
            seperatorView.isHidden = false
        }
    }

    
    private func initLoad(){
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width / 2
        profilePicture.clipsToBounds = true
        profilePicture.image = UIImage(named: "Profile Picture")
        
        nameLbl.setFont(type: .medium, size: 14)
        dateLbl.setFont(type: .regular, size: 12)
        angkatanLbl.setFont(type: .regular, size: 12)
        captionLbl.setFont(type: .regular, size: 13)
        
        commentLbl.setFont(type: .regular, size: 12)
        likeLbl.setFont(type: .regular, size: 12)
    }
}

extension FeedsTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageContentData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = imageContentData else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedsCVC", for: indexPath) as! FeedsCVC
        cell.setup(data: data[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: imageCV.contentOffset, size: imageCV.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = imageCV.indexPathForItem(at: visiblePoint) {
            pageControl.currentPage = visibleIndexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = screenWidth
        return CGSize(width: width, height: 249) // Adjust the height as needed
    }
}
