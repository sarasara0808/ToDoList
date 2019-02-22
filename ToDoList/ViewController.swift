//
//  ViewController.swift
//  ToDoList
//
//  Created by 木下富美枝 on 2019/01/25.
//  Copyright © 2019年 com.litech. All rights reserved.
//

import UIKit

let white = UIColor.white
let blue = #colorLiteral(red: 1, green: 0.6431372549, blue: 0.7058823529, alpha: 1)
let pink = #colorLiteral(red: 0.6823529412, green: 0.9843137255, blue: 1, alpha: 1)

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  //@IBOutlet var MyTable: UITableView!
  
  //StoryBoardで扱うTableViewを宣言
  @IBOutlet var table: UITableView!
  
  //文字を入れるための配列
  var ToDoArray = [String]()
  
  var saveData : UserDefaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7882352941, green: 0.9843137255, blue: 1, alpha: 1)
    self.navigationController?.navigationBar.tintColor = UIColor.white
    
    //テーブルビューのデータソースメゾットはViewControllerクラスい書くよ、と設定
    table.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
    
    //テーブルビューのデリゲートメゾットはVIewontrollerメゾットに書くよ、という設定
    table.delegate = self
    // ToDoArrayに言葉を入れていく
    //ToDoArray = ["あ", "い", "う"]
    
    func viewDidLoad() {
      table.register (UINib(nibName: "CustomTableViewCell", bundle: nil),forCellReuseIdentifier:"Cell")
    }
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7882352941, green: 0.9843137255, blue: 1, alpha: 1)
    
    if saveData.object(forKey: "TodoList") != nil {
       ToDoArray = saveData.object(forKey: "TodoList") as! [String]
    }
    table.reloadData()
    
    
  }
  
//  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
//  {
//   
//    return true
//    
//  }
  
  
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath : IndexPath) {
    if editingStyle == UITableViewCell.EditingStyle.delete {
      ToDoArray.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
      saveData.set(ToDoArray, forKey: "TodoList")
     tableView.reloadData()
    
    }
    
  }

  //セルの数を設定
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
  //セルの数をToDoArrayの数にする
  //return ToDoArray.count
  print(ToDoArray.count)
  return ToDoArray.count
  
}

//ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for :indexPath) as! CustomTableViewCell
    print(ToDoArray)

    
    //セルにToDoArrayの言葉を表示する
    cell.textbox.text = ToDoArray[indexPath.row]
    
    return cell
    
  }
  
  

  //セルが押された時に呼ばれるメゾット
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(ToDoArray[indexPath.row])が選ばれました")
  }
  
}

