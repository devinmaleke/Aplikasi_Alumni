//
//  CalendarVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit

class CalendarVC: UIViewController {


    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dismissView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var continueBtn: UIButton!

    @IBOutlet weak var titleLbl: UILabel!
    var completion: ((Date)->Void)?
    
    var minimumDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        dismissView.backgroundColor = .black.withAlphaComponent(0.4)
        bgView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
        bgView.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDismiss))
        dismissView.addGestureRecognizer(tapGesture)
        
        datePicker.minimumDate = minimumDate
        
        titleLbl.setFont(type: .semiBold, size: 14)
        continueBtn.setAttributedTitle("Pilih", poppinsFont: .medium, size: 13, color: .white, for: .normal)
    }
    
    @objc func viewDismiss() {
        dismiss(animated: true)
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        dismiss(animated: true){[weak self] in
            if sender.tag == 1 {
                self?.completion?(self?.datePicker.date ?? Date())
            }
        }
    }

}

