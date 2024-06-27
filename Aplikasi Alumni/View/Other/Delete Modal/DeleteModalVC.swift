//
//  DeleteModalVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 05/06/24.
//

import UIKit

class DeleteModalVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dismissView: UIView!
    
    var modalTitle: String?
    var modalDesc: String?
    var modalDelLabel: String?
    var modalCancelLabel: String?
    
    init(title: String, desc: String, deleteLabel: String, cancelLabel: String) {
        self.modalTitle = title
        self.modalDesc = desc
        self.modalDelLabel = deleteLabel
        self.modalCancelLabel = cancelLabel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        dismissView.backgroundColor = .black.withAlphaComponent(0.4)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissBgView))
        dismissView.addGestureRecognizer(tapGesture)
        
        titleLbl.setFont(type: .semiBold, size: 16)
        descLbl.setFont(type: .regular, size: 13)
        
        titleLbl.text = modalTitle
        descLbl.text = modalDesc
        
        deleteBtn.setAttributedTitle(modalDelLabel ?? "", poppinsFont: .semiBold, size: 12, color: UIColor.init(hex: "#CF4646"), for: .normal)
        cancelBtn.setAttributedTitle(modalCancelLabel ?? "", poppinsFont: .semiBold, size: 12, color: UIColor.init(hex: "#525252"), for: .normal)
        
        
    }
    
    
    @IBAction func didTapBtn(_ sender: UIButton) {
        if sender == deleteBtn{
            
        }else if sender == cancelBtn{
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Apply corner radius
        bgView.backgroundColor = .white
        bgView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 8)
        bgView.clipsToBounds = true
    }
    
    @objc func dismissBgView() {
        dismiss(animated: true)
    }

}
