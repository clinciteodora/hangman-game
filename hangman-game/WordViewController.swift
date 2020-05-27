import UIKit

class WordViewController: UIViewController {
    
    var word_label = UILabel()
    var enter_word = UITextField()
    var clue_label = UILabel()
    var enter_clue = UITextField()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .gray
        self.title = "Set Word"
        super.viewDidLoad()
        
        let directions = UILabel(frame: CGRect(x: 0, y: 100, width: 300, height: 150))
        directions.text = "Yield the word for the group to guess"
        directions.center.x = self.view.center.x
        directions.numberOfLines = 4
        directions.lineBreakMode = NSLineBreakMode.byWordWrapping
        directions.textAlignment = .center
        directions.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(directions)
        
        word_label = UILabel(frame: CGRect(x:0, y:250, width: 400, height: 50))
        word_label.center.x = self.view.center.x
        word_label.text = "Submitted Word: " + submittedWord
        word_label.textAlignment = .center
        view.addSubview(word_label)
        
        enter_word = UITextField(frame: CGRect(x:85, y: 300, width: 150, height: 25))
        enter_word.placeholder = " Enter Word"
        enter_word.layer.borderWidth = 2
        enter_word.layer.borderColor = UIColor.black.cgColor
        view.addSubview(enter_word)
        
        clue_label = UILabel(frame: CGRect(x:0, y:400, width:400, height:50))
        clue_label.center.x = self.view.center.x
        clue_label.text = "Clue: " + clue
        clue_label.textAlignment = .center
        view.addSubview(clue_label)
        
        enter_clue = UITextField(frame: CGRect(x:85, y:450, width:150, height:25))
        enter_clue.placeholder = "Enter Clue"
        enter_clue.layer.borderWidth = 2
        enter_clue.layer.borderColor = UIColor.black.cgColor
        view.addSubview(enter_clue)
        
        
        let set_word = UIButton(frame: CGRect(x:240, y:300, width:50, height: 25))
        set_word.setTitle("Enter", for: .normal)
        set_word.setTitleColor(UIColor.black, for: .normal)
        set_word.layer.borderWidth = 1
        set_word.layer.borderColor = UIColor.black.cgColor
        set_word.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        set_word.addTarget(self, action: #selector(sendWord), for: .touchUpInside)
        view.addSubview(set_word)
        
        let set_clue = UIButton(frame: CGRect(x:240, y:450, width:50, height:25))
        set_clue.setTitle("Enter", for: UIControlState.normal)
        set_clue.setTitleColor(UIColor.black, for: .normal)
        set_clue.layer.borderWidth = 1
        set_clue.layer.borderColor = UIColor.black.cgColor
        set_clue.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        set_clue.addTarget(self, action: #selector(sendClue), for: .touchUpInside)
        view.addSubview(set_clue)
    }
    
    func sendWord() {
        
        submittedWord = enter_word.text!
        word_label.text = "Submitted Word: " + submittedWord
        
    }
    
    func sendClue(){

        clue = enter_clue.text!
        clue_label.text = "Clue: " + clue
        
    }
    
    
}


