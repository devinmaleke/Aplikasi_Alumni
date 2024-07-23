//
//  NewsVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 23/07/24.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notifButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var bgTableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let newsSelection = ["Complaint", "Fitting Out", "In and Out", "Facility Booking"]
    let newsTitle = ["Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1", "Judul 2", "Judul 3", "Judul 4", "Judul 5","Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1", "Judul 2", "Judul 3", "Judul 4", "Judul 5"]
    lazy var newsIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoad()
        setTableView()
        setCollectionView()
    }
    
    private func initLoad(){
        profileButton.layer.cornerRadius = profileButton.frame.size.width / 2
        profileButton.clipsToBounds = true
        profileButton.setImage(UIImage(named: "Profile Picture"), for: .normal)
        
        searchBar.customizeSearchBar(
            backgroundColor: UIColor.white,
            textColor: UIColor.black,
            placeholderColor: UIColor.lightGray,
            font: UIFont(name: "Poppins-Regular", size: 14)!
        )
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "NewsTVC", bundle: nil), forCellReuseIdentifier: "NewsTVC")
    }
    
    private func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nibCell = UINib(nibName: "NewsCVC", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "NewsCVC")
    }
}

extension NewsVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsSelection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVC", for: indexPath) as! NewsCVC
        
        cell.setup(title: newsSelection[indexPath.row])
        cell.setSelected(indexPath.row == newsIndex)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        newsIndex = indexPath.row
        
        collectionView.reloadData()
//        getInquiryData(initial: true)

        tableView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    private func numberOfRow()->Int{
        return newsTitle.count
    }
    
    private func usedCell(indexPath: IndexPath)->UITableViewCell{
        var cell = UITableViewCell()
        
        let cellNews = tableView.dequeueReusableCell(withIdentifier: "NewsTVC") as! NewsTVC
        
        
        cellNews.setup(data: newsTitle[indexPath.row])
        cell = cellNews
        
        cell.selectionStyle = .none
        return cell
    }
}



extension NewsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return usedCell(indexPath: indexPath)
    }
}
