//
//  ProfileSelectionCVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class ProfileSelectionCVC: UICollectionViewCell {

    @IBOutlet weak var profileSelection: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileSelection.setFont(type: .semiBold, size: 12)
        indicatorView.isHidden = true
        
    }
    
    func setup(title: String){
        profileSelection.text = title
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected{
            selected()
        } else{
            notSeleceted()
        }
    }
    
    private func selected(){
        profileSelection.textColor = UIColor.init(hex: "#1B66FF")
        indicatorView.isHidden = false
    }
    
    private func notSeleceted(){
        profileSelection.textColor = UIColor.init(hex: " #8E8E8E")
        indicatorView.isHidden = true
    }

}
