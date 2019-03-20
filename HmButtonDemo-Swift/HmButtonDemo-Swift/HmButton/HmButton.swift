//
//  HmButton.swift
//  chowRent
//
//  Created by HouMeng on 2019/1/25.
//  Copyright © 2019 eallcn. All rights reserved.
//

enum ControlsType {
    /// 图片左 标题右
    case imageLeftTitleRight
    /// 标题左 图片右
    case titleLeftImageRight
    /// 图片上 标题下
    case imageTopTitleBottom
    /// 标题上 图片下
    case titleTopImageBottom
    /// 图片在最左 标题在最右
    case imageBestLeftTitleBestRight
    /// 标题在最左 图片在最右
    case titleBestLeftImageBestRight
    /// 标题->图片 最左
    case titleImageBestLeft
    /// 标题->图片 最右
    case titleImageBestRight
    /// 图片->标题 最左
    case imageTitleBestLeft
    /// 图片->标题 最右
    case imageTitleBestRight
    /// 图片在最上 标题在最下
    case imageBestTopTitleBestBottom
    /// 标题在最上 图片在最下
    case titleBestTopImageBestBottom
    /// 标题->图片 最左上
    case titleImageBestLeftTop
    /// 标题->图片 最右上
    case titleImageBestRightTop
    /// 标题->图片 最左下
    case titleImageBestLeftBottom
    /// 标题->图片 最右下
    case titleImageBestRightBottom
    /// 图片->标题 最左上
    case imageTitleBestLeftTop
    /// 图片->标题 最右上
    case imageTitleBestRightTop
    /// 图片->标题 最左下
    case imageTitleBestLeftBottom
    /// 图片->标题 最右下
    case imageTitleBestRightBottom
}

import UIKit

class HmButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializaView()
    }
    
    /// 按钮图片和文字位置类型
    var controlsType: ControlsType = .imageLeftTitleRight
    /// 图片和按钮间距
    var distance: CGFloat = 0.0
    /// 左控件距离边缘的距离
    var bestLeftDistance: CGFloat = 0.0
    /// 右控件距离边缘的距离
    var bestRightDistance: CGFloat = 0.0
    /// 上控件距离边缘的距离
    var bestTopDistance: CGFloat = 0.0
    /// 下控件距离边缘的距离
    var bestBottomDistance: CGFloat = 0.0
    /// 中心布局控件
    private var layoutControl: UIView = {
        $0.isHidden = true
        return $0
    } (UIView())

    private func initializaView() {
        distance = 0.0
        bestLeftDistance = 0.0
        bestRightDistance = 0.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageViewSize = imageView?.size ?? .zero
        let textSize = titleLabel?.text?.boundingRect(with: size, font: titleLabel?.font ?? .systemFont(ofSize: 11)) ?? .zero
        layoutControl.width = imageViewSize.width + distance + textSize.width
        layoutControl.height = imageViewSize.height + distance + textSize.height
        layoutControl.center = middle
        
        switch controlsType {
        /// 图片左 标题右
        case .imageLeftTitleRight:
            imageView?.left = layoutControl.left
            titleLabel?.right = layoutControl.right
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 标题左 图片右
        case .titleLeftImageRight:
            titleLabel?.left = layoutControl.left
            imageView?.right = layoutControl.right
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 图片上 标题下
        case .imageTopTitleBottom:
            imageView?.top = layoutControl.top
            titleLabel?.bottom = layoutControl.bottom
            imageView?.centerX = layoutControl.centerX
            titleLabel?.centerX = layoutControl.centerX
        /// 标题上 图片下
        case .titleTopImageBottom:
            titleLabel?.top = layoutControl.top
            imageView?.bottom = layoutControl.bottom
            titleLabel?.centerX = layoutControl.centerX
            imageView?.centerX = layoutControl.centerX
        /// 图片在最左 标题在最右
        case .imageBestLeftTitleBestRight:
            imageView?.left = bestLeftDistance
            titleLabel?.right = width - bestRightDistance
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 标题在最左 图片在最右
        case .titleBestLeftImageBestRight:
            titleLabel?.left = bestLeftDistance
            imageView?.right = width - bestRightDistance
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 标题->图片 最左
        case .titleImageBestLeft:
            titleLabel?.left = bestLeftDistance
            imageView?.left = (titleLabel?.right ?? 0) + distance
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 标题->图片 最右
        case .titleImageBestRight:
            imageView?.right = width - bestRightDistance
            titleLabel?.right = (imageView?.left ?? 0) - distance
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 图片->标题 最左
        case .imageTitleBestLeft:
            imageView?.left = bestLeftDistance
            titleLabel?.left = (imageView?.right ?? 0) + distance
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 图片->标题 最右
        case .imageTitleBestRight:
            titleLabel?.right = width - bestRightDistance
            imageView?.right = (titleLabel?.left ?? 0) - distance
            imageView?.centerY = layoutControl.centerY
            titleLabel?.centerY = layoutControl.centerY
        /// 图片在最上 标题在最下
        case .imageBestTopTitleBestBottom:
            layoutControl.height = layoutControl.height + bestTopDistance + bestBottomDistance
            layoutControl.center = middle
            if layoutControl.height > height {
                imageView?.top = layoutControl.top + bestTopDistance
                titleLabel?.bottom = layoutControl.bottom - bestBottomDistance
            } else {
                imageView?.top = bestTopDistance
                titleLabel?.bottom = height - bestBottomDistance
            }
            titleLabel?.centerX = layoutControl.centerX
            imageView?.centerX = layoutControl.centerX
        /// 标题在最上 图片在最下
        case .titleBestTopImageBestBottom:
            layoutControl.height = layoutControl.height + bestTopDistance + bestBottomDistance
            layoutControl.center = middle
            if layoutControl.height > height {
                titleLabel?.top = layoutControl.top + bestTopDistance
                imageView?.bottom = layoutControl.bottom - bestBottomDistance
            } else {
                titleLabel?.top = bestTopDistance
                imageView?.bottom = height - bestBottomDistance
            }
            titleLabel?.centerX = layoutControl.centerX
            imageView?.centerX = layoutControl.centerX
        /// 标题->图片 最左上
        case .titleImageBestLeftTop:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                titleLabel?.left = bestLeftDistance
                imageView?.left = (titleLabel?.right ?? 0) + distance
                if imageView!.height > titleLabel!.height {
                    imageView?.top = bestTopDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.top = bestTopDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.left = bestLeftDistance + distance
                imageView?.top = bestTopDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.left = bestLeftDistance + distance
                titleLabel?.top = bestTopDistance
            }
        /// 标题->图片 最右上
        case .titleImageBestRightTop:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                imageView?.right = width - bestRightDistance
                titleLabel?.right = (imageView?.left ?? 0) - distance
                if imageView!.height > titleLabel!.height {
                    imageView?.top = bestTopDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.top = bestTopDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.right = width - bestRightDistance
                imageView?.top = bestTopDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.right = width - bestRightDistance - distance
                titleLabel?.top = bestTopDistance
            }
        /// 标题->图片 最左下
        case .titleImageBestLeftBottom:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                titleLabel?.left = bestLeftDistance
                imageView?.left = (titleLabel?.right ?? 0) + distance
                if imageView!.height > titleLabel!.height {
                    imageView?.bottom = height - bestBottomDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.bottom = height - bestBottomDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.left = bestLeftDistance + distance
                imageView?.bottom = height - bestBottomDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.left = bestLeftDistance + distance
                titleLabel?.bottom = height - bestBottomDistance
            }
        /// 标题->图片 最右下
        case .titleImageBestRightBottom:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                imageView?.right = width - bestRightDistance
                titleLabel?.right = (imageView?.left ?? 0) - distance
                if imageView!.height > titleLabel!.height {
                    imageView?.bottom = height - bestBottomDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.bottom = height - bestBottomDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.right = width - bestRightDistance
                imageView?.bottom = height - bestBottomDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.right = width - bestRightDistance - distance
                titleLabel?.bottom = height - bestBottomDistance
            }
        /// 图片->标题 最左上
        case .imageTitleBestLeftTop:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                imageView?.left = bestLeftDistance
                titleLabel?.left = (imageView?.right ?? 0) + distance
                if imageView!.height > titleLabel!.height {
                    imageView?.top = bestTopDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.top = bestTopDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.left = bestLeftDistance
                imageView?.top = bestTopDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.left = bestLeftDistance + distance
                titleLabel?.top = bestTopDistance
            }
        /// 图片->标题 最右上
        case .imageTitleBestRightTop:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                titleLabel?.right = width - bestRightDistance
                imageView?.right = (titleLabel?.left ?? 0) - distance
                if imageView!.height > titleLabel!.height {
                    imageView?.top = bestTopDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.top = bestTopDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.right = width - bestRightDistance - distance
                imageView?.top = bestTopDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.right = width - bestRightDistance
                titleLabel?.top = bestTopDistance
            }
        /// 图片->标题 最左下
        case .imageTitleBestLeftBottom:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                imageView?.left = bestLeftDistance
                titleLabel?.left = (imageView?.right ?? 0) + distance
                if imageView!.height > titleLabel!.height {
                    imageView?.bottom = height - bestBottomDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.bottom = height - bestBottomDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.left = bestLeftDistance
                imageView?.bottom = height - bestBottomDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.left = bestLeftDistance + distance
                titleLabel?.bottom = height - bestBottomDistance
            }
        /// 图片->标题 最右下
        case .imageTitleBestRightBottom:
            if imageView?.isHidden == false &&
                titleLabel?.isHidden == false {
                titleLabel?.right = width - bestRightDistance
                imageView?.right = (titleLabel?.left ?? 0) - distance
                if imageView!.height > titleLabel!.height {
                    imageView?.bottom = height - bestBottomDistance
                    titleLabel!.centerY = imageView!.centerY
                }else {
                    titleLabel?.bottom = height - bestBottomDistance
                    imageView!.centerY = titleLabel!.centerY
                }
            }else if imageView?.isHidden == false &&
                titleLabel?.isHidden == true {
                imageView?.right = width - bestRightDistance - distance
                imageView?.bottom = height - bestBottomDistance
            }else if imageView?.isHidden == true &&
                titleLabel?.isHidden == false {
                titleLabel?.right = width - bestRightDistance
                titleLabel?.bottom = height - bestBottomDistance
            }
        }
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds: CGRect = self.bounds
        let widthDelta = max(44.0 - bounds.size.width, 0)
        let heightDelta = max(44.0 - bounds.size.height, 0)
        bounds = bounds.insetBy(dx: -0.5 * widthDelta, dy: -0.5 * heightDelta)
        return bounds.contains(point)
    }
    
}

