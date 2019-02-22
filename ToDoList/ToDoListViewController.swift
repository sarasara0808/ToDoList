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
    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.6431372549, blue: 0.7058823529, alpha: 1)
    self.navigationController?.navigationBar.tintColor = UIColor.white
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  
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

