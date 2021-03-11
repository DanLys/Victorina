//
//  ResultView.swift
//  Victorina
//
//  Created by Danil Lyskin on 01.02.2021.
//

import UIKit

class ResultView: UIView {
    var score = 0
    var scoreLabel = UILabel()
    var backToTasks = UIButton()
    
    convenience init(score: Int, frame: CGRect) {
        self.init(frame: frame)
        self.score = score
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = ConfigColors.backgroundResultViewColor
        
        let centerX = UIScreen.main.bounds.midX
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        scoreLabel.text = "Your score: \(score)"
        scoreLabel.textColor = ConfigColors.textResultColor
        scoreLabel.font = UIFont(name: "System Font Regular", size: 54)
        scoreLabel.sizeToFit()
        scoreLabel.frame = CGRect(origin: CGPoint(x: centerX - scoreLabel.frame.width / 2, y: screenHeight / 4 + safeAreaInsets.top), size: scoreLabel.frame.size)
        
        backToTasks.setTitle("Back to tasks", for: .normal)
        backToTasks.backgroundColor = ConfigColors.backgroundButtonColor
        backToTasks.setTitleColor(ConfigColors.buttonTextColor, for: .normal)
        backToTasks.frame = CGRect(x: centerX - screenWidth / 6, y: screenHeight - safeAreaInsets.bottom - 50, width: screenWidth / 3, height: 30)
        backToTasks.layer.cornerRadius = 15
        backToTasks.clipsToBounds = true
        
        addSubview(scoreLabel)
        addSubview(backToTasks)
    }
}
