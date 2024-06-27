//
//  OptionListVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 05/06/24.
//

import UIKit

protocol DidTapOptionModalBtn{
    func didTappedDeleteButton()
    func didTappedChangeExpButton()
}

class OptionListVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dismissView: UIView!
    
    
    @IBOutlet weak var changeExpBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var delegate: DidTapOptionModalBtn?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        dismissView.backgroundColor = .black.withAlphaComponent(0.4)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissBgView))
        dismissView.addGestureRecognizer(tapGesture)
        
        changeExpBtn.setAttributedTitle("Ubah pengalaman", poppinsFont: .medium, size: 14, color: .black, for: .normal)
        deleteBtn.setAttributedTitle("Hapus", poppinsFont: .medium, size: 14, color:UIColor.init(hex: "#CF4646"), for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Apply corner radius
        bgView.backgroundColor = .white
        bgView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
        bgView.clipsToBounds = true
    }
    
    @IBAction func didTapBtn(_ sender: UIButton) {
        if sender == changeExpBtn{
            delegate?.didTappedChangeExpButton()
        }else{
            delegate?.didTappedDeleteButton()
        }
    }
    
    
    @objc func dismissBgView() {
        dismiss(animated: true)
    }
    
    

}
