//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by 木下富美枝 on 2019/01/25.
//  Copyright © 2019年 com.litech. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
  
  var ToDoListnakami = [String]()
  
  var saveData : UserDefaults = UserDefaults.standard
  
  @IBOutlet weak var ToDoTextField: UITextField!

  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(_ animated: Bool) {
    ToDoListnakami = saveData.object(forKey: "TodoList") as! [String]
  }
  
  @IBAction func ToDoSaveButton(_ sender: Any) {
    ToDoListnakami.append(ToDoTextField.text!)
    
    ToDoTextField.text = ""
    
    saveData.set( ToDoListnakami, forKey: "TodoList" )
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

