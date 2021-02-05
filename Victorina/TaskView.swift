//
//  TaskView.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class TaskView: UIView {
    var taskDTO: AbstractTask?
    var name = UILabel()
    var descriptions = UILabel()
    var image: UIImageView?
    var video: UIVideoEditorController?
    var nextButton = UIButton()
    var answerOptions = UITableView()
    
    convenience init(taskDTO: AbstractTask, frame: CGRect) {
        self.init(frame: frame)
        self.taskDTO = taskDTO
        self.name.text = taskDTO.name
        self.descriptions.text = taskDTO.descriptions
        if let task = taskDTO as? TaskImageDTO {
            image = UIImageView(image: task.image)
        } else if let task = taskDTO as? TaskVideDTO {
            video = task.video
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundColor = ConfigColors.backgroundTaskColor
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let centerX = UIScreen.main.bounds.midX
        
        name.frame = CGRect(x: 20, y: safeAreaInsets.top, width: screenWidth - 40, height: 30)
        name.sizeToFit()
        
        if image != nil {
            image?.frame = CGRect(x: 20, y: name.frame.maxY + 16,
                                  width: screenWidth - 40, height: screenHeight / 4)
            image?.contentMode = UIView.ContentMode.scaleAspectFit
            addSubview(image!)
        }
        
//        if video != nil {
//            video?
//        }
        
        descriptions.frame = CGRect(x: 20, y: image != nil ? image!.frame.maxY + 16 : name.frame.maxY + 16, width: screenWidth - 40, height: screenHeight / 4)
        descriptions.numberOfLines = 7
        descriptions.sizeToFit()
        
        answerOptions.rowHeight = 40
        answerOptions.frame = CGRect(x: 0, y: descriptions.frame.maxY + 16, width: screenWidth, height: 4.5 * answerOptions.rowHeight)
        answerOptions.backgroundColor = ConfigColors.backgroundTaskAnswerTableColor
        answerOptions.delegate = self
        answerOptions.dataSource = self
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(ConfigColors.buttonTextColor, for: .normal)
        nextButton.backgroundColor = ConfigColors.backgroundButtonColor
        nextButton.frame = CGRect(x: centerX - screenWidth / 6, y: screenHeight - safeAreaInsets.bottom - 50, width: screenWidth / 3, height: 30)
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true
        
        addSubview(name)
        addSubview(descriptions)
        addSubview(answerOptions)
        addSubview(nextButton)
    }
}

extension TaskView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskDTO?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = taskDTO?.answers[indexPath.row].0
        cell.textLabel?.textColor = ConfigColors.tableTextColor
        cell.backgroundColor = ConfigColors.backgroundTaskAnswerTableColor
        cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !(taskDTO?.flagOfAnsweresType ?? false) {
            for index in 0..<tableView.numberOfRows(inSection: 0) {
                tableView.cellForRow(at: IndexPath(row: index, section: 0))?.accessoryType = .none
            }
        }
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
}
