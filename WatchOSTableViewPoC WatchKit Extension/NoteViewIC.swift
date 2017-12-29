//
//  NoteViewIC.swift
//  WatchOSTableViewPoC WatchKit Extension
//
//  Created by Amin Siddiqui on 29/12/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

import WatchKit
import Foundation


class NoteViewIC: WKInterfaceController {

    @IBOutlet var lblNote: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        lblNote.setText(context as? String)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
