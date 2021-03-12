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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        currentTask = TaskService.getCurrentTask(with: taskIndex, and: taskPreviewId)
        
        guard currentTask != nil else {
            let resultViewController = ResultViewController(score: score)
            resultViewController.modalPresentationStyle = .fullScreen
            present(resultViewController, animated: true, completion: nil)
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
            correctResult += (currentTask!.answers[index].1 ? currentTask!.answers[index].0 : "")
        }
        if correctResult == result {
            score += 1
        }
        taskIndex += 1
        view.setNeedsLayout()
    }
}
