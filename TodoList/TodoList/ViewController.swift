//
//  ViewController.swift
//  TodoList
//
//  Created by t2023-m0039 on 1/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func addButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "할일 입력", message: nil, preferredStyle: .alert)
        
        alert.addTextField{ textField in
            textField.placeholder = "할일을 입력하세요"
        }
        
        let addAction = UIAlertAction(title: "추가", style: .default) {_ in 
            if let title = alert.textFields?.first?.text {
                let newItem = Todo(id: (todoList.last?.id ?? -1) + 1,
                                   title: title,
                                   isCompleted: false)
                print("\(newItem)")
                
                addTodoList(todo: newItem)
                
                self.tableView?.insertRows(at: [IndexPath(row: todoList.count-1, section: 0)], with: .automatic)
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readTodoList()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tableView?.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? tableViewCell
        else { return UITableViewCell() }
        
        cell.doneSwitch.tag = indexPath.row
        print(indexPath.row)
        cell.titleLabel.text = todoList[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTodo(todoId: todoList[indexPath.row].id)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("\(todoList)")
        }
    }
}


