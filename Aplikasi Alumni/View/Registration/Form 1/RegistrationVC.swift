//
//  RegistrationVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit

class RegistrationVC: UIViewController {

    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var namaLbl: UILabel!
    @IBOutlet weak var namaTF: UITextField!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passLbl: UILabel!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var revealBtn: UIButton!
    
    @IBOutlet weak var confirmPassLbl: UILabel!
    @IBOutlet weak var confirmPassTF: UITextField!
    
    @IBOutlet weak var botView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoad()
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == backBtn{
            navigationController?.popViewController(animated: true)
        }else if sender == revealBtn{
            revealAction()
        }else{
            let vc = Registration2VC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func initLoad(){
        titleLabel.setFont(type: .semiBold, size: 16)
        namaLbl.setFont(type: .medium, size: 13)
        namaTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        emailLbl.setFont(type: .medium, size: 13)
        emailTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        passLbl.setFont(type: .medium, size: 13)
        passTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        confirmPassLbl.setFont(type: .medium, size: 13)
        confirmPassTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        continueBtn.setAttributedTitle("Lanjutkan", poppinsFont: .medium, size: 13, color: .white, for: .normal)
        botView.shadowUIView(offset: .zero, opacity: 0.15, radius: 2)
    }
    
    private func revealAction() {
        let isSecure = passTF.isSecureTextEntry
        let image = isSecure ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
        
        passTF.isSecureTextEntry.toggle()
        revealBtn.setImage(image, for: .normal)
    }


}
