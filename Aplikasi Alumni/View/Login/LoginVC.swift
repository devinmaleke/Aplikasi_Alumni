//
//  LoginVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 02/06/24.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var revealBtn: UIButton!
    
    @IBOutlet weak var lupaPasswordBtn: UIButton!
    @IBOutlet weak var masukBtn: UIButton!
    
    
    @IBOutlet weak var belumPunyaAkunLabel: UILabel!
    @IBOutlet weak var daftarBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoad()
    }

    private func initLoad(){
        titleLabel.setFont(type: .semiBold, size: 16)
        subTitleLabel.setFont(type: .regular, size: 14)
        emailLabel.setFont(type: .medium, size: 13)
        emailTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        passwordLabel.setFont(type: .medium, size: 13)
        passwordTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        lupaPasswordBtn.titleLabel?.font = UIFont.poppinsFont(type: .semiBold, size: 12)
        masukBtn.setAttributedTitle("Masuk", poppinsFont: .medium, size: 13, color: .white, for: .normal)
//        masukBtn.titleLabel?.font = UIFont.poppinsFont(type: .medium, size: 13)
        
        belumPunyaAkunLabel.setFont(type: .regular, size: 12)
        daftarBtn.titleLabel?.font = UIFont.poppinsFont(type: .semiBold, size: 12)
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == revealBtn{
            revealAction()
        } else if sender == lupaPasswordBtn{
            print("Lupa pass")
        } else if sender == masukBtn{
            self.navigationController?.pushViewController(TabBarMenu(), animated: true)
        }else{
            let vc = RegistrationVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    private func revealAction() {
        let isSecure = passwordTF.isSecureTextEntry
        let image = isSecure ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
        
        passwordTF.isSecureTextEntry.toggle()
        revealBtn.setImage(image, for: .normal)
    }

}
