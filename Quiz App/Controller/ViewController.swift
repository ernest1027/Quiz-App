
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
      
        let userAnswer = sender.currentTitle!
        if quizLogic.checkAnswer(userAnswer)
        {
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        quizLogic.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

        
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizLogic.getQuestionText()
        progressBar.progress = quizLogic.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score \(quizLogic.getScore())"
    }
    
}

