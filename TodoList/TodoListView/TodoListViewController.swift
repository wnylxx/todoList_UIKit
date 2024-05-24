//
//  ViewController.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddTodoViewControllerDelegate {
    
    
    var todoEntries: [TodoEntry] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SharedData.shared.loadTodoEntries()
    }
    
    
    @objc private func addJournal() {
        let addTodoViewController = AddTodoViewController(todoEntries: todoEntries)
        // 중요: add 뷰의 delegate 주인을 list 뷰로 설정해준다.
        addTodoViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: addTodoViewController)
        present(navigationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SharedData.shared.numberOfTodoEntries()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoListTableViewCell
        let todoEntry = SharedData.shared.getTodoEntry(index: indexPath.row)
        cell.configureCell(todoEntry: todoEntry)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoEntry = SharedData.shared.getTodoEntry(index: indexPath.row)
        let detailTodoTableViewController = DetailTodoTableViewController(todoEntry: todoEntry)
        show(detailTodoTableViewController, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func saveTodoEntry(_ todoEntry: TodoEntry) {
        SharedData.shared.addTodoEntry(newTodoEntry: todoEntry)
        SharedData.shared.saveTodoEntries()
        tableView.reloadData()
    }
    
//    func reloadTodoEntry(_ todoEntries: [TodoEntry]) {
//        self.todoEntries = todoEntries
//        tableView.reloadData()
//    }
}

