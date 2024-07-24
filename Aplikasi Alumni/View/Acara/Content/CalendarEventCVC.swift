//
//  CalendarEventCVC.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 24/07/24.
//

import UIKit

class CalendarEventCVC: UICollectionViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventPlace: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    private func initLoad(){
        eventImage.layer.cornerRadius = 8
        eventImage.image = UIImage(named: "Profile Picture")
        
        eventPlace.setFont(type: .regular, size: 12)
        eventTitle.setFont(type: .medium, size: 14)
    }
    
    func setup(data: String){
        eventTitle.text = data
        eventImage.image = UIImage(named: "Profile Picture")
        eventPlace.text = "Jakarta"
    }

}
