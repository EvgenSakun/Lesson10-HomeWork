//
//  ThirdViewController.swift
//  HomeWork10
//
//  Created by Evgeny Sakun on 26.12.23.
//

import UIKit

class ThirdViewController: UIViewController {

    var data: String?
    var screenNumber: Int?
    let dataButton = UIButton(type: .system)
    let screenLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        setupButton()
        setupScreenLabel()
    }
    
    func setupButton() {
        dataButton.setTitle("Передать данные на 4 экран", for: .normal)
        dataButton.setTitleColor(.black, for: .normal)
        dataButton.backgroundColor = UIColor.systemYellow
        dataButton.layer.cornerRadius = 20
        dataButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        dataButton.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 290/2, y: 200, width: 290, height: 60)
    }
    
    func setupScreenLabel() {
        screenLabel.textColor = UIColor.systemYellow
        screenLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 100/2, y: Int(dataButton.frame.minY) - 80, width: 100, height: 60)
        screenLabel.text = "Экран №\(screenNumber!)"
    }
    
    func addSubviews() {
        self.view.addSubview(dataButton)
        self.view.addSubview(screenLabel)
    }
    
    @objc func sendData() {
        let storyboard = UIStoryboard(name: "FourthViewController", bundle: nil)
        let fourthViewController = storyboard.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        fourthViewController.modalPresentationStyle = .fullScreen
        fourthViewController.data = self.data
        fourthViewController.screenNumber = self.screenNumber! + 1
        
        present(fourthViewController, animated: true)
    }

}

