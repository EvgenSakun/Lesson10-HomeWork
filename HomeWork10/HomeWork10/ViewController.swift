//
//  ViewController.swift
//  HomeWork10
//
//  Created by Evgeny Sakun on 26.12.23.
//

import UIKit

class ViewController: UIViewController {

    let data = "Данные"
    let screenNumber = 1
    let dataButton = UIButton(type: .system)
    let screenLabel = UILabel()
    var customInstance = work()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        
        setupButton()
        setupScreenLabel()
    }
    
    func setupButton() {
        dataButton.setTitle("Передать данные на 2 экран", for: .normal)
        dataButton.setTitleColor(.black, for: .normal)
        dataButton.backgroundColor = UIColor.systemYellow
        dataButton.layer.cornerRadius = 20
        dataButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        dataButton.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 270/2, y: 200, width: 270, height: 60)
    }
    
    func setupScreenLabel() {
        screenLabel.textColor = UIColor.systemYellow
        screenLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 100/2, y: Int(dataButton.frame.minY) - 80, width: 100, height: 60)
        screenLabel.text = "Экран №\(screenNumber)"
    }
    
    func addSubviews() {
        self.view.addSubview(dataButton)
        self.view.addSubview(screenLabel)
    }
    
    func setPropertiesOfCustomInstance() {
        customInstance.stringProperty = "Hello"
        customInstance.intProperty = 523
        customInstance.doubleProperty = 432.234
    }
    
    @objc func sendData() {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.data = self.data
        secondViewController.screenNumber = self.screenNumber + 1
        
        setPropertiesOfCustomInstance()
        secondViewController.customInstance = self.customInstance
        
        present(secondViewController, animated: true)
    }

}


