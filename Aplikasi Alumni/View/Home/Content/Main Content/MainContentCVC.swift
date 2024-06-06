//
//  MainContentCVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 04/06/24.
//

import UIKit

class MainContentCVC: UICollectionViewCell {

    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var bgCategory: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
        addGradientToImage()
    }
    
    private func initLoad(){
        bgCategory.layer.cornerRadius = 4
        categoryLbl.setFont(type: .regular, size: 12)
        titleLbl.setFont(type: .medium, size: 14)
        self.layer.cornerRadius = 14
    }
    
    private func addGradientToImage() {
        let gradient = CAGradientLayer()
        gradient.frame = contentImage.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.4, 1.0]  // Adjust these locations to control the gradient position
        
        // Ensure the gradient layer is resized correctly if the image view's bounds change
        gradient.frame = contentImage.bounds
        contentImage.layer.insertSublayer(gradient, at: 0)
    }
    
    func setup(data: String){
        contentImage.image = UIImage(named: "Profile Picture")
        categoryLbl.text = "Acara"
        titleLbl.text = data
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Ensure the gradient layer matches the bounds of the image view
        contentImage.layer.sublayers?.forEach { layer in
            if layer is CAGradientLayer {
                layer.frame = contentImage.bounds
            }
        }
    }

}
