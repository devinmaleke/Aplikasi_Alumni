//
//  ListVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit

class ListVC: UIViewController {
    
    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchBarHeight: NSLayoutConstraint!
    var completion: ((Int)->Void)?
    var list = [String]()
    var choosen: Int?
    var showSearchbar: Bool?
    var titleList: String?

    init(showSearchBar: Bool, title: String) {
        self.showSearchbar = showSearchBar
        self.titleList = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
        bgView.backgroundColor = .white
        
        view.backgroundColor = .clear
        backgroundView.backgroundColor = .black.withAlphaComponent(0.4)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        backgroundView.addGestureRecognizer(tapGesture)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ListTVC", bundle: nil),
                           forCellReuseIdentifier: "ListTVC")
        tableView.separatorStyle = .none
        
        continueBtn.isEnabled = false
        let screenHeight = UIScreen.main.bounds.height
        let maximumTableHeight = screenHeight * 0.5
        let calculatedTableHeight = CGFloat(list.count * 50)
        tableViewHeight.constant = min(calculatedTableHeight, maximumTableHeight)
        
        if !(showSearchbar ?? false){
            searchBar.isHidden = true
            searchBarHeight.constant = 0
        }
        
        searchBar.customizeSearchBar(
            backgroundColor: UIColor.white,
            textColor: UIColor.black,
            placeholderColor: UIColor.lightGray,
            font: UIFont(name: "Poppins-Regular", size: 14)!
        )
        
        titleLbl.text = titleList
        titleLbl.setFont(type: .semiBold, size: 14)
        continueBtn.setAttributedTitle("Pilih", poppinsFont: .medium, size: 13, color: UIColor.white, for: .normal)
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        dismiss(animated: true){[weak self] in
            self?.completion?(self?.choosen ?? 0)
        }
    }
    
    
}

extension ListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ListTVC") as! ListTVC
        cell.selectionStyle = .none
        
        cell.setup(data: list[indexPath.row], isSelected: indexPath.row == choosen)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosen = indexPath.row
        continueBtn.isEnabled = true
        tableView.reloadData()
    }
}
