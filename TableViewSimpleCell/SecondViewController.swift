//
//  SecondViewController.swift
//  TableViewSimpleCell
//
//  Created by Bruno Lopes on 2023-10-16.
//

import UIKit

//protocol is a way to communicate, similar to Interface
protocol SecondViewControllerDelegate{
    func refreshTable()
}

class SecondViewController: UIViewController {
    
    public var delegate : SecondViewControllerDelegate?
    
    public var selectedRow: Int?
    
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtInstruction: UITextField!
    @IBOutlet weak var swDone: UISwitch!
    
    
    //var selectedItemTitle: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let task = TaskProvider.all[selectedRow!]
        txtDescription.text = task.description
        txtInstruction.text = task.instructions
        swDone.isOn = task.done
    }
    
    @IBAction func btnDeleteTouchUpInside(_ sender: Any) {
        
        //buttom to delete the line of the array
        TaskProvider.all.remove(at: selectedRow!)
        
        //get back to the previous view
        if self.delegate != nil {
            self.delegate!.refreshTable()
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func btnSaveTouchUpInside(_ sender: Any) {
        
        let task = TaskProvider.all[selectedRow!]
        task.description = txtDescription.text!
        task.instructions = txtInstruction.text!
        task.done = swDone.isOn
        
        //get back to the previous view
        if self.delegate != nil {
            self.delegate!.refreshTable()
        }
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
