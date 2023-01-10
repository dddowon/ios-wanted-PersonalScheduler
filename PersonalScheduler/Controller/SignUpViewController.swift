//
//  File.swift
//  PersonalScheduler
//
//  Created by 박도원 on 2023/01/11.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        signUpLayout()
        setSignUpLayout()
    }
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        return label
    }()
    
    private let reconfirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 재확인"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "아이디을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let reconfirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "이름을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.attributedPlaceholder = NSAttributedString(string: "전화번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(signUpButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var idView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idLabel, idTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var passwordView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var reconfirmPasswordView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reconfirmPasswordLabel, reconfirmPasswordTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var nameView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var phoneNumberView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    @objc private func signUpButton(_ sendor: UIButton) {
        self.dismiss(animated: true)
    }
}

extension SignUpViewController {
    private func signUpLayout() {
        self.view.addSubview(mainStackView)
        [idView, passwordView, reconfirmPasswordView, nameView, phoneNumberView, signUpButton].forEach {
            mainStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setSignUpLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -100),
            
            idView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            idView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30),
            idView.heightAnchor.constraint(equalToConstant: 70),
            
            passwordView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            passwordView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30),
            passwordView.heightAnchor.constraint(equalToConstant: 70),
            
            reconfirmPasswordView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            reconfirmPasswordView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30),
            reconfirmPasswordView.heightAnchor.constraint(equalToConstant: 70),
            
            nameView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            nameView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30),
            nameView.heightAnchor.constraint(equalToConstant: 70),
            
            phoneNumberView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            phoneNumberView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30),
            phoneNumberView.heightAnchor.constraint(equalToConstant: 70),
            
            signUpButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
