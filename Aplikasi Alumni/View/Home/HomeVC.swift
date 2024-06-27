//
//  HomeVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit


class HomeVC: UIViewController {
    
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notifButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var bgTableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoad()
        setTableView()
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == profileButton{
            let vc = ProfileVC()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
            view.presentRightLeft()
        }else if sender == notifButton{
            
        }
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
        
        tableView.register(UINib(nibName: "MainContentTVC", bundle: nil), forCellReuseIdentifier: "MainContentTVC")
        tableView.register(UINib(nibName: "ClosestEventTVC", bundle: nil), forCellReuseIdentifier: "ClosestEventTVC")
        tableView.register(UINib(nibName: "NewestNewsTVC", bundle: nil), forCellReuseIdentifier: "NewestNewsTVC")
    }
    
    private func numberOfRow()->Int{
        return 3
    }
    
    private func usedCell(indexPath: IndexPath)->UITableViewCell{
        var cell = UITableViewCell()
        
        let cellMainContent = tableView.dequeueReusableCell(withIdentifier: "MainContentTVC") as! MainContentTVC
        let cellClosestEvent = tableView.dequeueReusableCell(withIdentifier: "ClosestEventTVC") as! ClosestEventTVC
        let cellNewestNews = tableView.dequeueReusableCell(withIdentifier: "NewestNewsTVC") as! NewestNewsTVC
        
        
        if indexPath.row == 0{
            cellMainContent.setupCell(data: ["Judul 1", "Judul 2", "Judul 3", "Judul 4", "Judul 5"])
            cell = cellMainContent
        }else if indexPath.row == 1{
            cellClosestEvent.setupCell(data: ["Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1", "Judul 2", "Judul 3", "Judul 4", "Judul 5"])
            cell = cellClosestEvent
        }else if indexPath.row == 2{
            cellNewestNews.setupCell(data: ["Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1 Judul 1", "Judul 2", "Judul 3", "Judul 4", "Judul 5"])
            cell = cellNewestNews
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return usedCell(indexPath: indexPath)
    }
}

