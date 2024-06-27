//
//  NewestNewsCVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class NewestNewsCVC: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsCategory: UILabel!
    @IBOutlet weak var totalAlumni: UILabel!
    @IBOutlet weak var bgCategory: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    private func initLoad(){
        newsImage.layer.cornerRadius = 8
        bgCategory.layer.cornerRadius = 4
        
        newsTime.setFont(type: .regular, size: 12)
        newsTitle.setFont(type: .medium, size: 14)
        newsCategory.setFont(type: .regular, size: 12)
        totalAlumni.setFont(type: .regular, size: 12)
    }
    
    func setup(data: String){
        newsImage.image = UIImage(named: "Profile Picture")
        newsTime.text = "10 jam yang lalu"
        newsTitle.text = data
        newsCategory.text = "Ekonomi"
        totalAlumni.text = "2 alumni"
    }

}
