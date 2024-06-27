//
//  OtpVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit


class OtpVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    
    @IBOutlet weak var otp1: UITextField!
    @IBOutlet weak var otp2: UITextField!
    @IBOutlet weak var otp3: UITextField!
    @IBOutlet weak var otp4: UITextField!
    
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    
    @IBOutlet weak var botView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoad()
        otp1.delegate = self
        otp2.delegate = self
        otp3.delegate = self
        otp4.delegate = self
        otp1.becomeFirstResponder()
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == backBtn{
            navigationController?.popViewController(animated: true)
        }else if sender == resendBtn{
            
        }else{
            
        }
    }
    
    private func initLoad(){
        titleLbl.setFont(type: .semiBold, size: 20)
        subTitleLbl.setFont(type: .regular, size: 14)
        phoneNumberLbl.setFont(type: .regular, size: 14)
        otp1.font = UIFont.poppinsFont(type: .semiBold, size: 16)
        otp2.font = UIFont.poppinsFont(type: .semiBold, size: 16)
        otp3.font = UIFont.poppinsFont(type: .semiBold, size: 16)
        otp4.font = UIFont.poppinsFont(type: .semiBold, size: 16)
        
        questionLbl.setFont(type: .regular, size: 12)
        resendBtn.setAttributedTitle("Kirim ulang", poppinsFont: .semiBold, size: 12, color: UIColor.init(hex: "#1B66FF"), for: .normal)
        
        continueBtn.setAttributedTitle("Konfirmasi", poppinsFont: .medium, size: 13, color: UIColor.white, for: .normal)
        botView.shadowUIView(offset: .zero, opacity: 0.15, radius: 2)
    }
    
}

extension OtpVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard range.length == 0 else {
            // Tombol delete ditekan
            handleBackspace(for: textField)
            return false
        }
        
        if let currentText = textField.text, currentText.count == 1 {
            // Karakter kedua dimasukkan
            let secondCharacter = string
            
            // Pindah ke textField berikutnya
            if let nextTextField = getNextTextField(after: textField) {
                nextTextField.isEnabled.toggle()
                nextTextField.becomeFirstResponder()
                textField.isEnabled.toggle()
                nextTextField.text = secondCharacter
            }
            return false
        }
        
        return true
    }
    
    private func handleBackspace(for textField: UITextField) {
        guard let previousTextField = getPreviousTextField(before: textField) else {
            textField.text = ""
            return
        }
        
        previousTextField.isEnabled.toggle()
        previousTextField.becomeFirstResponder()
        textField.isEnabled.toggle()
        textField.text = ""
    }
    
    private func getNextTextField(after textField: UITextField) -> UITextField? {
        switch textField {
        case otp1: return otp2
        case otp2: return otp3
        case otp3: return otp4
        case otp4: return nil
        default: return nil
        }
    }
    
    private func getPreviousTextField(before textField: UITextField) -> UITextField? {
        switch textField {
        case otp2: return otp1
        case otp3: return otp2
        case otp4: return otp3
        default: return nil
        }
    }
}
