//
//  MenuViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 24.01.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(MenuView(user: "Test", frame: view.frame))
    }
}
