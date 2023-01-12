//
//  ViewController.swift
//  PersonalScheduler
//
//  Created by kjs on 06/01/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loginLayoutAddView()
        setloginLayout()
    }
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let loginSignUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(pushSignUpButton), for: .touchUpInside)
        return button
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.attributedPlaceholder = NSAttributedString(string: "아이디을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(pushLoginButton), for: .touchUpInside)
        return button
    }()
    
    private let socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "또는"
        return label
    }()
    
    @objc private func pushSignUpButton(_ sendor: UIButton) {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        self.present(signUpViewController, animated: true)
    }
    
    @objc func pushLoginButton(_ sendor: Any) {
        let schedulViewController = SchedulViewController() 
        self.navigationController?.pushViewController(schedulViewController, animated: true)
    }
}

//MARK: - 레이아웃
extension MainViewController {
    private func loginLayoutAddView() {
        self.view.addSubview(mainView)
        [loginLabel, signUpButton].forEach {
            loginSignUpView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [orLabel].forEach {
            socialStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [loginSignUpView, idTextField, passwordTextField, loginButton, socialStackView].forEach {
            mainView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setloginLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            loginSignUpView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 150),
            loginSignUpView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            loginSignUpView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            loginSignUpView.heightAnchor.constraint(equalToConstant: 50),
            
            loginLabel.leadingAnchor.constraint(equalTo: loginSignUpView.leadingAnchor, constant: 50),
            loginLabel.bottomAnchor.constraint(equalTo: loginSignUpView.bottomAnchor),
            
            signUpButton.trailingAnchor.constraint(equalTo: loginSignUpView.trailingAnchor, constant: -50),
            signUpButton.bottomAnchor.constraint(equalTo: loginSignUpView.bottomAnchor),
            
            idTextField.topAnchor.constraint(equalTo: loginSignUpView.bottomAnchor, constant: 30),
            idTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 50),
            idTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -50),
            idTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            socialStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            socialStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            socialStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
        ])
    }
}
