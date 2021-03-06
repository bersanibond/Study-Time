//
//  ViewController.swift
//  Study Time
//
//  Created by Henrique Bersani on 8/10/18.
//  Copyright © 2018 Henrique Bersani. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
      @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        goalName.delegate = self
        countDownTimer.setValue(UIColor.white, forKey: "textColor")
   
        
    }
    
    var addBtnSound: AVAudioPlayer?
    
    var goal = ""
  
    // Goal Is On\OFF (Currently running)
    var oneIsOn = false
    var twoIsOn = false
    var threeIsOn = false
    var fourIsOn = false
    var fiveIsOn = false
    var sixIsOn = false
    var sevenIsOn = false
    
    
    // Goal Views
    @IBOutlet weak var goalOneView: UIView!
    @IBOutlet weak var goalTwoView: UIView!
    @IBOutlet weak var goalThreeView: UIView!
    @IBOutlet weak var goalFourView: UIView!
    @IBOutlet weak var goalFiveView: UIView!
    @IBOutlet weak var goalSixView: UIView!
    @IBOutlet weak var goalSevenView: UIView!
    
    //Goal Labels
    @IBOutlet weak var goalOneLabel: UILabel!
    @IBOutlet weak var goalTwoLabel: UILabel!
    @IBOutlet weak var goalThreeLabel: UILabel!
    @IBOutlet weak var goalFourLabel: UILabel!
    @IBOutlet weak var goalFiveLabel: UILabel!
    @IBOutlet weak var goalSixLabel: UILabel!
    @IBOutlet weak var goalSevenLabel: UILabel!
    
    // Start Buttons
    
    @IBOutlet weak var oneStartBtn: UIButton!
    @IBOutlet weak var twoStartBtn: UIButton!
    @IBOutlet weak var threeStartBtn: UIButton!
    @IBOutlet weak var fourStartBtn: UIButton!
    @IBOutlet weak var fiveStartbtn: UIButton!
    @IBOutlet weak var sixStartBtn: UIButton!
    @IBOutlet weak var sevenStartBtn: UIButton!
 
    //Close Timer - Buttons Outlet
    
    @IBOutlet weak var closeGoalOneButton: UIButton!
    @IBOutlet weak var closeGoalTwoButton: UIButton!
    @IBOutlet weak var closeGoalThreeButton: UIButton!
    @IBOutlet weak var closeGoalFourButton: UIButton!
    @IBOutlet weak var closeGoalFiveButton: UIButton!
    @IBOutlet weak var closeGoalSixButton: UIButton!
    @IBOutlet weak var closeGoalSevenButton: UIButton!

    //Close Timer = Button Actions
    
    @IBAction func closeGoalOne(_ sender: Any) {
        goalOneView.isHidden = true
    }
    @IBAction func closeGoalTwo(_ sender: Any) {
        goalTwoView.isHidden = true
    }
    @IBAction func closeGoalThree(_ sender: Any) {
        goalThreeView.isHidden = true
    }
    @IBAction func closeGoalFour(_ sender: Any) {
        goalFourView.isHidden = true
    }
    @IBAction func closeGoalFive(_ sender: Any) {
        goalFiveView.isHidden = true
    }
    
    @IBAction func closeGoalSix(_ sender: Any) {
        goalSixView.isHidden = true
    }
    @IBAction func closeGoalSeven(_ sender: Any) {
        goalSevenView.isHidden = true
    }
    
 
    //Goal Time Labels
    
    @IBOutlet weak var goalOneTimeLabel: UILabel!
    @IBOutlet weak var goalTwoTimeLabel: UILabel!
    @IBOutlet weak var goalThreeTimeLabel: UILabel!
    @IBOutlet weak var goalFourTimeLabel: UILabel!
    @IBOutlet weak var goalFiveTimeLabel: UILabel!
    @IBOutlet weak var goalSixTimeLabel: UILabel!
    @IBOutlet weak var goalSevenTimeLabel: UILabel!
    
    
    @IBAction func testing(_ sender: Any) {
        print("\(countDownTimer.countDownDuration)")
    }
    
    //Exit Timer
    
    @IBAction func exitTimer(_ sender: Any) {
        //let allGoals = [oneIsOn,twoIsOn,threeIsOn,fourIsOn,fiveIsOn]
        
        if oneIsOn == true {
            goalOneTime = Double(seconds)
            goalOneTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            oneIsOn = false
            if goalOneTime < 1 {
                oneStartBtn.isHidden = true
            }
        } else if twoIsOn == true {
                goalTwoTime = Double(seconds)
                goalTwoTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
                twoIsOn = false
            if goalTwoTime < 1 {
                twoStartBtn.isHidden = true
            }
        }else if threeIsOn == true {
            goalThreeTime = Double(seconds)
            goalThreeTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            threeIsOn = false
            if goalThreeTime < 1 {
                threeStartBtn.isHidden = true
            }
        }else if fourIsOn == true {
            goalFourTime = Double(seconds)
            goalFourTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            fourIsOn = false
            if goalFourTime < 1 {
                fourStartBtn.isHidden = true
            }
        }else if fiveIsOn == true {
            goalFiveTime = Double(seconds)
            goalFiveTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            fiveIsOn = false
            if goalFiveTime < 1 {
                fiveStartbtn.isHidden = true
            }
        }else if sixIsOn == true {
            goalSixTime = Double(seconds)
            goalSixTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            sixIsOn = false
            if goalSixTime < 1 {
                sixStartBtn.isHidden = true
            }
        }else if sevenIsOn == true {
            goalSevenTime = Double(seconds)
            goalSevenTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            sevenIsOn = false
            if goalSevenTime < 1 {
                sevenStartBtn.isHidden = true
            }
        }
        ViewTimerRunning.isHidden = true
        timer.invalidate()
    }
    
    
    
    // Start Study Timer
    
    @IBAction func startOne(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalOneLabel.text
        seconds = Int(goalOneTime)
        countDownTimer.countDownDuration = goalOneTime
        timerLabel.text = timeString(time: TimeInterval(goalOneTime))
        runTimer()
        oneIsOn = true
        
    }
    @IBAction func startTwo(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalTwoLabel.text
        seconds = Int(goalTwoTime)
        countDownTimer.countDownDuration = goalTwoTime
        timerLabel.text = timeString(time: TimeInterval(goalTwoTime))
        runTimer()
        twoIsOn = true
    }
    @IBAction func startThree(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalThreeLabel.text
        seconds = Int(goalThreeTime)
        countDownTimer.countDownDuration = goalThreeTime
        timerLabel.text = timeString(time: TimeInterval(goalThreeTime))
        runTimer()
        threeIsOn = true
    }
    @IBAction func startFour(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalFourLabel.text
        seconds = Int(goalFourTime)
        countDownTimer.countDownDuration = goalFourTime
        timerLabel.text = timeString(time: TimeInterval(goalFourTime))
        runTimer()
        fourIsOn = true
    }
    @IBAction func startFive(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalFiveLabel.text
        seconds = Int(goalFiveTime)
        countDownTimer.countDownDuration = goalFiveTime
        timerLabel.text = timeString(time: TimeInterval(goalFiveTime))
        runTimer()
        fiveIsOn = true
    }
    
    @IBAction func startSix(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalSixLabel.text
        seconds = Int(goalSixTime)
        countDownTimer.countDownDuration = goalSixTime
        timerLabel.text = timeString(time: TimeInterval(goalSixTime))
        runTimer()
        sixIsOn = true
    }
    @IBAction func startSeven(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalSevenLabel.text
        seconds = Int(goalSevenTime)
        countDownTimer.countDownDuration = goalSevenTime
        timerLabel.text = timeString(time: TimeInterval(goalSevenTime))
        runTimer()
        sevenIsOn = true
    }
 

    // View of Timer Running
    
    @IBOutlet weak var ViewTimerRunning: UIView!
    
    @IBOutlet weak var labelOfGoalRunning: UILabel!
    
    // Timer Label
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // Run Timer
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = timeString(time: TimeInterval(seconds)) //This will update the label.
        if seconds == 0 {
            timer.invalidate()
            
            let path = Bundle.main.path(forResource: "dingling.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                addBtnSound = try AVAudioPlayer(contentsOf: url)
                addBtnSound?.play()
            } catch {
                // couldn't load file :(
            }

        }
    }
    
    // Timer Value
    
    var goalOneTime: Double = 00
    var goalTwoTime: Double = 00
    var goalThreeTime: Double = 00
    var goalFourTime: Double = 00
    var goalFiveTime: Double = 00
    var goalSixTime: Double = 00
    var goalSevenTime: Double = 00
    var goalEightTime: Double = 00
    var goalNineTime: Double = 00
    var goalTenTime: Double = 00

    //Formatting Hours, Minutes, Seconds
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%0.2d:%0.2d:%0.2d", hours , minutes , seconds )
    }

    
    
  
    
    
    // Add Goals
    @IBAction func addGoal(_ sender: Any) {

        
        goal = goalName.text!
        //runTimer()
        seconds = Int(countDownTimer.countDownDuration)
        
        if goalOneView.isHidden {
            goalOneView.isHidden = false
            goalOneLabel.text = "\(goal)"
            goalOneTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalOneTime = countDownTimer.countDownDuration
            oneStartBtn.isHidden = false
        } else if goalTwoView.isHidden {
            goalTwoView.isHidden = false
            goalTwoLabel.text = "\(goal)"
            goalTwoTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalTwoTime = countDownTimer.countDownDuration
            twoStartBtn.isHidden = false
        } else if goalThreeView.isHidden {
            goalThreeView.isHidden = false
            goalThreeLabel.text = "\(goal)"
            goalThreeTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalThreeTime = countDownTimer.countDownDuration
            threeStartBtn.isHidden = false
        } else if goalFourView.isHidden {
            goalFourView.isHidden = false
            goalFourLabel.text = "\(goal)"
            goalFourTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalFourTime = countDownTimer.countDownDuration
            fourStartBtn.isHidden = false
        } else if goalFiveView.isHidden {
            goalFiveView.isHidden = false
            goalFiveLabel.text = "\(goal)"
            goalFiveTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalFiveTime = countDownTimer.countDownDuration
            fiveStartbtn.isHidden = false
        } else if goalSixView.isHidden {
            goalSixView.isHidden = false
            goalSixLabel.text = "\(goal)"
            goalSixTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalSixTime = countDownTimer.countDownDuration
            sixStartBtn.isHidden = false
        } else if goalSevenView.isHidden {
            goalSevenView.isHidden = false
            goalSevenLabel.text = "\(goal)"
            goalSevenTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalSevenTime = countDownTimer.countDownDuration
            sevenStartBtn.isHidden = false
        }
 
       print("\(countDownTimer.countDownDuration)")
       print("\(goalOneTime)")
       
        
    }
    
  var countDownDuration: TimeInterval?
    
    //var countDownDuration: TimeInterval { get set }

    
    @IBOutlet weak var countDownTimer: UIDatePicker!
 
   // TextField
    @IBOutlet weak var goalName: UITextField!
    let limitLength = 27
    
    
   
   
    
    
    
    //testing getting music names
    
    /*func gettingSongName() {
        
        let folderUrl = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath {
                var mySong = song.absoluteString
                if mySong.contains(".mp3") {
                    print (mySong)
                }
            }
        } catch {
            
        }
    }
    
    */
    
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = goalName.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= limitLength
    }

}



