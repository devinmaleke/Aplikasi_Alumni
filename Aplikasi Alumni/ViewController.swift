//
//  ViewController.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 02/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginVC = LoginVC()
        navigationController?.pushViewController(loginVC, animated: true)
    }


}

