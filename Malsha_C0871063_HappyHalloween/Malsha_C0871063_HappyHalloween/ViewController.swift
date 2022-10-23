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
    var livesCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func refreshData(){
        livesCount = 10
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
    }
    
    @IBAction func answerOneClicked() {
    }
    @IBAction func answerTwoClicked() {
    }
    @IBAction func answerThreeClicked() {
    }
    @IBAction func answerFourClicked() {
    }
    
}

