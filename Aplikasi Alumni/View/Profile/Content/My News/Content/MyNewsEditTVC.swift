//
//  MyNewsEditTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 06/06/24.
//

import UIKit

class MyNewsEditTVC: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var bgCategory: UIView!
    @IBOutlet weak var editIconImage: UIImageView!
    
    var verification = true

    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    private func initLoad(){
        newsImage.layer.cornerRadius = 8
        timeLabel.setFont(type: .regular, size: 12)
        titleLabel.setFont(type: .medium, size: 14)
        categoryLbl.setFont(type: .regular, size: 12)
//        totalAlumniLabel.setFont(type: .regular, size: 12)
        bgCategory.layer.cornerRadius = 4
        editIconImage.image = UIImage(named: "Radio Button")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.verification = true
    }
    
    func setup(with data: String) {
        if verification == false{
            editIconImage.image = UIImage(named: "Radio Button Checked")
            newsImage.image = UIImage(named: "Profile Picture")
            timeLabel.text = "10 jam yang lalu"
            titleLabel.text = data
            categoryLbl.text = "Kesehatan"
        }else{
            editIconImage.image = UIImage(named: "Radio Button")
            newsImage.image = UIImage(named: "Profile Picture")
            timeLabel.text = "10 jam yang lalu"
            titleLabel.text = data
            categoryLbl.text = "Kesehatan"
        }
    }
    
    
    
    
}
