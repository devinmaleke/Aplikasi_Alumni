//
//  ExperienceTVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 05/06/24.
//

import UIKit

protocol DidTapOptionButton {
    func didTappedOptionButton()
}

class ExperienceTVC: UITableViewCell {

    @IBOutlet weak var jobTitleLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var optionBtn: UIButton!
    
    var delegate: DidTapOptionButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLoad()
    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        delegate?.didTappedOptionButton()
    }
    
    func setup(data: String){
        jobTitleLbl.text = data
        companyLbl.text = data
        placeLbl.text = "Jakarta, Indonesia"
        yearLbl.text = "Agustus 2016 - September 2018"
    }

    private func initLoad(){
        jobTitleLbl.setFont(type: .medium, size: 14)
        companyLbl.setFont(type: .regular, size: 12)
        placeLbl.setFont(type: .regular, size: 12)
        yearLbl.setFont(type: .medium, size: 12)
    }
}
