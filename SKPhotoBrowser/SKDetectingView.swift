//
//  SKDetectingView.swift
//  SKPhotoBrowser
//
//  Created by suzuki_keishi on 2015/10/01.
//  Copyright © 2015 suzuki_keishi. All rights reserved.
//

import UIKit

@objc protocol SKDetectingViewDelegate {
    func handleSingleTap(_ view: UIView, touch: UITouch)
    func handleDoubleTap(_ view: UIView, touch: UITouch)
    func handleLongTap(_ view: UIView, longGesture: UILongPressGestureRecognizer)
}

class SKDetectingView: UIView {
    weak var delegate: SKDetectingViewDelegate?
    fileprivate var longGestrue: UILongPressGestureRecognizer?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        p_initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_initialize()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        defer {
            _ = next
        }
        
        guard let touch = touches.first else {
            return
        }
        switch touch.tapCount {
        case 1 : handleSingleTap(touch)
        case 2 : handleDoubleTap(touch)
        default: break
        }
    }
    
    func p_initialize() {
        
        self.p_setUpLongGesture()
    }
    
    func p_setUpLongGesture() {
        
        if  self.longGestrue == nil {
            self.longGestrue = UILongPressGestureRecognizer.init(target: self, action: #selector(handleLongTap(_:)))
            self.addGestureRecognizer(self.longGestrue!)
        }
    }
    
    func handleSingleTap(_ touch: UITouch) {
        delegate?.handleSingleTap(self, touch: touch)
    }
    
    func handleDoubleTap(_ touch: UITouch) {
        delegate?.handleDoubleTap(self, touch: touch)
    }
    
    @objc func handleLongTap(_ longTap: UILongPressGestureRecognizer) {
        delegate?.handleLongTap(self, longGesture: longTap)
    }
}
