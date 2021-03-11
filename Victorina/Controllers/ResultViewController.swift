//
//  ResultViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 01.02.2021.
//

import UIKit

class ResultViewController: UIViewController {
    var score = 0
    
    convenience init(score: Int) {
        self.init()
        self.score = score
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultView = ResultView(score: score, frame: view.frame)
        view.addSubview(resultView)
        resultView.backToTasks.addTarget(self, action: #selector(backToTasks), for: .touchUpInside)
    }
    
    @objc func backToTasks() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
