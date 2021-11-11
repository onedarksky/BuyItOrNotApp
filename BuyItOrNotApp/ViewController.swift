//
//  ViewController.swift
//  BuyItOrNotApp
//
//  Created by Jiang Yung Tse on 2021/11/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

     var buyIt = true
    
    @IBOutlet weak var mouseButton: UIButton!
    
    @IBOutlet weak var showLable: UILabel!
    
    @IBOutlet weak var changeImageView: UIImageView!
    
    @IBOutlet weak var speakMultiplier: UISlider!
    
    @IBOutlet weak var speakRate: UISlider!
    
    @IBOutlet weak var speakMultiplierLabel: UILabel!
    
    @IBOutlet weak var speakRateLabel: UILabel!
    
    override func viewDidLoad() {
        
        //貼上Gif
        let imageView2 = UIImageView(frame:CGRect(x: 22, y: 10, width: 322, height: 336))
        //圖片縮小
        imageView2.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        view.addSubview(imageView2)
        let animtedImage = UIImage.animatedImageNamed("Screen-", duration: 1.5)
        imageView2.image = animtedImage
        
        super.viewDidLoad()
    }
    // 自訂Slider圖案
    //speakMultiplier.setThumbImage(UIImage(named: "flowers-icon"), for: .normal)
    //speakRate.setThumbImage(UIImage(named: "flowers-icon"), for: .normal)
    
    @IBAction func pressButton(_ sender: UIButton) {
        // toggle() = 切換true或false
        buyIt.toggle()
        print(buyIt)
        
        if buyIt == true {
            showLable.text = "Just Do It"
            changeImageView.image = UIImage(named: "BuyIt.png")
            speak()
        }else{
            showLable.text = "Don't Do It"
            changeImageView.image = UIImage(named: "DontBuyIt")
            speak()
        }
    }
    @IBAction func changeSlider(_ sender: UISlider) {
        speakRateLabel.text = String(format: "%.2f", speakRate.value)
        speakMultiplierLabel.text = String(format: "%.2f", speakMultiplier.value)
    }
    func speak() {
        let utterance = AVSpeechUtterance(string: showLable.text!)
        let synthesizer = AVSpeechSynthesizer()
        //改變語言
        //utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utterance.rate = speakRate.value
        utterance.pitchMultiplier = speakMultiplier.value
        synthesizer.speak(utterance)
    }
}
