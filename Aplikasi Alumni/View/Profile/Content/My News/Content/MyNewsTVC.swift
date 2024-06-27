//
//  MyNewsTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 06/06/24.
//

import UIKit

class MyNewsTVC: UITableViewCell {

    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var bgCategory: UIView!
    @IBOutlet weak var totalAlumniLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    func setup(data: String){
        newsImage.image = UIImage(named: "Profile Picture")
        timeLabel.text = "10 jam yang lalu"
        titleLabel.text = data
        categoryLbl.text = "Kesehatan"
        totalAlumniLabel.text = "10 alumni"
    }
    
    private func initLoad(){
        newsImage.layer.cornerRadius = 8
        timeLabel.setFont(type: .regular, size: 12)
        timeLabel.setFont(type: .medium, size: 14)
        categoryLbl.setFont(type: .regular, size: 12)
        totalAlumniLabel.setFont(type: .regular, size: 12)
        bgCategory.layer.cornerRadius = 4
        
    }
    
}