private extension UIView {
    
    /// 控件尺寸
    var size: CGSize {
        get {
            return frame.size
        }
        set(newSize) {
            frame.size = .init(width: newSize.width, height: newSize.height)
        }
    }
    
    /// 控件宽
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newWidth) {
            frame.size = .init(width: newWidth, height: height)
        }
    }
    
    /// 控件高
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newHeight) {
            frame.size = .init(width: width, height: newHeight)
        }
    }
    
    /// 控件左边距
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set(newLeft) {
            frame = .init(x: newLeft, y: top, width: width, height: height)
        }
    }
    
    /// 控件右边距
    var right: CGFloat {
        get {
            return (left + width)
        }
        set(newRight) {
            left = (newRight - width)
        }
    }
    
    /// 控件上边距
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set(newTop) {
            frame = .init(x: left, y: newTop, width: width, height: height)
        }
    }
    
    /// 控件底边距
    var bottom: CGFloat {
        get {
            return (top + height)
        }
        set(newBottom) {
            top = (newBottom - height)
        }
    }
    
    /// 控件相对父视图中心 X 轴
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newCenterX) {
            center.x = newCenterX
        }
    }
    
    /// 控件相对父视图中心 Y 轴
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newCenterY) {
            center.y = newCenterY
        }
    }
    
    /// 控件相对父视图坐标
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set(newOrigin) {
            frame.origin = newOrigin
        }
    }
    
    /// 控件自身坐标轴中心点
    var middle: CGPoint {
        get {
            return CGPoint.init(x: (width * 0.5), y: (height * 0.5))
        }
    }
    
    /// 控件自身坐标轴 X 轴
    var middleX: CGFloat {
        get {
            return width * 0.5
        }
    }
    
    /// 控件自身坐标轴 Y 轴
    var middleY: CGFloat {
        get {
            return height * 0.5
        }
    }
    
}

private extension String {
    
    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil) -> CGSize {
        let attritube = NSMutableAttributedString(string: self)
        let range = NSRange(location: 0, length: attritube.length)
        attritube.addAttributes([NSAttributedString.Key.font: font], range: range)
        if lineSpacing != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing!
            attritube.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        }
        
        let rect = attritube.boundingRect(with: constrainedSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        var size = rect.size
        
        if let currentLineSpacing = lineSpacing {
            // 文本的高度减去字体高度小于等于行间距，判断为当前只有1行
            let spacing = size.height - font.lineHeight
            if spacing <= currentLineSpacing && spacing > 0 {
                size = CGSize(width: size.width, height: font.lineHeight)
            }
        }
        
        return size
    }
    
    func boundingRect(with constrainedSize: CGSize, font: UIFont, lineSpacing: CGFloat? = nil, lines: Int) -> CGSize {
        if lines < 0 {
            return .zero
        }
        
        let size = boundingRect(with: constrainedSize, font: font, lineSpacing: lineSpacing)
        if lines == 0 {
            return size
        }
        
        let currentLineSpacing = (lineSpacing == nil) ? (font.lineHeight - font.pointSize) : lineSpacing!
        let maximumHeight = font.lineHeight*CGFloat(lines) + currentLineSpacing*CGFloat(lines - 1)
        if size.height >= maximumHeight {
            return CGSize(width: size.width, height: maximumHeight)
        }
        
        return size
    }
}
