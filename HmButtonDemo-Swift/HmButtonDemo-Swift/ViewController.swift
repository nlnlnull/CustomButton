//
//  ViewController.swift
//  HmButtonDemo-Swift
//
//  Created by HouMeng on 2019/3/20.
//  Copyright © 2019 侯猛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        let _ = createButton(tag: 0, title: "图片左 标题右", type: .imageLeftTitleRight)
        let _ = createButton(tag: 1, title: "标题左 图片右", type: .titleLeftImageRight)
        let _ = createButton(tag: 2, title: "图片上 标题下", type: .imageTopTitleBottom)
        let _ = createButton(tag: 3, title: "标题上 图片下", type: .titleTopImageBottom)
        let _ = createButton(tag: 4, title: "图片在最左 标题在最右", type: .imageBestLeftTitleBestRight)
        let _ = createButton(tag: 5, title: "标题在最左 图片在最右", type: .titleBestLeftImageBestRight)
        let _ = createButton(tag: 6, title: "标题->图片 最左", type: .titleImageBestLeft)
        let _ = createButton(tag: 7, title: "标题->图片 最右", type: .titleImageBestRight)
        let _ = createButton(tag: 8, title: "图片->标题 最左", type: .imageTitleBestLeft)
        let _ = createButton(tag: 9, title: "图片->标题 最右", type: .imageTitleBestRight)
        let _ = createButton(tag: 10, title: "图片在最上 标题在最下", type: .imageBestTopTitleBestBottom)
        let _ = createButton(tag: 11, title: "标题在最上 图片在最下", type: .titleBestTopImageBestBottom)
        
        let _ = createButton(tag: 12, title: "标题->图片 最左上", type: .titleImageBestLeftTop)
        let _ = createButton(tag: 13, title: "标题->图片 最右上", type: .titleImageBestRightTop)
        let _ = createButton(tag: 14, title: "标题->图片 最左下", type: .titleImageBestLeftBottom)
        let _ = createButton(tag: 15, title: "标题->图片 最右下", type: .titleImageBestRightBottom)
        let _ = createButton(tag: 16, title: "图片->标题 最左上", type: .imageTitleBestLeftTop)
        let _ = createButton(tag: 17, title: "图片->标题 最右上", type: .imageTitleBestRightTop)
        let button1 = createButton(tag: 18, title: "图片->标题 最左下", type: .imageTitleBestLeftBottom)
        let button2 = createButton(tag: 19, title: "图片->标题 最右下", type: .imageTitleBestRightBottom)
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//            print("时间2：", Date())
//            button1.setImage(UIImage(named: "icon_paishe"), for: .normal)
//            button2.setImage(UIImage(named: "icon_paishe"), for: .normal)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
//            print("时间2：", Date())
//            button1.setImage(UIImage(named: ""), for: .normal)
//            button2.setImage(UIImage(named: ""), for: .normal)
//        }
        
    }
    
    func createButton(tag: Int, title: String, type: ControlsType) -> HmButton {
        let button = HmButton(type: .custom)
        button.imageView?.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 0, y: tag * 110, width: 375, height: 100)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "icon_paishe"), for: .normal)
        button.controlsType = type
        button.distance = 5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.bestLeftDistance = 10
        button.bestRightDistance = 10
        button.bestTopDistance = 10
        button.bestBottomDistance = 10
        scrollView.contentSize = CGSize(width: 0, height: button.frame.maxY + 100)
        scrollView.addSubview(button)
        return button
    }

}

