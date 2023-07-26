//
//  ControlViewController.swift
//  hoonflix
//
//  Created by 백래훈 on 2023/07/20.
//

import UIKit

class ControlViewController: UIViewController {

    @IBOutlet var newButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var config = UIButton.Configuration.filled() //apple system button
        config.title = "SeSAC 영등포캠퍼스"
        config.subtitle = "로그인 없이 둘러보기"
        config.image = UIImage(systemName: "star")
        
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .yellow
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.titleAlignment = .trailing
        
        config.cornerStyle = .dynamic
        newButton.configuration = config
        
    }

    @IBAction func keyboradDismiss(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    
    
}
