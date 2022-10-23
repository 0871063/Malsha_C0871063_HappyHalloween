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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
        // Do any additional setup after loading the view.
    }
    
    private func refreshData(){
        livesCount = 5
        pointCount = 0
        iconImage.image = UIImage(named: "QuestionMark")
        answerOneBtn.setTitle("???", for: .normal)
        answerTwoBtn.setTitle("???", for: .normal)
        answerThreeBtn.setTitle("???", for: .normal)
        answerFourBtn.setTitle("???", for: .normal)
        startBtn.isHidden = false
        livesLbl.text = "Lives : " + String(livesCount)
        pointsLbl.text = "Points : " + String(pointCount)
    }
    
    @IBAction func startGame(_ sender: Any) {
        startBtn.isHidden = true
        displayImage()
    }
    
    @IBAction func answerOneClicked() {
        if validateAnswer(){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        displayImage()
    }
    @IBAction func answerTwoClicked() {
        if validateAnswer(){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        displayImage()
    }
    @IBAction func answerThreeClicked() {
        if validateAnswer(){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        displayImage()
    }
    @IBAction func answerFourClicked() {
        if validateAnswer(){
            pointCount += 1
        }else{
            livesCount -= 1
        }
        displayImage()
    }
    
    private func displayImage(){
        if livesCount > 0 {
            
        }else{
            let alert = UIAlertController(title: "Game Over", message: "Do you want to play again?", preferredStyle: .alert)
            let noAction = UIAlertAction(title: "No", style: .cancel)
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {_ in
                self.refreshData()
            })
            alert.addAction(noAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
    }
    
    private func validateAnswer() -> Bool{
        return true
    }
    
}

