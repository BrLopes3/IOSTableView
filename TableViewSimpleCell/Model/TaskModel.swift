//
//  TaskModel.swift
//  TableViewSimpleCell
//
//  Created by Bruno Lopes on 2023-10-16.
//

import Foundation
class Task{
    var description : String
    var instructions : String
    var done: Bool = false
    
    //constructor
    init(description: String, instructions: String, done: Bool) {
        self.description = description
        self.instructions = instructions
        self.done = done
    }
    
    
    
}
