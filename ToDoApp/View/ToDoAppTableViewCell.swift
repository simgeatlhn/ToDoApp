//
//  ToDoAppTableViewCell.swift
//  ToDoApp
//
//  Created by simge on 4.06.2022.
//

import UIKit

class ToDoAppTableViewCell: UITableViewCell {
    
    private let completeButton = UIButton()
    private let title = UILabel()
    private let task = UILabel()
    
    enum Identifier : String {
        case custom = "Simge"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(completeButton)
        addSubview(title)
        addSubview(task)
        drawDesign()
        makeCustomButton()
        makeTask()
        makeTitle()
    }
    
    private func drawDesign() {
      
    }

   
}

extension ToDoAppTableViewCell {
    private func makeCustomButton() {
        completeButton.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func makeTitle() {
        title.snp.makeConstraints { (make) in
            make.top.equalTo(completeButton.snp.top).offset(5)
            make.right.left.equalTo(completeButton)
            make.height.width.equalTo(20)
        }
    }
    
    private func makeTask() {
        task.snp.makeConstraints { (make) in
            task.snp.makeConstraints { (make) in
                make.top.equalTo(completeButton.snp.top).offset(5)
                make.right.left.equalTo(completeButton)
                make.bottom.equalToSuperview()
            }
        }
    }
}






