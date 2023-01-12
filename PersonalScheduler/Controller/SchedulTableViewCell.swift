//
//  SchedulTableViewCell.swift
//  PersonalScheduler
//
//  Created by 박도원 on 2023/01/12.
//

import UIKit

class SchedulTableViewCell: UITableViewCell {
    static let identifier = "schedulCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
      
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSchedulCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setSchedulCell() {
        [titleLabel, dateLabel, contentLabel].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            
            dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            
        ])
    }
}
