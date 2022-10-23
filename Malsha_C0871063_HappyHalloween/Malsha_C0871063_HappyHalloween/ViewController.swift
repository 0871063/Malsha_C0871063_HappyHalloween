//
//  ViewController.swift
//  Malsha_C0871063_HappyHalloween
//
//  Created by Malsha Lambton on 2022-10-23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var livesLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var answerFourBtn: UIButton!
    @IBOutlet weak var answerThreeBtn: UIButton!
    @IBOutlet weak var answerTwoBtn: UIButton!
    @IBOutlet weak var answerOneBtn: UIButton!
    
    var pointCount = 0
    var livesCount = 5
    
    var questionList = [Question]()
    var selectedQuestion : Question?
    var timer = Timer()
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
        questionList.append(Question(image: UIImage(named: "Pumpkin"),answerOne: "Carrot", answerTwo: "Apple", answerThree: "Banana", answerFour: "Pumpkin", correctAnswer: "Pumpkin"))
        
        questionList.append(Question(image: UIImage(named: "Ghost"),answerOne: "Man", answerTwo: "Ghost", answerThree: "Dog", answerFour: "Bird", correctAnswer: "Ghost"))
        
        questionList.append(Question(image: UIImage(named: "Candy"),answerOne: "Cake", answerTwo: "Bread", answerThree: "Candy", answerFour: "Chocolate", correctAnswer: "Candy"))
        
        questionList.append(Question(image: UIImage(named: "Pot"),answerOne: "Pot", answerTwo: "Spoon", answerThree: "Knife", answerFour: "Plate", correctAnswer: "Pot"))
        
        questionList.append(Question(image: UIImage(named: "Hat"),answerOne: "Neckless", answerTwo: "Baloon", answerThree: "Hat", answerFour: "Socks", correctAnswer: "Hat"))
        
        questionList.append(Question(image: UIImage(named: "Broom"),answerOne: "Jug", answerTwo: "Broom", answerThree: "Bowl", answerFour: "Plate", correctAnswer: "Broom"))
        
        questionList.append(Question(image: UIImage(named: "Witch"),answerOne: "Witch", answerTwo: "Man", answerThree: "Cat", answerFour: "Dog", correctAnswer: "Witch"))
        
        questionList.append(Question(image: UIImage(named: "Spider"),answerOne: "Snake", answerTwo: "Hat", answerThree: "Dog", answerFour: "Spider", correctAnswer: "Spider"))
        
        questionList.append(Question(image: UIImage(named: "Cat"),answerOne: "Bat", answerTwo: "Hat", answerThree: "Cat", answerFour: "Spider", correctAnswer: "Cat"))
        
        questionList.append(Question(image: UIImage(named: "Bat"),answerOne: "Bat", answerTwo: "Snake", answerThree: "Dog", answerFour: "Spider", correctAnswer: "Bat"))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGame(_ sender: Any) {
        startBtn.isHidden = true
        displayImage()
    }
    
    @IBAction func answerOneClicked() {
        if validateAnswer(answer: answerOneBtn.titleLabel?.text ?? ""){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        updateScoreAndLives(score: pointCount, lives: livesCount)
        displayImage()
    }
    
    @IBAction func answerTwoClicked() {
        if validateAnswer(answer: answerTwoBtn.titleLabel?.text ?? ""){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        updateScoreAndLives(score: pointCount, lives: livesCount)
        displayImage()
    }
    
    @IBAction func answerThreeClicked() {
        if validateAnswer(answer: answerThreeBtn.titleLabel?.text ?? ""){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        updateScoreAndLives(score: pointCount, lives: livesCount)
        displayImage()
    }
    
    @IBAction func answerFourClicked() {
        if validateAnswer(answer: answerFourBtn.titleLabel?.text ?? ""){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        updateScoreAndLives(score: pointCount, lives: livesCount)
        displayImage()
    }
    
    private func displayImage(){
        if livesCount > 0 {
            seconds = 0
            timer.invalidate()
            startTimer()
            selectedQuestion = questionList.randomElement()
            iconImage.image = selectedQuestion?.image
            answerOneBtn.setTitle(selectedQuestion?.answerOne, for: .normal)
            answerTwoBtn.setTitle(selectedQuestion?.answerTwo, for: .normal)
            answerThreeBtn.setTitle(selectedQuestion?.answerThree, for: .normal)
            answerFourBtn.setTitle(selectedQuestion?.answerFour, for: .normal)
            
        }else{
            gameOver()
        }
    }
    
    private func validateAnswer(answer : String) -> Bool{
        if answer == selectedQuestion?.correctAnswer {
            return true
        }else{
            return false
        }
    }
    
    private func updateScoreAndLives(score : Int , lives : Int){
        livesLbl.text = "Lives : " + String(livesCount)
        pointsLbl.text = "Points : " + String(pointCount)
    }
    
    private func gameOver(){
        refreshData()
        let alert = UIAlertController(title: "Game Over", message: "Do you want to play again?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {_ in
            self.startBtn.isHidden = false
            self.livesCount = 5
            self.pointCount = 0
            self.updateScoreAndLives(score: self.pointCount, lives: self.livesCount)
        })
        alert.addAction(noAction)
        alert.addAction(yesAction)
        self.present(alert, animated: true)
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    private func refreshData(){
        iconImage.image = UIImage(named: "QuestionMark")
        answerOneBtn.setTitle("???", for: .normal)
        answerTwoBtn.setTitle("???", for: .normal)
        answerThreeBtn.setTitle("???", for: .normal)
        answerFourBtn.setTitle("???", for: .normal)
        updateScoreAndLives(score: pointCount, lives: livesCount)
        seconds = 0
        timer.invalidate()
    }
    
    @objc func timerAction(){
        if(seconds == 5) {
            if livesCount == 0 {
                gameOver()
            }else{
                livesCount -= 1
                updateScoreAndLives(score: pointCount, lives: livesCount)
                displayImage()
            }
        }else{
            seconds += 1
        }
    }
}

