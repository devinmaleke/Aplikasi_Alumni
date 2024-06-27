//
//  FeedsCVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 05/06/24.
//

import UIKit

class FeedsCVC: UICollectionViewCell {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(data: String){
        contentImage.image = UIImage(named: data)
    }
    
}
