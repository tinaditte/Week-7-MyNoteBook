//
//  ViewController.swift
//  MyNotebook
//
//  Created by Tina Thomsen on 27/02/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	var startNote = "..."
	var notes = [String]()
	var currentRow = -1 //no edit
	let fileName = "Notes.txt"
	
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var myNote: UITextView!
	@IBOutlet weak var notebookoverview: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		notes.append("Test Note")
		notebookoverview.dataSource = self
		notebookoverview.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		myNote.text = startNote
	}
	
	@IBAction func savebtn(_ sender: UIButton) {
		startNote = myNote.text
		if currentRow > -1{
			notes[currentRow] = startNote
			currentRow = -1
			//If no notes saved prior, set current note to start note, and don't add
		}
		else{
		notes.append(myNote.text) //add note to notes array
		}
		notebookoverview.reloadData() //readying for new note
		myNote.text = "..."
		
		//saveToFile(str: myNote, fileName: fileName)
		//print(readNotesFromFile(fileName: fileName))
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return notes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//return reuseable table-view cell obj or the if none, the first cell in tableview
		if let cell = notebookoverview.dequeueReusableCell(withIdentifier: "cell1") {
			cell.textLabel?.text = notes[indexPath.row]
			return cell
		}else{
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//edit a note - located in tableview
		print("To Note at: \(indexPath.row)")
		currentRow = indexPath.row
		myNote.text = notes[currentRow]
	}
	
	func getDocDir() -> URL{
		//locate document folder, return first element in document folder
		let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return docDir[0]
	}
	
	func readFileNote(fileName: String) -> String{
		let filePath = getDocDir().appendingPathComponent(fileName)
		print(filePath)
		
		do{
			let content = try String(contentsOf: filePath, encoding: .utf8)
			return content
		}catch{
			print("An error was caught while trying to read file " + fileName)
		}
		return "Empty"
	}
	
	func saveFileNote(str:String, fileName: String){
		let filePath = getDocDir().appendingPathComponent(fileName)
		do {
			try str.write(to: filePath, atomically: true, encoding: .utf8)
			print("Write to notes \(str)")
		}catch {
			print("An error was caught while trying to write to notes: \(str)")
		}
	}
}
