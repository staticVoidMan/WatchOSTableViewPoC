//
//  NoteListIC.swift
//  WatchOSTableViewPoC WatchKit Extension
//
//  Created by Amin Siddiqui on 29/12/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

import WatchKit
import Foundation


class NoteListIC: WKInterfaceController {

    @IBOutlet var notesTable: WKInterfaceTable!
    var notes = [String]()
    
    var notesFile = NoteListIC.getDocumentsDirectory().appendingPathComponent("notes").path
    
    @IBOutlet var btnAddNewNote: WKInterfaceButton!
    
    @IBOutlet var btnSaveNotes: WKInterfaceButton!
    @IBOutlet var btnLoadSavedNotes: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
    
    @IBAction func btnSaveNotesAction(_ sender: WKInterfaceButton) {
        saveNotes()
    }
    
    @IBAction func btnLoadSavedNotesAction(_ sender: WKInterfaceButton) {
        loadNotes()
    }
    
    //MARK: -
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        if segueIdentifier == "segueNoteViewIC" {
            return (note: notes[rowIndex], index: rowIndex)
        }
        
        return nil
    }
    
    //MARK: -
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory,
                                             in: FileManager.SearchPathDomainMask.userDomainMask)
        return paths[0]
    }
    
    func saveNotes() {
        NSKeyedArchiver.archiveRootObject(notes, toFile: notesFile)
    }
    
    func loadNotes() {
        if let savedNotes = NSKeyedUnarchiver.unarchiveObject(withFile: notesFile) as? [String] {
            notes = savedNotes
        }
        
        loadDatasource()
    }

}
