//
//  SchedulViewController.swift
//  PersonalScheduler
//
//  Created by 박도원 on 2023/01/12.
//

import Foundation
import UIKit
 
class SchedulViewController: UIViewController {
    let schedulTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SchedulTableViewCell.self, forCellReuseIdentifier: SchedulTableViewCell.identifier)
        tableView.rowHeight = 150
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schedulTableView.dataSource = self
        schedulTableView.delegate = self
        self.view.backgroundColor = .white
        setSchedulLayout()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationItem.hidesBackButton = true
        let measurementButton = UIBarButtonItem(title: "스케쥴 추가", style: .plain, target: self, action: #selector(addButton(_:)))
        self.navigationItem.rightBarButtonItem = measurementButton
    }
    
    @objc func addButton(_ sendor: Any) {
        
    }

}

extension SchedulViewController {
    func setSchedulLayout() {
        self.view.addSubview(schedulTableView)

        NSLayoutConstraint.activate([
            schedulTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            schedulTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            schedulTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            schedulTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension SchedulViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchedulTableViewCell.identifier, for: indexPath) as? SchedulTableViewCell else{
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "제목"
        cell.dateLabel.text = "날짜"
        cell.contentLabel.text = "본문"
        
        return cell
    }
}

extension SchedulViewController: UITableViewDelegate {

}
