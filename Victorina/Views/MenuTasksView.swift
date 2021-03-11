//
//  MenuTasksView.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class MenuTaskView: UIView {
    var tasksTable = UITableView()
    var controller: MenuTaskViewController?
    
    convenience init(_ controller: MenuTaskViewController, frame: CGRect) {
        self.init(frame: frame)
        self.controller = controller
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = ConfigColors.backgroundMenuColor
        tasksTable.backgroundColor = ConfigColors.backgroundMenuTableColor
        tasksTable.frame = CGRect(x: 0, y: safeAreaInsets.top, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - safeAreaInsets.bottom)
        tasksTable.delegate = controller
        tasksTable.dataSource = controller
        
        addSubview(tasksTable)
    }
}
