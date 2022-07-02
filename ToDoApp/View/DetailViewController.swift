//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by simge on 6.06.2022.
//

import UIKit

class DetailViewController: UIViewController{
    
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let datePicker = UIDatePicker()
    private let descriptionLabel = UILabel()
    private let descriptionTextField = UITextField()
    private let saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        view.addSubview(dateLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(titleLabel)
        view.addSubview(datePicker)
        view.addSubview(descriptionTextField)
        view.addSubview(saveButton)
        
        setUpViews()
        makeTitleLabel()
        makeDateLabel()
        makeDescriptionLabel()
        makeDatePicker()
        makeDescriptionTextField()
        makeSaveButton()
    }
    
    private func setUpViews() {
        view.backgroundColor = UIColor(red: 236/255, green: 229/255, blue: 199/255, alpha: 1)
        titleLabel.text = "Task: "
        dateLabel.text = "Date: "
        descriptionLabel.text = "Description of Task: "
        titleLabel.font = .boldSystemFont(ofSize: 16)
        dateLabel.font = .boldSystemFont(ofSize: 16)
        descriptionLabel.font = .boldSystemFont(ofSize: 16)
        datePicker.locale = .current
        datePicker.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .compact
        } else {
            // Fallback on earlier versions
        }
        datePicker.tintColor = UIColor(red: 194/255, green: 222/255, blue: 209/255, alpha: 1)
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.backgroundColor = UIColor(red: 205/255, green: 194/255, blue: 174/255, alpha: 1)
        descriptionTextField.placeholder = "Write description of your task..."
        saveButton.backgroundColor = UIColor(red: 205/255, green: 194/255, blue: 174/255, alpha: 1)
        saveButton.layer.cornerRadius = 10
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
}

extension DetailViewController {
    private func makeTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeDateLabel() {
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeDescriptionLabel() {
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(350)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.height.greaterThanOrEqualTo(10)
            
        }
    }
    
    private func makeDatePicker() {
        datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
        }
    }
    
    private func makeDescriptionTextField() {
        descriptionTextField.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeSaveButton() {
        saveButton.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionTextField.snp.bottom).offset(80)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
