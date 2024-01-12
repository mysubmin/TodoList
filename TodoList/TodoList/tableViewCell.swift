//
//  tableViewCell.swift
//  TodoList
//
//  Created by t2023-m0039 on 1/12/24.
//

import UIKit

class tableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    
    @IBAction func isDoneSwitch(_ sender: UISwitch) {
        var todo = todoList[sender.tag]
        
        if sender.isOn {
            titleLabel.text = nil
            titleLabel.attributedText = todo.title.strikeThrough()
        } else {
            titleLabel.attributedText = nil
            titleLabel.text = todo.title
        }
        
        todo.isCompleted = sender.isOn
    }
    
}
