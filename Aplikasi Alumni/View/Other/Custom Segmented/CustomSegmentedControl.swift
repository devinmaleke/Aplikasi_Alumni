//
//  CustomSegmentedControl.swift
//  Aplikasi Alumni
//
//  Created by Devin Maleke on 03/07/24.
//

import UIKit

protocol CustomSegmentedControlDelegate:AnyObject {
    func changeToIdx(index:Int)
}

class CustomSegmentedControl: UIView{
    
    private var _selectedIndex:Int = 0
    public var selectedIndex: Int {
        return _selectedIndex
    }
    
    weak var delegate:CustomSegmentedControlDelegate?
    
    private var buttonTittles:[String]!
    private var buttons:[UIButton]!
    private var selectorView:UIView!
    
    var textColor:UIColor = UIColor.init(hex: "#8E8E8E")
    var selectorViewColor:UIColor = UIColor.init(hex: "#1B66FF")
    var selectorTextColor:UIColor = UIColor.init(hex: "#1B66FF")
    
    private func configStackView(){
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func configSelectorView(){
        let selectorWidth = frame.width/CGFloat(self.buttonTittles.count)
        selectorView = UIView(frame: CGRect(x: 8, y: self.frame.height, width: selectorWidth - 16, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton(){
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTittle in buttonTittles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTittle, for: .normal)
            button.addTarget(self, action: #selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton){
        for(buttonIndex, btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTittles.count) * CGFloat(buttonIndex)
                delegate?.changeToIdx(index: buttonIndex)
                UIView.animate(withDuration: 0.3){
                    self.selectorView.frame.origin.x = selectorPosition + 8
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    func setIndex(index:Int){
        buttons.forEach({$0.setTitleColor(textColor, for: .normal)})
        let button = buttons[index]
        _selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTittles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2){
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    private func updateView(){
        createButton()
        configSelectorView()
        configStackView()
    }
    
    convenience init(frame:CGRect,
                     buttonTittle:[String]) {
        self.init(frame:frame)
        self.buttonTittles = buttonTittle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setButtonTittles(buttonTittles:[String]){
        self.buttonTittles = buttonTittles
        updateView()
    }
    
}
