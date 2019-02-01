//
//  ViewController.swift
//  ToDoList
//
//  Created by 木下富美枝 on 2019/01/25.
//  Copyright © 2019年 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var ToDoListnakami = [String]()
  
  //StoryBoardで扱うTableViewを宣言
  @IBOutlet var table: UITableView!
  
  //文字を入れるための配列
  var ToDoArray = [String]()
  
  var saveData : UserDefaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //テーブルビューのデータソースメゾットはViewControllerクラスい書くよ、と設定
    table.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
    
    //テーブルビューのデリゲートメゾットはVIewontrollerメゾットに書くよ、という設定
    table.delegate = self
    // ToDoArrayに言葉を入れていく
    ToDoArray = ["あ", "い", "う"]
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    if saveData.object(forKey: "TodoList") != nil {
       ToDoArray = saveData.object(forKey: "TodoList") as! [String]
    }
    table.reloadData()
    
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
  {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath : IndexPath) {
    if editingStyle == UITableViewCell.EditingStyle.delete {
      ToDoListnakami.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
      
    }
    
  }

  //セルの数を設定
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
  //セルの数をToDoArrayの数にする
  return ToDoArray.count
  
}

//ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    
    //セルにToDoArrayの言葉を表示する
    cell?.textLabel?.text = ToDoArray[indexPath.row]
    
    return cell!
  }
  
  

  //セルが押された時に呼ばれるメゾット
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(ToDoArray[indexPath.row])が選ばれました")
  }
  
}

