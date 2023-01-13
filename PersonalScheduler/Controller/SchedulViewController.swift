//
//  SchedulViewController.swift
//  PersonalScheduler
//
//  Created by 박도원 on 2023/01/12.
//

import Foundation
import UIKit
 
class SchedulViewController: UIViewController {
    var schedulData: [Schedul] = []
    
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
        readFirestore()
        setSchedulLayout()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationItem.hidesBackButton = true
        let measurementButton = UIBarButtonItem(title: "스케쥴 추가", style: .plain, target: self, action: #selector(addSchedulButton(_:)))
        self.navigationItem.rightBarButtonItem = measurementButton
    }
    
    @objc func addSchedulButton(_ sendor: Any) {
        let addSchedulViewController = AddSchedulViewController()
        self.navigationController?.pushViewController(addSchedulViewController, animated: true)
    }

    private func readFirestore() {
        SignUpViewController.db.collection("SchedulData").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("\(String(describing: error))")
                return
            }
            
            self.schedulData = documents.compactMap { doc -> Schedul? in
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
                    let review = try JSONDecoder().decode(Schedul.self, from: jsonData)
                    return review
                } catch let error {
                    print("\(error)")
                    return nil
                }
            }
            DispatchQueue.main.async {
                self.schedulTableView.reloadData()
            }
        }
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
        return schedulData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchedulTableViewCell.identifier, for: indexPath) as? SchedulTableViewCell else{
            return UITableViewCell()
        }
        
        cell.titleLabel.text = schedulData[indexPath.row].title
        cell.dateLabel.text = "날짜"
        cell.contentLabel.text = schedulData[indexPath.row].content
        
        return cell
    }
}

extension SchedulViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            SignUpViewController.db.collection("SchedulData").document(self.schedulData[indexPath.row].title).delete()
            self.schedulData.remove(at: indexPath.row)
            
            self.schedulTableView.reloadData()
            success(true)
        }
        delete.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions:[delete])
    }
}
