//
//  ImageDetailController.swift
//  SwiftLearning
//
//  Created by hayden on 2023/10/23.
//

import UIKit

class ImageDetailController: UIViewController {

    // 用于存储图片的名称
    var imageName:String!

    @IBOutlet weak var iv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 在 viewDidLoad 方法中设置 iv（一个 UIImageView）的图片
        // 它使用之前存储的 imageName 来从应用程序的资源中创建一个 UIImage，然后将这个图片设置为 iv 的内容
        // 这样，当用户导航到这个视图控制器时，他们将看到与 imageName 对应的图片
        iv.image = UIImage(named: imageName)
    }
}
