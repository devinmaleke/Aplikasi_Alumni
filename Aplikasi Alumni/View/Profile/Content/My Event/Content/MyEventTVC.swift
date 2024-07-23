//
//  MyEventTVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 03/07/24.
//

import UIKit

class MyEventTVC: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    func setup(data: String){
        eventImage.image = UIImage(named: "Profile Picture")
        timeLabel.text = "24 Ferbruary 204"
        titleLabel.text = data
        placeLbl.text = "Jakarta"
    }
    
    private func initLoad(){
        eventImage.layer.cornerRadius = 8
        timeLabel.setFont(type: .regular, size: 12)
        titleLabel.setFont(type: .medium, size: 14)
        placeLbl.setFont(type: .medium, size: 12)
    }
    
}
