//
//  SecondViewController.swift
//  HomeWork10
//
//  Created by Evgeny Sakun on 26.12.23.
//

import UIKit

class SecondViewController: UIViewController {

    var data: String?
    var screenNumber: Int?
    let dataButton = UIButton(type: .system)
    let screenLabel = UILabel()
    var customInstance: work?
    let propertiesLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        setupButton()
        setupScreenLabel()
        setupPropertiesLabel()
    }
    
    func setupButton() {
        dataButton.setTitle("Передать данные на 3 экран", for: .normal)
        dataButton.setTitleColor(.black, for: .normal)
        dataButton.backgroundColor = UIColor.systemYellow
        dataButton.layer.cornerRadius = 20
        dataButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        dataButton.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 270/2, y: 200, width: 270, height: 60)
    }
    
    func setupPropertiesLabel() {
        propertiesLabel.textColor = UIColor.systemYellow
        propertiesLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 200/2, y: Int(dataButton.frame.maxY) + 20, width: 200, height: 120)
        propertiesLabel.numberOfLines = 4
        propertiesLabel.text = "CustomClass properties:\n • String - \(customInstance?.stringProperty ?? "No value")\n • Int - \(customInstance?.intProperty ?? 0)\n • Double - \(customInstance?.doubleProperty ?? 0.0)"
    }
    
    func setupScreenLabel() {
        screenLabel.textColor = UIColor.systemYellow
        screenLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 100/2, y: Int(dataButton.frame.minY) - 80, width: 100, height: 60)
        screenLabel.text = "Экран №\(screenNumber!)"
    }
    
    func addSubviews() {
        self.view.addSubview(dataButton)
        self.view.addSubview(screenLabel)
        self.view.addSubview(propertiesLabel)
    }
    
    @objc func sendData() {
        let storyboard = UIStoryboard(name: "ThirdViewController", bundle: nil)
        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        thirdViewController.modalPresentationStyle = .fullScreen
        thirdViewController.data = self.data
        thirdViewController.screenNumber = self.screenNumber! + 1
        
        present(thirdViewController, animated: true)
    }
    

}
