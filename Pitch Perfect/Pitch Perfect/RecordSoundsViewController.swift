//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Umar Qattan on 4/5/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//  TODO: Organize restart and pause buttons using toggling

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton:          UIButton!
    @IBOutlet weak var recordButton:        UIButton!
    @IBOutlet weak var pauseAudioButton:    UIButton!
    @IBOutlet weak var restartAudioButton:  UIButton!
    
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        stopButton.hidden          = true
        recordingInProgress.text   = "Tap to Record"
        restartAudioButton.hidden  = true
        pauseAudioButton.hidden    = true
    }
    
    @IBAction func recordAudio(sender: UIButton)
    {
        stopButton.hidden          = false
        restartAudioButton.hidden  = false
        pauseAudioButton.hidden    = false
        
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let currentDateTime  = NSDate()
        let formatter        = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName    = formatter.stringFromDate (currentDateTime)+".wav"
        let pathArray        = [dirPath, recordingName]
        let filePath         = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        // set audio session
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        // initialize and prepare the recorder
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate        = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        recordingInProgress.text      = "Recording"
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "stopRecording")
        {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    @IBAction func stopRecording(sender: UIButton)
    {
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }

    
    @IBAction func restartRecording(sender: UIButton)
    {
        /**
        https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/00_Introduction.html
        **/
        restartAudioButton.hidden  = true
        restartAudioButton.enabled = false
        pauseAudioButton.hidden    = true
        pauseAudioButton.enabled   = true
        stopButton.hidden          = true
        stopButton.enabled         = true
        recordingInProgress.text   = "Tap to Record"
        recordButton.enabled       = true
        audioRecorder.recordAtTime(0.0)
    }
    
    @IBAction func pauseRecording(sender: AnyObject)
    {
        /**
        https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/00_Introduction.html
        **/
        if audioRecorder.recording
        {
            audioRecorder.pause()
        }
        else
        {
            audioRecorder.record()
        }
    }
    
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool)
    {
        if(flag)
        {
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else
        {
            println("Recording was not successful")
            recordButton.enabled = true
            stopButton.hidden    = true
        }
    }
}

