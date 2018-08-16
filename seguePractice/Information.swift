//
//  Information.swift
//  seguePractice
//
//  Created by Albert on 2018/8/15.
//  Copyright © 2018 Albert.C. All rights reserved.
//

import Foundation

class Information {
    
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    convenience init() {
        self.init(title: "", content: "")
    }
    
}
