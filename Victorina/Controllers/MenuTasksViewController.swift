//
//  MenuTasksViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class MenuTaskViewController: UIViewController {
    
    var task: TaskPreviewDTO!
    var resultCNT = 1
    static var flag = false
    
    override func loadView() {
        super.loadView()
        
        MenuTaskViewController.flag = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuTaskView = MenuTaskView(self, frame: view.frame)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(loadSwipeView(_ :)))
        swipe.numberOfTouchesRequired = 1
        swipe.direction = .right
        
        menuTaskView.addGestureRecognizer(swipe)
        menuTaskView.isUserInteractionEnabled = true
        
        view.addSubview(menuTaskView)
    }
    
    @objc func loadSwipeView(_ guester: UISwipeGestureRecognizer) {
        let swipeController = MenuViewController()
        swipeController.modalPresentationStyle = .overFullScreen
        present(swipeController, animated: true, completion: nil)
    }
}

extension MenuTaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !MenuTaskViewController.flag {
            TaskPreviewService.getCountTaskPreview { [weak self] result in
                self?.resultCNT = result
                if !MenuTaskViewController.flag {
                    tableView.reloadData()
                    MenuTaskViewController.flag = true
                }
            }
        }
        
        return resultCNT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        task = TaskPreviewService.getCurrentTaskPreview(with: indexPath.row)

        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = "Level: \(task.hardLevel)"
        cell.textLabel?.textColor = ConfigColors.tableTextColor
        cell.backgroundColor = ConfigColors.backgroundMenuTableColor
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard task.count > 0 else {
            let undefineTask = UndefineTaskViewController()
            undefineTask.modalPresentationStyle = .fullScreen
            present(undefineTask, animated: true, completion: nil)
            return
        }
        let taskViewController = TaskViewController()
        taskViewController.taskPreviewId = task.id
        taskViewController.modalPresentationStyle = .fullScreen
        present(taskViewController, animated: true, completion: nil)
    }
}
