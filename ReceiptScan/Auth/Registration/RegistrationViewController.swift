import UIKit
import SwiftUI

final class RegistrationViewController: UIViewController {
    private let whiteView = UIView()
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let emailField = UITextField()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let repeatPasswordField = UITextField()
    private let registerButton = UIButton()
    private let imageView = UIImageView()
    private let gradientLayer = CAGradientLayer()
    private let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "RECEIPT\nSCAN"
        view.addSubview(nameLabel)
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 28
        whiteView.clipsToBounds = true
        view.addSubview(whiteView)
        
        titleLabel.text = "Регистрация"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        whiteView.addSubview(titleLabel)
        
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = UIColor(hex: "0D0B20")
        registerButton.layer.cornerRadius = 18
        registerButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        registerButton.contentHorizontalAlignment = .left
        registerButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        whiteView.addSubview(registerButton)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)

        imageView.image = UIImage(systemName: "arrow.up.right.circle.fill")
        imageView.tintColor = .white
        registerButton.addSubview(imageView)
        
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.contentHorizontalAlignment = .left
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)

        view.addSubview(backButton)

        setupGradient()
        setupFields()
        setUpLayout()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    func setupGradient() {
        gradientLayer.colors = [
            UIColor(hex: "FFFFFF").cgColor,
            UIColor(hex: "7290F3").cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupFields() {
        emailField.placeholder = "E-mail"
        usernameField.placeholder = "Имя пользователя"
        passwordField.placeholder = "Пароль"
        repeatPasswordField.placeholder = "Повторите пароль"
        
        [emailField, usernameField, passwordField, repeatPasswordField].forEach {
            $0.borderStyle = .roundedRect
            $0.layer.cornerRadius = 12
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.font = .systemFont(ofSize: 16)
            whiteView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
    }
        
    private func setUpLayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
            
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
            
        whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 308).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 450).isActive = true
            
        titleLabel.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 40).isActive = true
            
        emailField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35).isActive = true
        emailField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -20).isActive = true
            
        usernameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15).isActive = true
        usernameField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor).isActive = true
        usernameField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor).isActive = true
            
        passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 15).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor).isActive = true
            
        repeatPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15).isActive = true
        repeatPasswordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor).isActive = true
        repeatPasswordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor).isActive = true
        
        registerButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -20).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -35).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        imageView.centerYAnchor.constraint(equalTo: registerButton.centerYAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor, constant: -15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        }
    
    @objc private func didTapBack() {
        dismiss(animated: true)
    }

    @objc private func didTapRegister() {
        let mainTabView = MainTabView()
        let hostingController = UIHostingController(rootView: mainTabView)
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true)
    }
    
    @IBAction func didTabSignUp(_ sender: Any) {
        let registrationVC = RegistrationViewController()
        registrationVC.modalPresentationStyle = .fullScreen
        present(registrationVC, animated: true)
    }
}
