//
//  ViewController.swift
//  Aditya_C0880466_LabTest
//
//  Created by apple on 04/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startBtnLable: UIButton!
    
    let lapList : [String] = ["lap 1"]
    
    var secondsElapsed = 0
    var timer = Timer()
    var timerCounting:Bool = false
    
    @IBAction func StartnStopBtn(_ sender: Any) {
        
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startBtnLable.setTitle("Start", for: .normal)
            
        }
        else
        {
            timerCounting = true
            startBtnLable.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.secondsElapsed += 1
                let finalTime = self.secondsToHoursMinutesSeconds(Int(self.secondsElapsed))
                self.timerLabel.text = finalTime
            }
        }
        
    }
    
    @IBAction func timerSwitch() {
    }
    
    
    
    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (String) {
        let calHours = seconds / 3600
        let calMinutes = (seconds % 3600) / 60
        let calSeconds = (seconds % 3600) % 60
        let finalTime = "\(calHours) : \(calMinutes): \(calSeconds)"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm:ss"
        
        let date = dateFormatterGet.date(from: finalTime)!
        
        return dateFormatterPrint.string(from: date)
    }
}
    
    extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return lapList.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return lapList[row]
        }
    }


