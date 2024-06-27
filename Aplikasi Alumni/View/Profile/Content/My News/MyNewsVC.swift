//
//  MyNewsVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 06/06/24.
//

import UIKit

class MyNewsVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var botView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    @IBOutlet weak var botViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var deleteBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var deleteBtnBot: NSLayoutConstraint!
    
    @IBOutlet weak var deleteBtnTop: NSLayoutConstraint!
    var verificationStatus: [Int: Bool] = [:]
    private lazy var count = 0
    
    let dataTitle = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed cursus metus. ", "Caption2", "Caption3", "Caption4", "Caption5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoad()
        setTableView()
    }
    
    private func initLoad(){
        titleLbl.setFont(type: .semiBold, size: 16)
        botView.shadowUIView(offset: .zero, opacity: 0.15, radius: 2)
        botView.isHidden = true
        deleteBtn.isHidden = true
        editBtn.isSelected = false
        botViewHeight.constant = 0
        deleteBtnHeight.constant = 0
        deleteBtnBot.constant = 0
        deleteBtnTop.constant = 0
    }
    
    
    @IBAction func didTapBtn(_ sender: UIButton) {
        if sender == backBtn{
            dismiss(animated: false)
            view.dismissLeftRight()
        }else if sender == deleteBtn{
            print("HAPUS")
            editBtn.isSelected = true
            setEditButton(sender: editBtn)
            tableView.reloadData()
        }else{
            setEditButton(sender: editBtn)
        }
    }
    
    
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "MyNewsTVC", bundle: nil), forCellReuseIdentifier: "MyNewsTVC")
        tableView.register(UINib(nibName: "MyNewsEditTVC", bundle: nil), forCellReuseIdentifier: "MyNewsEditTVC")
    }
    
    private func setEditButton(sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            verificationStatus = [:]
            count = 0
            
            editBtn.setImage(UIImage(named: "Edit Picture Icon"), for: .normal)
            tableView.reloadData()
            scrollToTop()
            botView.isHidden = false
            deleteBtn.isHidden = false
            deleteBtn.setAttributedTitle("Hapus (\(count))", poppinsFont: .medium, size: 13, color: .white, for: .normal)
            deleteBtn.isEnabled = false
            deleteBtn.backgroundColor = UIColor.init(hex: "#8E8E8E")
            botViewHeight.constant = 76
            deleteBtnHeight.constant = 44
            deleteBtnBot.constant = 16
            deleteBtnTop.constant = 16
        }
        
        else {
            editBtn.setImage(UIImage(named: "Edit List Icon"), for: .normal)
            tableView.reloadData()
            scrollToTop()
            botView.isHidden = true
            deleteBtn.isHidden = true
            botViewHeight.constant = 0
            deleteBtnHeight.constant = 0
            deleteBtnBot.constant = 0
            deleteBtnTop.constant = 0
        }
    }
    
    private func scrollToTop() {
        let topRow = IndexPath(row: 0,
                               section: 0)
        self.tableView.scrollToRow(at: topRow,
                                   at: .top,
                                   animated: false)
    }
}

extension MyNewsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let cellNews = tableView.dequeueReusableCell(withIdentifier: "MyNewsTVC") as! MyNewsTVC
        let cellEditNews = tableView.dequeueReusableCell(withIdentifier: "MyNewsEditTVC") as! MyNewsEditTVC
        
        if editBtn.isSelected{
            if let verification = verificationStatus[indexPath.row] {
                cellEditNews.verification = verification
            }
            cellEditNews.setup(with: dataTitle[indexPath.row])
            cell = cellEditNews
        }else{
            cellNews.setup(data: dataTitle[indexPath.row])
            cell = cellNews
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MyNewsEditTVC {
            if cell.verification == true{
                cell.verification = false
                verificationStatus[indexPath.row] = false
                tableView.reloadRows(at: [indexPath], with: .automatic)
                count+=1
                deleteBtn.setAttributedTitle("Hapus (\(count))", poppinsFont: .medium, size: 13, color: .white, for: .normal)
                deleteBtn.isEnabled = true
                deleteBtn.tintColor = UIColor.init(hex: "#CF4646")
            }else{
                cell.verification = true
                verificationStatus[indexPath.row] = true
                tableView.reloadRows(at: [indexPath], with: .automatic)
                count-=1
                if count>0{
                    deleteBtn.setAttributedTitle("Hapus (\(count))", poppinsFont: .medium, size: 13, color: .white, for: .normal)
                    deleteBtn.isEnabled = true
                    deleteBtn.tintColor = UIColor.init(hex: "#CF4646")
                }else{
                    deleteBtn.setAttributedTitle("Hapus (\(count))", poppinsFont: .medium, size: 13, color: .white, for: .normal)
                    deleteBtn.isEnabled = false
                    deleteBtn.backgroundColor = UIColor.init(hex: "#8E8E8E")
                }
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
