import UIKit
import Firebase

class LoginController: UIViewController {
    
    var email_text = UITextField()
    var password_text = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        view.backgroundColor = .gray
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 100))
        title.text = "Login"
        title.center.x = self.view.center.x
        title.numberOfLines = 2
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 35)
        
        view.addSubview(title)
        email_text = UITextField(frame: CGRect(x:80, y: 400, width: 250, height: 40))
        email_text.placeholder = "Email"
        email_text.layer.borderWidth = 1
        email_text.layer.borderColor = UIColor.black.cgColor
        email_text.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(email_text)
        
        
        password_text = UITextField(frame: CGRect(x:80, y: 500, width: 250, height: 40))
        password_text.placeholder = "Password"
        password_text.layer.borderWidth = 1
        password_text.layer.borderColor = UIColor.black.cgColor
        password_text.font = UIFont.boldSystemFont(ofSize: 20)
        password_text.isSecureTextEntry = true
        view.addSubview(password_text)
        
        let buttonLogin = UIButton(frame: CGRect(x: 100, y:600, width: 250, height: 50))
        buttonLogin.center = CGPoint(x: self.view.frame.midX, y: 600)
        buttonLogin.setTitle("Submit", for: .normal)
        buttonLogin.setTitleColor(UIColor.black, for: .normal)
        buttonLogin.addTarget(self, action: #selector(singIn(_:)), for: .touchUpInside)
        buttonLogin.layer.cornerRadius = 4
        buttonLogin.layer.borderWidth = 1
        buttonLogin.layer.borderColor = UIColor.black.cgColor
        view.addSubview(buttonLogin)
    
    }
    
    
    @IBAction func singIn(_ sender: Any){
        if email_text.text != "" && password_text.text != "" {
            Auth.auth().signIn(withEmail: (email_text.text)!, password: ((password_text.text)!)) { (authdata, error) in
                if error != nil{
                    
                    print("Error!")
                }
            }
        }
        
    }
    
    @IBAction func singUp(_sender: Any){
        if email_text.text != "" && password_text.text != "" {
            Auth.auth().createUser(withEmail: (email_text.text)!, password: ((password_text.text)!)) { (authdata, error) in
                if error != nil{
                    
                    print("Error!")
                }
            }
        }
    }

}
