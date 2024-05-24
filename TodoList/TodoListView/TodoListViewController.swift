//
//  ViewController.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sampleTodoEntryData = SampleTodoEntryData()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleTodoEntryData.createSampleTodoEntryData()
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: "todoCell")
        
        
        self.title = "TodoList"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = .purple
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let rightButton = UIBarButtonItem( barButtonSystemItem: .add,
                                           target: self, action: #selector(addJournal))
        self.navigationItem.rightBarButtonItem = rightButton
        
        let safeArea = view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailTodoTableViewController = DetailTodoTableViewController()
        show(detailTodoTableViewController, sender: self)
    }
    
    
    @objc private func addJournal() {
        let addTodoViewController = AddTodoViewController()
        let navigationController = UINavigationController(rootViewController: addTodoViewController)
        present(navigationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sampleTodoEntryData.todoEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoListTableViewCell
        let todoEntry = sampleTodoEntryData.todoEntries[indexPath.row]
        cell.configureCell(todoEntry: todoEntry)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
}

