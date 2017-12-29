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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        notesTable.setNumberOfRows(10, withRowType: "NoteCell")
        
        for rowIndex in 0..<10 {
            guard let row = notesTable.rowController(at: rowIndex) as? NoteCell
                else {
                continue
            }
            row.lblNote.setText("Note \(rowIndex + 1)")
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
