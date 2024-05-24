//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

protocol AddTodoViewControllerDelegate: NSObject {
    func reloadTodoEntry(_ todoEntries: [TodoEntry])
}


class AddTodoViewController: UIViewController, UITextViewDelegate {
    weak var delegate: AddTodoViewControllerDelegate?
    var todoEntries: [TodoEntry]
    
    init(todoEntries: [TodoEntry]) {
        self.todoEntries = todoEntries
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("으앙 죽었다.")
    }
    
    private lazy var mainContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textChanged(textField: )), for: .editingChanged)
        return textField
    }()
    
    private lazy var bodyTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Journal Body"
        textView.delegate = self
        return textView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        let today = Date()
        datePicker.minimumDate = today
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = Locale(identifier: "ko-KR")
        return datePicker
    }()
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainContainer.addArrangedSubview(titleTextField)
        mainContainer.addArrangedSubview(bodyTextView)
        mainContainer.addArrangedSubview(datePicker)
        
        view.addSubview(mainContainer)
        
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            mainContainer.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
            mainContainer.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            mainContainer.bottomAnchor.constraint(lessThanOrEqualTo: safeArea.bottomAnchor, constant: -8),
            
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            bodyTextView.heightAnchor.constraint(equalToConstant: 128)
        ])
        
        
        navigationItem.title = "New Todo"
        view.backgroundColor = .white
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .save,
                                          target: self,
                                          action: #selector(save))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                         target: self,
                                         action: #selector(cancel))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.addGestureRecognizer(tapGesture)
    }
    
    func updateSaveButtonState() {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else {
            navigationItem.rightBarButtonItem?.isEnabled = false
            return
        }
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateSaveButtonState()
    }
    
    @objc func textChanged(textField: UITextField){
        updateSaveButtonState()
    }
    
    
    
    @objc func save() {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else {
            return
        }
        let todoEntry = TodoEntry(date: datePicker.date ,title: title, body: body, isCompleted: false)
        todoEntries.append(todoEntry)
        self.delegate?.reloadTodoEntry(todoEntries)
        dismiss(animated: true)
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    @objc func tapHandler(_ sender: UIView) {
        view.endEditing(true)
    }
    
    
    
}
