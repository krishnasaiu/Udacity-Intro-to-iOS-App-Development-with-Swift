//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Krishna Sai on 10/16/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    var filePathUrl: NSURL
    var title: String
    
    init(filePathUrl: NSURL, title: String){
        self.filePathUrl = filePathUrl
        self.title = title
    }
}