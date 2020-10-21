//
//  SKToolbar.swift
//  SKPhotoBrowser
//
//  Created by keishi_suzuki on 2017/12/20.
//  Copyright © 2017年 suzuki_keishi. All rights reserved.
//

import Foundation

// helpers which often used
private let bundle = Bundle(for: SKPhotoBrowser.self)

public class SKToolbar: UIToolbar {
    var toolActionButton: UIBarButtonItem!
    private(set) var toolBarType: SKToolBarType = .share
    
    fileprivate weak var browser: SKPhotoBrowser?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, browser: SKPhotoBrowser, type: SKToolBarType? = .share) {
        self.init(frame: frame)
        self.browser = browser
        self.toolBarType = type ?? .share
        
        setupApperance()
        setupToolbar()
    }
    
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = super.hitTest(point, with: event) {
            if SKMesurement.screenWidth - point.x < 50 { // FIXME: not good idea
                return view
            }
        }
        return nil
    }
}

private extension SKToolbar {
    func setupApperance() {
        backgroundColor = .clear
        clipsToBounds = true
        isTranslucent = true
        setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
    }
    
    func setupToolbar() {
        switch self.toolBarType {
        case .share:
            toolActionButton = UIBarButtonItem(barButtonSystemItem: .action, target: browser, action: #selector(SKPhotoBrowser.toolBarAction))
            
        case .save:
            
            toolActionButton = UIBarButtonItem.init(image: UIImage(named: "SKPhotoBrowser.bundle/images/toolbar_download_wh", in: bundle, compatibleWith: nil) ?? UIImage(), style: UIBarButtonItem.Style.plain, target: browser, action: #selector(SKPhotoBrowser.toolBarAction))
        }
        
        toolActionButton.tintColor = UIColor.white
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        if SKPhotoBrowserOptions.displayAction {
            items.append(toolActionButton)
        }
        setItems(items, animated: false)
    }
    
    func setupActionButton() {
    }
}

