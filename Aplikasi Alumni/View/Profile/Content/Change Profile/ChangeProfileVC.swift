//
//  ChangeProfileVC.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 05/06/24.
//

import UIKit

class ChangeProfileVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var namaLbl: UILabel!
    @IBOutlet weak var namaTF: UITextField!
    @IBOutlet weak var bgNamaView: UIView!
    
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var bioTF: UITextField!
    @IBOutlet weak var bgBioView: UIView!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var bgEmailView: UIView!
    
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var bgPasswordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLoad()
    }
    
    
    @IBAction func didTapBtn(_ sender: UIButton) {
        if sender == backBtn{
            dismiss(animated: false)
            view.dismissLeftRight()
        }else if sender == editButton{
            actionSheet()
        }
    }
    
    private func initLoad(){
        titleLbl.setFont(type: .semiBold, size: 16)
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width / 2
        profilePicture.clipsToBounds = true
        profilePicture.image = UIImage(named: "Profile Picture")
        
        namaLbl.setFont(type: .medium, size: 13)
        bioLbl.setFont(type: .medium, size: 13)
        emailLbl.setFont(type: .medium, size: 13)
        passwordLbl.setFont(type: .medium, size: 13)
        
        namaTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        bioTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        emailTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        passwordTF.font = UIFont.poppinsFont(type: .regular, size: 13)
        
        namaTF.text = "John Doe"
        bioTF.text = "Life is short, make it simple"
        emailTF.text = "johndoe@gmail.com"
        passwordTF.text = "Secretpassword"
            
        bgNamaView.layer.borderWidth = 1
        bgNamaView.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        bgNamaView.layer.cornerRadius = 14
        
        bgBioView.layer.borderWidth = 1
        bgBioView.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        bgBioView.layer.cornerRadius = 14
        
        bgEmailView.layer.borderWidth = 1
        bgEmailView.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        bgEmailView.layer.cornerRadius = 14
        
        bgPasswordView.layer.borderWidth = 1
        bgPasswordView.layer.borderColor = UIColor.init(hex: "#E8E8E8").cgColor
        bgPasswordView.layer.cornerRadius = 14
    }
    
    private func actionSheet(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (handler) in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (handler) in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view //to set the source of your alert
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
            popoverController.permittedArrowDirections = [] //to hide the arrow of any particular direction
        }
        self.present(alert,animated: true)
    }
    
    private func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self.present(picker, animated: true)
        }
        
    }
    private func openGalery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }

}

extension ChangeProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.profilePicture.image = editImg
        }
        
//        if profilePicture.image != nil {
//            stringImg = Functions.convertImageToUTF64(img: profilePicture.image!, quality: .low)
//        }
        
        dismiss(animated: true)
    }
}

