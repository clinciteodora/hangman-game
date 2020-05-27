import UIKit
import PubNub

class PlayerViewController: UIViewController, PNObjectEventListener {
    
    
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var submitted_letter = ""
    var livesNum = ""
    var enter_letter = UITextField()
    var send_letter = UIButton()
    
    var guesses = UILabel()
    var lives = UILabel()
    var dashes = UILabel()
    var player_clue = UILabel()

    
    var won = UILabel()
    var lost = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PLAY"
        view.backgroundColor = .gray

        appDelegate.client.addListener(self)
        appDelegate.client.subscribeToChannels([gameID], withPresence: false)
        appDelegate.client.publish(["word":submittedWord, "channel": gameID, "letter": "1", "lives":"10"], toChannel: "hangman-game-after-publish",
                                    compressed: false, withCompletion:{(status)->Void in
                                        if !status.isError {
                                        }
                                        else{
                                           print("EROOR")
                                       }
        })

        enter_letter = UITextField(frame: CGRect(x:85, y: 400, width: 150, height: 25))
        enter_letter.placeholder = " Enter your guess"
        enter_letter.layer.borderWidth = 1
        enter_letter.layer.borderColor = UIColor.black.cgColor
        view.addSubview(enter_letter)
        
        send_letter = UIButton(frame: CGRect(x:240, y:400, width:50, height: 25))
        send_letter.setTitle("Enter", for: .normal)
        send_letter.setTitleColor(UIColor.black, for: .normal)
        send_letter.layer.borderWidth = 1
        send_letter.layer.borderColor = UIColor.black.cgColor
        send_letter.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        send_letter.addTarget(self, action: #selector(publishLetter), for: .touchUpInside)
        view.addSubview(send_letter)
        
        guesses = UILabel(frame: CGRect(x:0, y:200, width: 200, height: 50))
        guesses.center.x = self.view.center.x
        guesses.textAlignment = .center
        guesses.numberOfLines = 4
        view.addSubview(guesses)
        
        lives = UILabel(frame: CGRect(x:0, y:500, width: 200, height: 50))
        lives.center.x = self.view.center.x
        lives.textAlignment = .center
        view.addSubview(lives)
        
        dashes = UILabel(frame: CGRect(x:10, y:150, width: 200, height: 50))
        dashes.center.x = self.view.center.x
        dashes.textAlignment = .center
        view.addSubview(dashes)
        
        if clue != ""{
            player_clue = UILabel(frame: CGRect(x:0, y:300, width:200, height:50))
            player_clue.text = "Your clue:" + clue
            player_clue.center.x = self.view.center.x
            player_clue.textAlignment = .center
            view.addSubview(player_clue)}
        
        won = UILabel(frame: CGRect(x:85, y: 400, width: 250, height: 50))
        won.text = "YOU WON!"
        won.font = won.font.withSize(50)
        won.center.x = self.view.center.x
        won.textAlignment = .center
        lost = UILabel(frame: CGRect(x:85, y: 400, width: 250, height: 50))
        lost.text = "YOU LOST!"
        lost.font = lost.font.withSize(50)
        lost.center.x = self.view.center.x
        lost.textAlignment = .center
    }
    func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {
        if let data = message.data.message as? [String: String] {
            guesses.text = "Guesses: " +  data["guesses"]!
            lives.text = "Lives: " + data["lives"]!
            dashes.text = data["word"]
            livesNum = data["lives"]!
            if data["won"] == "true" {
                lives.isHidden = true
                guesses.isHidden = true
                send_letter.isHidden = true
                enter_letter.isHidden = true
                dashes.isHidden = true
                view.addSubview(won)
            }
            if data["lost"] == "true" {
                lives.isHidden = true
                guesses.isHidden = true
                send_letter.isHidden = true
                enter_letter.isHidden = true
                dashes.isHidden = true
                view.addSubview(lost)
            }
        }
    }
    func publishLetter() {
        submitted_letter = enter_letter.text!
        enter_letter.text = ""
        appDelegate.client.publish(["word":submittedWord, "channel": gameID, "letter": submitted_letter, "lives": livesNum], toChannel: "hangman-game-after-publish",
                                   compressed: false, withCompletion:{(status)->Void in
                                    if !status.isError {
                                    }
                                    else{
                                        print("ERROR")
                                    }
        })
    }
}

