//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Umar Qattan on 4/7/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject
{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String)
    {
        self.filePathUrl = filePathUrl
        self.title       = title
    }
    
}