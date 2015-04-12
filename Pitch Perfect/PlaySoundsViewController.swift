//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Umar Qattan on 4/7/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController, AVAudioPlayerDelegate{

    var receivedAudio:  RecordedAudio!
    var audioFile:      AVAudioFile!
    var audioEngine:    AVAudioEngine!
    @IBOutlet weak var stopAudioButton: UIButton!
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        stopAudioButton.hidden = true
        audioEngine = AVAudioEngine()
        audioFile   = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playFastAudio(sender: UIButton)
    {
        audioFX("rate", variable: 1.5)
        stopAudioButton.hidden = false
    }
    @IBAction func playSlowAudio(sender: UIButton)
    {
        audioFX("rate", variable: 0.5)
        stopAudioButton.hidden = false
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton)
    {
        audioFX("pitch", variable: 1000)
        stopAudioButton.hidden = false
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton)
    {
        audioFX("pitch", variable: -1000)
        stopAudioButton.hidden = false
    }
    
    
    @IBAction func playReverbAudio(sender: UIButton)
    {
        audioFX("reverb", variable: 60)
        stopAudioButton.hidden = false
    }
    
    @IBAction func stopAudio(sender: UIButton)
    {
        audioEngine.stop()
        stopAudioButton.hidden = true
        audioEngine.reset()
    }
    func audioFX(FX: String, variable: Float)
    {
        var audioPlayerNode = AVAudioPlayerNode()
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        audioEngine.attachNode(audioPlayerNode)
        if FX == "rate" || FX == "RATE" || FX == "Rate"
        {
            var audioUnitTime = AVAudioUnitTimePitch()
            audioUnitTime.rate = variable
            audioEngine.attachNode(audioUnitTime)
            audioEngine.connect(audioPlayerNode, to: audioUnitTime, format: nil)
            audioEngine.connect(audioUnitTime,   to: audioEngine.outputNode, format: nil)
        }
        else if FX == "pitch" || FX == "PITCH" || FX == "Pitch"
        {
            var audioUnitPitch = AVAudioUnitTimePitch()
            audioUnitPitch.pitch = variable
            audioEngine.attachNode(audioUnitPitch)
            audioEngine.connect(audioPlayerNode, to: audioUnitPitch, format: nil)
            audioEngine.connect(audioUnitPitch,  to: audioEngine.outputNode, format: nil)
        }
        else if FX == "reverb" || FX == "REVERB" || FX == "Reverb"
        {
            var audioUnitReverb = AVAudioUnitReverb()
            audioUnitReverb.loadFactoryPreset(AVAudioUnitReverbPreset.Cathedral)
            audioUnitReverb.wetDryMix = variable
            audioEngine.attachNode(audioUnitReverb)
            audioEngine.connect(audioPlayerNode, to: audioUnitReverb, format: nil)
            audioEngine.connect(audioUnitReverb, to: audioEngine.outputNode, format: nil)
        }
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
