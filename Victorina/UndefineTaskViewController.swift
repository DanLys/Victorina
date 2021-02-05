//
//  UndefineTaskViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class UndefineTaskViewController: UIViewController {
    @IBOutlet weak var backToTasks: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backToTasks.backgroundColor = ConfigColors.backgroundButtonColor
        backToTasks.setTitleColor(ConfigColors.buttonTextColor, for: .normal)
        backToTasks.layer.cornerRadius = 15
        backToTasks.clipsToBounds = true
    }
    
    @IBAction func backToTasks(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
