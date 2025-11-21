import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var whiteFrame: UIView!
    @IBOutlet weak var authLabel: UILabel!
    @IBOutlet weak var emailSymbol: UIImageView!
    @IBOutlet weak var eyeSymbol: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var noAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var receiptLabel: UILabel!
    @IBOutlet weak var scanLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor(hex: "7290F3").cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        whiteFrame.layer.cornerRadius = 30
        whiteFrame.backgroundColor = .white
        
        authLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        receiptLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        scanLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        emailSymbol.tintColor = .systemGray3
        eyeSymbol.tintColor = .systemGray3
        
        emailTextField.placeholder = "Почта"
        
        passwordTextField.placeholder = "Пароль"
        
        logInButton.backgroundColor = .black
        logInButton.setTitleColor(.white, for: .normal)
      
    }

    @IBAction func didTabLogIn(_ sender: Any) {
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

