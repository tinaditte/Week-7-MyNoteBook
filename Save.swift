//
//  Save.swift
//  MyNotebook
//
//  Created by Tina Thomsen on 08/03/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
class saveToFile{
	var note = ""
	
	func readFile(){
		let filem = FileManager.default
		let path = filem.currentDirectoryPath
		print(path)
}
	
	/*
	private func documentDirectory() -> String{
		let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		return documentDirectory[0]
	}
	
	private func append(toPath: String, withPathComponent pathComponent: String) -> String?{
		if var pathURL = URL(string: path){
			pathURL.appendPathComponent(pathComponent)
			
			return pathURL.absoluteString
		}
		return nil
	}
	*/
	
}
