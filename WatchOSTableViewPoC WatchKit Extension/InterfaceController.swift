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
    
    @IBOutlet var btnAddNewNote: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        createDatasource()
        loadDatasource()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //MARK: -
    func createDatasource() {
        notes.append("First Note")
        notes.append("Second Note")
    }
    
    func loadDatasource() {
        notesTable.setNumberOfRows(notes.count, withRowType: "NoteCell")
        
        for rowIndex in 0..<notes.count {
            showNote(notes[rowIndex], at: rowIndex)
        }
    }
    
    func showNote(_ note: String, at rowIndex: Int) {
        guard let row = notesTable.rowController(at: rowIndex) as? NoteCell
            else {
                return
        }
        row.lblNote.setText(note)
    }
    
    //MARK: -
    @IBAction func btnAddNewNoteAction(_ sender: WKInterfaceButton) {
        let newNote = "Random Note ID: \(arc4random())"
        notes.append(newNote)
        
        let index = notes.count - 1
        
        notesTable.insertRows(at: IndexSet(integer: index),
                              withRowType: "NoteCell")
        showNote(notes[index],
                 at: index)
    }
    
    //MARK: -
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        if segueIdentifier == "segueNoteViewIC" {
            return notes[rowIndex]
        }
        
        return nil
    }

}
