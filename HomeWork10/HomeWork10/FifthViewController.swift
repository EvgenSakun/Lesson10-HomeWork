//
//  FifthViewController.swift
//  HomeWork10
//
//  Created by Evgeny Sakun on 26.12.23.
//

import UIKit

class FifthViewController: UIViewController {

    var data: String?
    var screenNumber: Int?
    let dataLabel = UILabel()
    let screenLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        setupScreenLabel()
        setupDataLabel()
    }
    
    func setupScreenLabel() {
        screenLabel.textColor = UIColor.systemYellow
        screenLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 100/2, y: 120, width: 100, height: 60)
        screenLabel.text = "Экран №\(screenNumber!)"
    }
    
    func setupDataLabel() {
        dataLabel.textColor = UIColor.systemYellow
        dataLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 170/2, y: 200, width: 170, height: 60)
        dataLabel.text = data
    }
    
    func addSubviews() {
        view.addSubview(dataLabel)
        view.addSubview(screenLabel)
    }

}
