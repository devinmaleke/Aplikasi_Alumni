//
//  ProfileVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var angkatanLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var editButton: UIButton!
    
    
    let profileSelection = ["Feeds", "Pengalaman"]
    
    let dataImages = ["Profile Picture", "Beranda1", "Beranda0"]
    
    let dataCaption = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. ", "Caption2", "Caption3", "Caption4", "Caption5"]
    
    let dataExperience = ["Lorem ipsum dolor sit amet", "Caption2", "Caption3", "Caption4", "Caption5"]
    
    lazy var selectionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        initLoad()
        
        setCollectionView()
        setTableView()
    }
    
    private func initLoad(){
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.image = UIImage(named: "Profile Picture")
        
        titleLbl.setFont(type: .semiBold, size: 16)
        nameLbl.setFont(type: .semiBold, size: 14)
        angkatanLbl.setFont(type: .regular, size: 13)
        descLbl.setFont(type: .regular, size: 13)
        editButton.isHidden = true
        
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == backButton{
            dismiss(animated: false)
            view.dismissLeftRight()
        }else if sender == settingButton{
            let vc = SettingVC()
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        }else if sender == editButton{
            
        }
    }
    
    private func setCollectionView(){
        let nibCell = UINib(nibName: "ProfileSelectionCVC", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "ProfileSelectionCVC")
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "FeedsTVC", bundle: nil), forCellReuseIdentifier: "FeedsTVC")
        tableView.register(UINib(nibName: "ExperienceTVC", bundle: nil), forCellReuseIdentifier: "ExperienceTVC")
    }
    
    private func scrollToTop() {
        let topRow = IndexPath(row: 0,
                               section: 0)
        self.tableView.scrollToRow(at: topRow,
                                   at: .top,
                                   animated: false)
    }
    
    
}


extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileSelection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileSelectionCVC", for: indexPath) as! ProfileSelectionCVC
        
        cell.setup(title: profileSelection[indexPath.row])
        cell.setSelected(indexPath.row == selectionIndex)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionIndex = indexPath.row
        collectionView.reloadData()
        if selectionIndex == 1{
            editButton.isHidden = false
        }else{
            editButton.isHidden = true
        }
        tableView.reloadData()
        scrollToTop()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = screenWidth
        return CGSize(width: width/2, height: 40) // Adjust the height as needed
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let cellFeeds = tableView.dequeueReusableCell(withIdentifier: "FeedsTVC") as! FeedsTVC
        let cellExperience = tableView.dequeueReusableCell(withIdentifier: "ExperienceTVC") as! ExperienceTVC
        
        if selectionIndex == 0{
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
            cellExperience.setup(data: dataExperience[indexPath.row])
            cellExperience.delegate = self
            cell = cellExperience
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension ProfileVC : DidTapOptionButton{
    func didTappedOptionButton() {
        let vc = OptionListVC()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}

extension ProfileVC : DidTapOptionModalBtn{
    func didTappedDeleteButton() {
        dismiss(animated: false)
        let vc = DeleteModalVC(title: "Hapus Pengalaman", desc: "Apakah Anda yakin ingin menghapus pengalaman ini?", deleteLabel: "Hapus", cancelLabel: "Batalkan")
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    func didTappedChangeExpButton() {
        print("Change Exp")
    }
}

extension ProfileVC: DidTapSettingButton{
    func didTappedEditProfileBtn() {
        dismiss(animated: false)
        let vc = ChangeProfileVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: false)
        view.presentRightLeft()
    }
    
    func didTappedMyNewsBtn() {
        dismiss(animated: false)
        let vc = MyNewsVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: false)
        view.presentRightLeft()
    }
    
    func didTappedMyEventBtn() {
        dismiss(animated: false)
        let vc = MyEventVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: false)
        view.presentRightLeft()
    }
    
    func didTappedLogOut() {
        
    }
    
    
}
