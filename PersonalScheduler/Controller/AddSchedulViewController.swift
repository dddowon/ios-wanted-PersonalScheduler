//
//  AddSchedulViewController.swift
//  PersonalScheduler
//
//  Created by 박도원 on 2023/01/13.
//

import Foundation
import UIKit

class AddSchedulViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view?.backgroundColor = .white
        setLayout()
        setNavigationBar()
    }
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "제목을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let contentTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "본문 입력...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    func setNavigationBar() {
        let measurementButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveSchedul(_:)))
        let backButton = UIBarButtonItem(title: "스케쥴 보기", style: .plain, target: self, action: nil)
        backButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = measurementButton
        self.navigationItem.backBarButtonItem = backButton
    }
    
    @objc func saveSchedul(_ sendor: Any) {
        guard let title = titleTextField.text?.description,
              let content = contentTextField.text?.description else { return }
        
        SignUpViewController.db.collection("SchedulData").document(title).setData(["title": title, "content": content])
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func setLayout() {
        self.view.addSubview(mainStackView)
        
        [titleTextField, contentTextField].forEach {
            mainStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            
            titleTextField.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10),
            titleTextField.heightAnchor.constraint(equalToConstant: 70),
            
            contentTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            contentTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
            contentTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10),
            contentTextField.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}
