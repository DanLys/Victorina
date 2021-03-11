//
//  MenuView.swift
//  Victorina
//
//  Created by Danil Lyskin on 24.01.2021.
//

import UIKit

struct Parametr {
    var name: String
}

class MenuView: UIView {
    public var userName: UILabel = UILabel()
    public var score: UILabel = UILabel()
    public var tableOfMuneParametrs: UITableView = UITableView()
    
    var parametrs: [Parametr] = [Parametr(name: "Settings"), Parametr(name: "Friends"), Parametr(name: "Your quizzes")]
    
    convenience init(user userName: String = "", score: String = "0", frame: CGRect) {
        self.init(frame: frame)
        self.userName.text = userName
        self.score.text = score
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let screenWidth = self.frame.width
        
        backgroundColor = ConfigColors.backgroundMenuColor
        
        userName.frame = CGRect(x: 20, y: safeAreaInsets.top, width: screenWidth - 16, height: 30)
        userName.textColor = ConfigColors.tableTextColor
        userName.sizeToFit()
        
        score.frame = CGRect(x: 20, y: userName.frame.maxY + 8, width: screenWidth - 16, height: 30)
        score.textColor = ConfigColors.tableTextColor
        score.sizeToFit()
        
        tableOfMuneParametrs.backgroundColor = ConfigColors.backgroundMenuTableColor
        tableOfMuneParametrs.delegate = self
        tableOfMuneParametrs.dataSource = self
        tableOfMuneParametrs.rowHeight = 40
        tableOfMuneParametrs.frame = CGRect(x: 0, y: score.frame.maxY, width: screenWidth, height: CGFloat(parametrs.count) * tableOfMuneParametrs.rowHeight)
        
        addSubview(userName)
        addSubview(score)
        addSubview(tableOfMuneParametrs)
    }
}

extension MenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        parametrs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = parametrs[indexPath.row].name
        cell.textLabel?.textColor = ConfigColors.tableTextColor
        cell.backgroundColor = ConfigColors.backgroundMenuTableColor
        
        return cell
    }
}
