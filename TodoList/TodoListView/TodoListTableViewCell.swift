//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    private lazy var checkButton: UIButton = {
        let checkButton = UIButton(type: .custom)
        checkButton.setImage(UIImage(systemName: "circlebadge"), for: .normal)
        checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        
        checkButton.addAction(UIAction {[weak self] _ in
            self?.checkButton.isSelected.toggle()
        }, for: .touchUpInside)
        return checkButton
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return dateLabel
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return titleLabel
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(checkButton)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            checkButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            checkButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implementedrh")
    }
    
    func configureCell(todoEntry: TodoEntry) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd HH시 mm분 까지"
        titleLabel.text = todoEntry.entryTitle
        dateLabel.text = dateFormatter.string(from: todoEntry.date)
    }
    
    
}
