//
//  ViewController.swift
//  TableViewSimpleCell
//
//  Created by Bruno Lopes on 2023-10-16.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialize()
        
    }
    
    func initialize(){
        
        TaskProvider.generateMockData()
        
        //link tableView protocols to view controller (delegate/datasource)
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        for task in TaskProvider.all{
//            print(task)
//        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskProvider.all.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        var content = cell.defaultContentConfiguration()
        
        let task = TaskProvider.all[indexPath.row]
        content.text = task.description
       
    //    content.secondaryText = "This is the secondary text"
      
        if task.done {
            content.image = UIImage(systemName: "checkmark")
            content.imageProperties.tintColor = .green
        
        }else{
            content.image = UIImage(systemName: "square")
            content.imageProperties.tintColor = .red
        }
        
       // content.image = UIImage(systemName: "house")
        
        cell.contentConfiguration = content
        
        print(TaskProvider.all[indexPath.row].description)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("\(TaskProvider.all[indexPath.row].description) SELECTED!!!")
        
        //create the enumSegue for Segue and replace this string
        performSegue(withIdentifier: Segue.toSecondViewController, sender: self)
        
        
        
    }
    

}

