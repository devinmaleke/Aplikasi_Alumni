//
//  GroupTVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 03/07/24.
//

import UIKit

class GroupTVC: UITableViewCell {

    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var totalMember: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initLoad()
    }
    
    private func initLoad(){
        groupImage.layer.cornerRadius = groupImage.frame.size.width / 2
        groupImage.clipsToBounds = true
        groupImage.image = UIImage(named: "Profile Picture")
        
        groupTitle.setFont(type: .medium, size: 14)
        totalMember.setFont(type: .regular, size: 13)
    }
    
    func setup(data: String){
        groupTitle.text = data
        groupImage.image = UIImage(named: "Profile Picture")
        totalMember.text = "10 Anggota"
    }
    
    
}
