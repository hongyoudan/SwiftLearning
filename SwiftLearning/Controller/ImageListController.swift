//
//  ImageListController.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/22.
//

import UIKit

class ImageListController: UIViewController {
    
    // 这里的 ImageListData 是一个数组，用于存储图片的名字
    var ImageListData:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 赋予了一组图片名称
        ImageListData = ["biye", "chuxi","dongaohui", "dongzhi", "fangyi", "huniandaj", "shengdan", "yuandan", "yuanxiaojie"]

        // 调用 tableView.reloadData() 方法来刷新表视图，使得新的数据（即新的图片名称列表）能够在表中显示出来
        tableView.reloadData()
    }
}

// 实现了 UITableViewDataSource 协议的扩展，该协议用于为 UITableView 提供数据
extension ImageListController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource 协议的一个方法，返回表视图的行数。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 返回 ImageListData 数组的长度，即图片的数量。
        return ImageListData.count
    }
    
    // UITableViewDataSource 协议的方法，用于创建并返回表视图中的每一个单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 先从表视图中获取一个可重用的单元格（使用"TableViewCell"作为标识符，即在 Storyboard 中为该单元格设置的标识符）
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        // 然后将 ImageListData 数组中的相应元素绑定到该单元格上，最后返回这个单元格
        cell.bind(ImageListData[indexPath.row])
        return cell
    }

    // UITableViewDataSource 协议的方法，每当用户选择一个 UITableView 的行时，就会调用这个方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 获取点击的单元格的索引
        let index = indexPath.row
        // 从 ImageListData 数组中获取与所选择行索引相对应的元素（通常是一个图片的名称
        let imageName = ImageListData[index]
        // 从 Storyboard 中实例化一个名为 ImageDetailController 的视图控制器。然后，它强制转换为 ImageDetailController 类型
        let imageDetailController = storyboard?.instantiateViewController(withIdentifier: "ImageDetailController") as! ImageDetailController
        // 将获取到的图片名称设置为 ImageDetailController 实例的 imageName 属性
        // 这样，当用户导航到 ImageDetailController 视图控制器时，这个视图控制器就可以使用这个图片名称来获取并显示相应的图片
        imageDetailController.imageName = imageName
        // 跳转到 ImageDetailController 视图控制器
        navigationController?.pushViewController(imageDetailController, animated: true)
    }
}
