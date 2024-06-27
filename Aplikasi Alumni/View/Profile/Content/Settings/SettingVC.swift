//
//  SettingVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 05/06/24.
//

import UIKit

protocol DidTapSettingButton{
    func didTappedEditProfileBtn()
    func didTappedMyNewsBtn()
    func didTappedMyEventBtn()
    func didTappedLogOut()
}

class SettingVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dismissView: UIView!
    
    
    @IBOutlet weak var editProfileBtn: UIButton!
    @IBOutlet weak var myNewsBtn: UIButton!
    @IBOutlet weak var myEventBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    var delegate: DidTapSettingButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        dismissView.backgroundColor = .black.withAlphaComponent(0.4)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissBgView))
        dismissView.addGestureRecognizer(tapGesture)
        
        titleLbl.setFont(type: .semiBold, size: 14)
        editProfileBtn.setAttributedTitle("Ubah profil", poppinsFont: .medium, size: 14, color: UIColor.init(hex: "#525252"), for: .normal)
        myNewsBtn.setAttributedTitle("Berita saya", poppinsFont: .medium, size: 14, color: UIColor.init(hex: "#525252"), for: .normal)
        myEventBtn.setAttributedTitle("Acara saya", poppinsFont: .medium, size: 14, color: UIColor.init(hex: "#525252"), for: .normal)
        logoutBtn.setAttributedTitle("Keluar", poppinsFont: .medium, size: 14, color: UIColor.init(hex: "#CF4646"), for: .normal)
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == editProfileBtn{
            delegate?.didTappedEditProfileBtn()
        }else if sender == myNewsBtn{
            delegate?.didTappedMyNewsBtn()
        }else if sender == myEventBtn{
            delegate?.didTappedMyEventBtn()
        }else if sender == logoutBtn{
            delegate?.didTappedLogOut()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Apply corner radius
        bgView.backgroundColor = .white
        bgView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
        bgView.clipsToBounds = true
    }
    
    @objc func dismissBgView() {
        dismiss(animated: true)
    }

}
