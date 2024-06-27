//
//  Registration2VC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit

class Registration2VC: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var nomorTlpLbl: UILabel!
    @IBOutlet weak var nomorTlpTF: UITextField!
    
    @IBOutlet weak var ttlBtn: UIButton!
    @IBOutlet weak var ttlLbl: UILabel!
    
    
    @IBOutlet weak var jenisKelaminLbl: UILabel!
    @IBOutlet weak var jenisKelaminBtn: UIButton!
    
    @IBOutlet weak var angkatanLbl: UILabel!
    @IBOutlet weak var angkatanBtn: UIButton!
    
    @IBOutlet weak var alamatLbl: UILabel!
    
    @IBOutlet weak var alamatTextView: UITextView!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var botView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoad()
    }
    
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender == backBtn{
            navigationController?.popViewController(animated: true)
        }else if sender == ttlBtn{
            selectingDate()
        }else if sender == jenisKelaminBtn{
            selectGender()
        }else if sender == angkatanBtn{
            selectAngkatan()
        }else{
            let vc = OtpVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func initLoad(){
        titleLbl.setFont(type: .semiBold, size: 16)
        nomorTlpLbl.setFont(type: .medium, size: 13)
        nomorTlpTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        ttlLbl.setFont(type: .medium, size: 13)
        ttlBtn.setAttributedTitle("DD-MM-YY", poppinsFont: .medium, size: 13, color: UIColor.init(hex: "#8E8E8E"), for: .normal)
        ttlBtn.layer.borderWidth = 1
        ttlBtn.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        ttlBtn.layer.cornerRadius = 8
        
        jenisKelaminLbl.setFont(type: .medium, size: 13)
        jenisKelaminBtn.setAttributedTitle("Pilih jenis kelamin", poppinsFont: .medium, size: 13, color: UIColor.init(hex: "#8E8E8E"), for: .normal)
        jenisKelaminBtn.layer.borderWidth = 1
        jenisKelaminBtn.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        jenisKelaminBtn.layer.cornerRadius = 8
        
        angkatanLbl.setFont(type: .medium, size: 13)
        angkatanBtn.setAttributedTitle("Pilih angkatan", poppinsFont: .medium, size: 13, color: UIColor.init(hex: "#8E8E8E"), for: .normal)
        angkatanBtn.layer.borderWidth = 1
        angkatanBtn.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        angkatanBtn.layer.cornerRadius = 8
        
        alamatLbl.setFont(type: .medium, size: 13)
        alamatTextView.layer.borderWidth = 1
        alamatTextView.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        alamatTextView.layer.cornerRadius = 8
        alamatTextView.font = UIFont(name: "Poppins-Regular", size: 13)
        alamatTextView.textColor = UIColor.init(hex: "#8E8E8E")
        
        
        continueBtn.setAttributedTitle("Lanjutkan", poppinsFont: .medium, size: 13, color: UIColor.white, for: .normal)
        botView.shadowUIView(offset: .zero, opacity: 0.15, radius: 2)
        
        alamatTextView.delegate = self
    }
    
    private func selectingDate(){
        let vc = CalendarVC()
        vc.completion = {[weak self] selectingDate in
            self?.ttlBtn.setAttributedTitle(selectingDate.asEpochToString(format: "dd-MM-yyyy"), poppinsFont: .medium, size: 13, color: .black, for: .normal)
            self?.ttlBtn.setTitleColor(.blue, for: .normal)
        }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    private func selectGender(){
        let vc = ListVC(showSearchBar: false, title: "Jenis Kelamin")
        let list = ["Laki-laki", "Perempuan"]
        vc.list = list
        vc.completion = { [weak self] selectedIndex in
            self?.jenisKelaminBtn.setAttributedTitle("\(list[selectedIndex])", poppinsFont: .medium, size: 13, color: .black, for: .normal)
        }
        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    private func selectAngkatan(){
        let vc = ListVC(showSearchBar: true, title: "Pilih Angkatan")
        let list = ["angkatan 1"]
        vc.list = list
        vc.completion = { [weak self] selectedIndex in
            self?.angkatanBtn.setAttributedTitle("\(list[selectedIndex])", poppinsFont: .medium, size: 13, color: .black, for: .normal)
        }
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }

}

extension Registration2VC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Masukkan alamat"{
            textView.text = ""
            textView.textColor = .black
            textView.font = UIFont(name: "Poppins-Regular", size: 13)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isNilOrEmpty{
            textView.text = "Masukkan alamat"
            textView.font = UIFont(name: "Poppins-Regular", size: 13)
            textView.textColor = UIColor.init(hex: "#8E8E8E")
        }
    }
}
