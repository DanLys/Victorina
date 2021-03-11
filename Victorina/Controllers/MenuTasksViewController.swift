//
//  MenuTasksViewController.swift
//  Victorina
//
//  Created by Danil Lyskin on 30.01.2021.
//

import UIKit

class MenuTaskViewController: UIViewController {
    let tasks: [TasksDTO] = [TasksDTO(name: "test", hardLevel: 1, tasks: [SimpleTask(name: "first", descriptions: "testtesttesttest", answers: [("True", true), ("False", false)], flagOfAnsweresType: false)]), TasksDTO(name: "test", hardLevel: 1, tasks: [SimpleTask(name: "first", descriptions: "testtesttlkadfakldjlakdjladjlakwjdlkadjlakjdlakdjlakjdlakwdjalkwdjalkjdlakjdalkjdlkajdlkajdlkajdladjlakdjlkadjlkadjlkajwdlwefhwekfnlakfnsejkfneksfjnskjfnskjefnslkfjnslefknsjefklnfklsejnfalwdkjmasjnfaowidsncslifkjnsdliafkjdfghjkhjeafkjsdbfnmdakjefaljfkdsnmflaiwehf;uafhiwufjklbsflashfiuanfjbdskjbwe;fihlhKLWJKFHLAIOWHFAWOFHWJKSBFLEBGSKHJDFIUSEHFKBJFSKEJEHLkesgksgkjdbvlaueirghaiefhewfuhefiluwbgfiwuefhwefeueoiejoeijfeighvnsdkjvneohfnsdkne;osvnkselncldsbvkjnse;ogidjkgnlsnlghsoihpe;akjvnaekfjnja;ilfbnkadnvlewf woe fojv naofejinejnca k;slfjncaiedsnjvklaes fnaivel ;nfioew ;jfn;ckesttest", answers: [("True", true), ("False", true)], flagOfAnsweresType: true)]), TasksDTO(name: "test", hardLevel: 1, tasks: [SimpleTask(name: "first", descriptions: "testtesttesttest", answers: [("True", false), ("False", false)], flagOfAnsweresType: false)])]
    
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
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let task = tasks[indexPath.row]

        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = "Level: " + String(tasks[indexPath.row].hardLevel)
        cell.textLabel?.textColor = ConfigColors.tableTextColor
        cell.backgroundColor = ConfigColors.backgroundMenuTableColor
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tasks[indexPath.row].tasks.count > 0 else {
            let undefineTask = UndefineTaskViewController()
            undefineTask.modalPresentationStyle = .fullScreen
            present(undefineTask, animated: true, completion: nil)
            return
        }
        let taskViewController = TaskViewController()
        taskViewController.tasks = tasks[indexPath.row]
        taskViewController.modalPresentationStyle = .fullScreen
        present(taskViewController, animated: true, completion: nil)
    }
}
