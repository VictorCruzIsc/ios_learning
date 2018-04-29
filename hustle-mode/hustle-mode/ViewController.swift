//
//  ViewController.swift
//  hustle-mode
//
//  Created by Victor Cruz on 4/29/18.
//  Copyright © 2018 Innova. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var viInitialBackground: UIView!
    @IBOutlet weak var btnPower: UIButton!
    @IBOutlet weak var viCloudsBackground: UIView!
    @IBOutlet weak var ivRocket: UIImageView!
    @IBOutlet weak var lblHustle: UILabel!
    @IBOutlet weak var lblOn: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpPlayer(fileName: "hustle-on", fileType: "wav")
    }
    
    @IBAction func powerListener(_ sender: Any) {
        viInitialBackground.isHidden = true
        btnPower.isHidden = true
        viCloudsBackground.isHidden = false
        
        playSoundEffect(player: player)
        
        UIView.animate(withDuration: 2.3, animations: {
            self.ivRocket.frame = CGRect(x: 0, y: 257, width: 370, height: 128)
        }) { (finished) in
            self.lblHustle.isHidden = false
            self.lblOn.isHidden = false
        }
    }
    
    func setUpPlayer(fileName: String, fileType: String) {
        let path = Bundle.main.path(forResource: fileName, ofType: fileType)!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error as NSError{
            print(error.description)
        }
    }
    
    func playSoundEffect(player: AVAudioPlayer) {
        if player.prepareToPlay() {
            player.play()
        } else {
            print("No player setup to reproduce sound effect")
        }
    }
}

