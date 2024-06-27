//
//  ClosestEventCVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class ClosestEventCVC: UICollectionViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    private func initLoad(){
        eventImage.layer.cornerRadius = 8
        cityLabel.setFont(type: .regular, size: 12)
        eventTitle.setFont(type: .medium, size: 14)
        dateLabel.setFont(type: .regular, size: 12)
    }
    
    func setup(data: String){
        eventImage.image = UIImage(named: "Profile Picture")
        cityLabel.text = "Acara"
        eventTitle.text = data
        dateLabel.text = "12 Oktober 2001"
    }

}
