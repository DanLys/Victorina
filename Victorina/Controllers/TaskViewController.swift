//
//  TaskViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class TaskViewController: UIViewController {
    var taskIndex: Int = 0
    var taskView: TaskView = TaskView()
    var score: Int = 0
    var taskPreviewId: Int!
    var currentTask: AbstractTask?
    static var flag = false
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if !TaskViewController.flag {
            TaskService.getCurrentTask(with: taskIndex, and: taskPreviewId) {
                [weak self] currentTask in
                    self?.currentTask = currentTask
                    if !TaskViewController.flag {
                        TaskViewController.flag = true
                        self?.view.setNeedsLayout()
                    }
            }
        }
        
        guard currentTask != nil else {
            let resultViewController = ResultViewController(score: score)
            resultViewController.modalPresentationStyle = .fullScreen
            if TaskViewController.flag {
                present(resultViewController, animated: true, completion: nil)
                TaskViewController.flag = false
            }
            return
        }
        
        taskView = TaskView(taskDTO: currentTask!, frame: view.frame)
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
            correctResult += (currentTask!.answers[index].isTrue ? currentTask!.answers[index].answer : "")
        }
        if correctResult == result {
            score += 1
        }
        taskIndex += 1
        TaskViewController.flag = false
        view.setNeedsLayout()
    }
}
