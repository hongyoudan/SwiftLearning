//
//  TableViewCell.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // 将数据绑定到imageViewCell上
    func bind(_ data: String) {
        imageViewCell.image = UIImage(named: data)
    }
}
