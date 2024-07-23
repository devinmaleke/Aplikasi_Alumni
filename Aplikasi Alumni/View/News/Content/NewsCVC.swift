//
//  NewsCVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 23/07/24.
//

import UIKit

class NewsCVC: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       layer.cornerRadius = 15
        titleLabel.setFont(type: .medium, size: 12)
    }
    
    func setup(title: String){
        titleLabel.text = title
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected{
            selected()
        } else{
            notSeleceted()
        }
    }
    
    func selected(){
        backgroundColor = UIColor.init(hex: "1B66FF")
        titleLabel.textColor = UIColor.init(hex: "FFFFFF")
    }
    
    func notSeleceted(){
      backgroundColor = UIColor.init(hex: "F7F7F7")
        titleLabel.textColor = UIColor.init(hex: "282828")
    }

}
