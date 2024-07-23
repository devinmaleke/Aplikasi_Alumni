//
//  SosialVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 03/07/24.
//

import UIKit

class SosialVC: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notifButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var bgTableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectionMenuView: UIView!
    
    private lazy var tag = 0
    
    let dataImages = ["Profile Picture", "Beranda1", "Beranda0"]
    
    let dataCaption = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. ", "Caption2", "Caption3", "Caption4", "Caption5"]
    let dataGroup = ["Lorem ipsum dolor sit amet", "Caption2", "Caption3", "Caption4", "Caption5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLoad()
        setTableView()
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
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: selectionMenuView.frame.height)
        let segmented = CustomSegmentedControl(frame: frame, buttonTittle: ["Feeds", "Grup"])
        segmented.backgroundColor = .clear
        segmented.delegate = self
        selectionMenuView.addSubview(segmented)
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "FeedsTVC", bundle: nil), forCellReuseIdentifier: "FeedsTVC")
        tableView.register(UINib(nibName: "GroupTVC", bundle: nil), forCellReuseIdentifier: "GroupTVC")
    }

}

extension SosialVC: CustomSegmentedControlDelegate{
    func changeToIdx(index: Int) {
        tag = index
        tableView.reloadData()
    }
}

extension SosialVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let cellFeeds = tableView.dequeueReusableCell(withIdentifier: "FeedsTVC") as! FeedsTVC
        let cellGroup = tableView.dequeueReusableCell(withIdentifier: "GroupTVC") as! GroupTVC
        
        if tag == 0{
            if dataImages.count == 0{
                cellFeeds.setImage(false)
                cellFeeds.setup(data: dataCaption[indexPath.row])
                cell = cellFeeds
            }
            else{
                cellFeeds.setupCell(data: dataImages)
                cellFeeds.setup(data: dataCaption[indexPath.row])
                cell = cellFeeds
            }
            
        }else{
            cellGroup.setup(data: dataGroup[indexPath.row])
            cell = cellGroup
        }
        
        cell.selectionStyle = .none
        return cell
    }
}
