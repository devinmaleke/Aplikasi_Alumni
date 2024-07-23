//
//  MyEventEditTVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 03/07/24.
//

import UIKit

class MyEventEditTVC: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    
    @IBOutlet weak var editIconImage: UIImageView!
    
    var verification = true

    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    private func initLoad(){
        eventImage.layer.cornerRadius = 8
        timeLabel.setFont(type: .regular, size: 12)
        titleLabel.setFont(type: .medium, size: 14)
        placeLbl.setFont(type: .medium, size: 12)
        editIconImage.image = UIImage(named: "Radio Button")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.verification = true
    }
    
    func setup(with data: String) {
        if verification == false{
            editIconImage.image = UIImage(named: "Radio Button Checked")
            eventImage.image = UIImage(named: "Profile Picture")
            timeLabel.text = "24 Ferbruary 2024"
            titleLabel.text = data
            placeLbl.text = "Jakarta"
        }else{
            editIconImage.image = UIImage(named: "Radio Button")
            eventImage.image = UIImage(named: "Profile Picture")
            timeLabel.text = "24 Ferbruary 2024"
            titleLabel.text = data
            placeLbl.text = "Jakarta"
        }
    }
    
    
    
    
}

