//
//  TaskViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class TaskViewController: UIViewController {
    var tasks: TasksDTO = TasksDTO()
    var taskIndex: Int = 0
    var taskView: TaskView = TaskView()
    var score: Int = 0
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard tasks.isInclude(by: taskIndex) else {
            let resultViewController = ResultViewController(score: score)
            resultViewController.modalPresentationStyle = .fullScreen
            present(resultViewController, animated: true, completion: nil)
            return
        }
        
        taskView = TaskView(taskDTO: tasks.getTask(byIndex: taskIndex), frame: view.frame)
        taskView.nextButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        view.addSubview(taskView)
    }
    
    @objc func nextButton() {
        var result = ""
        var correctResult = ""
        for index in 0..<taskView.answerOptions.numberOfRows(inSection: 0) {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = taskView.answerOptions.cellForRow(at: indexPath)
            if cell?.accessoryType == UITableViewCell.AccessoryType.checkmark {
                result += cell?.textLabel?.text ?? ""
            }
            correctResult += (tasks.getTask(byIndex: taskIndex).answers[index].1 ? tasks.getTask(byIndex: taskIndex).answers[index].0 : "")
        }
        if correctResult == result {
            score += 1
        }
        taskIndex += 1
        view.setNeedsLayout()
    }
}
