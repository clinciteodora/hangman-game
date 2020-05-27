import UIKit
var gameID = ""
var submittedWord = ""
var clue = ""

class MainController: UIViewController {
    
    var textField = UITextField()
    var gameLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Menu"
        view.backgroundColor = .gray
        
        let logoImage = UIImage(named: "Image-1")
        let myImageView:UIImageView = UIImageView()
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
//        myImageView.frame.size.width = 100
//        myImageView.frame.size.height = 100
        myImageView.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        myImageView.image = logoImage
        view.addSubview(myImageView)
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 100))
        title.text = "Hangman Game"
        title.center.x = self.view.center.x
        title.numberOfLines = 2
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 35)
        view.addSubview(title)
        
        textField = UITextField(frame: CGRect(x:100, y: 400, width: 150, height: 35))
        textField.placeholder = "Your ID for the game"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(textField)
        
        gameLabel = UILabel(frame: CGRect(x:0, y:350, width: 200, height: 50))
        gameLabel.text = "ID: " + gameID
        gameLabel.center.x = self.view.center.x
        gameLabel.textAlignment = .center
        view.addSubview(gameLabel)
        
        let submit = UIButton(frame: CGRect(x:255, y:400, width:50, height: 35))
        submit.setTitle("Submit", for: .normal)
        submit.setTitleColor(UIColor.black, for: .normal)
        submit.layer.borderWidth = 1
        submit.layer.borderColor = UIColor.black.cgColor
        submit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        submit.addTarget(self, action: #selector(setGameID), for: .touchUpInside)
        view.addSubview(submit)
        
        let buttonWord = UIButton(frame: CGRect(x: 100, y:575, width: 200, height: 50))
        buttonWord.center = CGPoint(x: self.view.frame.midX, y: 575)
        buttonWord.setTitle("Set Word", for: .normal)
        buttonWord.setTitleColor(UIColor.red, for: .normal)
        buttonWord.addTarget(self, action: #selector(showWordViewControllerPush), for: .touchUpInside)
        buttonWord.layer.cornerRadius = 5
        buttonWord.layer.borderWidth = 2
        buttonWord.layer.borderColor = UIColor.black.cgColor
        view.addSubview(buttonWord)
        
        let buttonPlayer = UIButton(frame: CGRect(x: view.frame.midX, y: 650, width: 200, height: 50))
        buttonPlayer.center = CGPoint(x: self.view.frame.midX, y: 650)
        buttonPlayer.setTitle("Start playing", for: .normal)
        buttonPlayer.setTitleColor(UIColor.red, for: .normal)
        buttonPlayer.addTarget(self, action: #selector(showPlayerViewControllerPush), for: .touchUpInside)
        buttonPlayer.layer.cornerRadius = 5
        buttonPlayer.layer.borderWidth = 2
        buttonPlayer.layer.borderColor = UIColor.black.cgColor
        view.addSubview(buttonPlayer)
        
        let buttonLogin = UIButton(frame: CGRect(x: view.frame.midX, y: 725, width: 200, height: 50))
        buttonLogin.center = CGPoint(x: self.view.frame.midX, y: 725)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(UIColor.red, for: .normal)
        buttonLogin.addTarget(self, action: #selector(showLoginControllerPush), for: .touchUpInside)
        buttonLogin.layer.cornerRadius = 5
        buttonLogin.layer.borderWidth = 2
        buttonLogin.layer.borderColor = UIColor.black.cgColor
        view.addSubview(buttonLogin)
        
    }
    
    func setGameID() {
        gameID = textField.text!
        gameLabel.text = "GameID: " + gameID
    }
    
    func showWordViewControllerPush() {
        navigationController?.pushViewController(WordViewController(), animated: true)
    }
    
    func showPlayerViewControllerPush() {
        if submittedWord != "" && gameID != ""{
            navigationController?.pushViewController(PlayerViewController(), animated: true)
        }
    }
    
    func showLoginControllerPush(){
        navigationController?.pushViewController(LoginController(), animated: true)
        
    }
    
}
