//
//  ToDoAppViewController.swift
//  ToDoApp
//
//  Created by simge on 4.06.2022.
//

import UIKit
import SnapKit

class ToDoAppViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private var data = [String] ()

    private let navbarTitle = UILabel()
    private let tableView = UITableView()
    private let button = UIButton()
    private let searchButton = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(navbarTitle)
        view.addSubview(tableView)
        view.addSubview(button)
        view.addSubview(searchButton)

        setUpViews()
        makeTable()
        makeLabel()
        makeButton()
        makeSearchButton()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setUpViews() {
        view.backgroundColor = UIColor(red: 194/255, green: 222/255, blue: 209/255, alpha: 1)
        navbarTitle.text = "To Do App"
        navbarTitle.font = UIFont(name: navbarTitle.font.fontName, size: 30)
        button.setTitle( "+", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 33
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        searchButton.placeholder = "Search..."
        searchButton.delegate = nil
        searchButton.searchBarStyle = .minimal
        tableView.backgroundColor = UIColor(red: 236/255, green: 229/255, blue: 199/255, alpha: 1)
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        tableView.layer.cornerRadius = 33
        tableView.rowHeight = 50
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = data[indexPath.row]
        let vc = DetailViewController()
        //vc.title = task.title
        //navigationController?.pushViewController(vc, animated: true) //??
        show(vc, sender: self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "alarm")
        cell.imageView?.tintColor = .black
        cell.backgroundColor = UIColor(red: 236/255, green: 229/255, blue: 199/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delete.backgroundColor = .black
        return [delete]
    }
        
    @objc func addButtonAction(){
        let alert = UIAlertController(title: "New Task", message: "Enter your task", preferredStyle: .alert)
        alert.addTextField()
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 194/255, green: 222/255, blue: 209/255, alpha: 1)
        alert.view.tintColor = .black
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {  _ in
            let content = alert.textFields![0] as UITextField
            self.data.append(content.text!)
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
}


extension ToDoAppViewController {
    
    private func makeLabel() {
        navbarTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.height.greaterThanOrEqualTo(10)
        }
     }
    
    private func makeSearchButton() {
        searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(navbarTitle.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    private func makeTable() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(navbarTitle.snp.bottom).offset(70)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(navbarTitle)
        }
    }

    private func makeButton() {
        button.snp.makeConstraints { (make) in
            make.width.equalTo(66)
            make.height.equalTo(66)
            make.bottom.equalTo(view.snp.bottom).offset(-40)
            make.right.equalTo(view.snp.right).offset(-20)
        }
    }
}


