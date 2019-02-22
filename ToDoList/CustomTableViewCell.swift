//
//  CustomTableViewCell.swift
//  ToDoList
//
//  Created by 木下富美枝 on 2019/02/22.
//  Copyright © 2019年 com.litech. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet var checkbox: UIImageView!
  @IBOutlet var textbox: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
//  func セルに表示するデータの制御(選択数はこれを使う: IndexPath){
//    self.textbox.text = String((選択数はこれを使う.row)+1)
//    self.checkbox.image = UIImage(named: "チェック空.png")
//  }
  
}
