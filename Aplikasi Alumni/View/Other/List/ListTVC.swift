//
//  ListTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit

class ListTVC: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var radioBtnImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.setFont(type: .regular, size: 14)
    }
    
    func setup(data: String, isSelected: Bool){
        titleLbl.text = data
        radioBtnImage.image = isSelected ? UIImage(named: "Radio Button Checked") : UIImage(named: "Radio Button")
    }
    
}
