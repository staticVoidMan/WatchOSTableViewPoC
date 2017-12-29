//
//  InterfaceController.swift
//  WatchOSTableViewPoC WatchKit Extension
//
//  Created by Amin Siddiqui on 29/12/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var notesTable: WKInterfaceTable!
    var notes = [String]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        notes.append("First Note")
        notes.append("Second Note")
        
        notesTable.setNumberOfRows(notes.count, withRowType: "NoteCell")
        
        for rowIndex in 0..<notes.count {
            guard let row = notesTable.rowController(at: rowIndex) as? NoteCell
                else {
                continue
            }
            row.lblNote.setText(notes[rowIndex])
        }
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
