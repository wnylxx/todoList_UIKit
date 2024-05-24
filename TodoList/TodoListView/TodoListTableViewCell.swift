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
        
        addSubview(checkButton)
        addSubview(dateLabel)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implementedrh")
    }
}
