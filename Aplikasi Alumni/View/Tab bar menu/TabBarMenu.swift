//
//  TabBarMenu.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 03/06/24.
//

import UIKit

class TabBarMenu: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.shadowUIView(offset: .zero, opacity: 0.15, radius: 2)
        initialUI()
    }
    
    private func initialUI() {
        let vc1 = HomeVC()
        let vc2 = HomeVC()
        let vc3 = HomeVC()
        let vc4 = HomeVC()
        let vc5 = HomeVC()
        
        vc1.title = "Beranda"
        vc2.title = "Sosial"
        vc3.title = ""
        vc4.title = "Berita"
        vc5.title = "Acara"
        
        tabBar.backgroundColor = .white
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        
        // Define font and color attributes
        let normalAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 11) ?? UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        let selectedAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 11) ?? UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor(hex: "#1B66FF")
        ]
        
        // Home
        if let homeTabBarItem = tabBar.items?[0] {
            homeTabBarItem.image = UIImage(named: "Beranda0")?.withRenderingMode(.alwaysOriginal)
            homeTabBarItem.selectedImage = UIImage(named: "Beranda1")?.withRenderingMode(.alwaysOriginal)
            homeTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            homeTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            homeTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        // Bill
        if let billTabBarItem = tabBar.items?[1] {
            billTabBarItem.image = UIImage(named: "Sosial0")?.withRenderingMode(.alwaysOriginal)
            billTabBarItem.selectedImage = UIImage(named: "Sosial1")?.withRenderingMode(.alwaysOriginal)
            billTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            billTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            billTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        // Inquiry
        if let inquiryTabBarItem = tabBar.items?[2] {
            inquiryTabBarItem.image = UIImage(named: "Plus TabBar")?.withRenderingMode(.alwaysOriginal)
            inquiryTabBarItem.selectedImage = UIImage(named: "Plus TabBar")?.withRenderingMode(.alwaysOriginal)
            inquiryTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        // Notification
        if let notificationTabBarItem = tabBar.items?[3] {
            notificationTabBarItem.image = UIImage(named: "Berita0")?.withRenderingMode(.alwaysOriginal)
            notificationTabBarItem.selectedImage = UIImage(named: "Berita1")?.withRenderingMode(.alwaysOriginal)
            notificationTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            notificationTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            notificationTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        // Profile
        if let profileTabBarItem = tabBar.items?[4] {
            profileTabBarItem.image = UIImage(named: "Acara0")?.withRenderingMode(.alwaysOriginal)
            profileTabBarItem.selectedImage = UIImage(named: "Acara1")?.withRenderingMode(.alwaysOriginal)
            profileTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            profileTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            profileTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .crossDissolve
    }
}

