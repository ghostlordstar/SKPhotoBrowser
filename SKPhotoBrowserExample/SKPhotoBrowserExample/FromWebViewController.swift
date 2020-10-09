//
//  FromWebViewController.swift
//  SKPhotoBrowserExample
//
//  Created by suzuki_keishi on 2015/10/06.
//  Copyright © 2015 suzuki_keishi. All rights reserved.
//

import UIKit
import SKPhotoBrowser
import SDWebImage

class FromWebViewController: UIViewController, SKPhotoBrowserDelegate {
    var images = [SKPhotoProtocol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKCache.sharedCache.imageCache = CustomImageCache()
    }
    
    @IBAction func pushButton(_ sender: AnyObject) {
        let browser = SKPhotoBrowser(photos: createWebPhotos())
        browser.initializePageIndex(0)
        browser.delegate = self
        
        present(browser, animated: true, completion: nil)
    }
}

// MARK: - SKPhotoBrowserDelegate

extension FromWebViewController {
    func didDismissAtPageIndex(_ index: Int) {
    }
    
    func didDismissActionSheetWithButtonIndex(_ buttonIndex: Int, photoIndex: Int) {
    }
    
    func removePhoto(index: Int, reload: (() -> Void)) {
        SKCache.sharedCache.removeImageForKey("somekey")
        reload()
    }
}

// MARK: - private

private extension FromWebViewController {
    func createWebPhotos() -> [SKPhotoProtocol] {
        
        var photos = [SKPhotoProtocol]()
        
        let photo1 = SKPhoto.photoWithImageURL("http://p6.itc.cn/images01/20200907/19c97457becd47e88b9d05650f4a3f9b.gif")
        photo1.caption = caption[0]
        photo1.shouldCachePhotoURLImage = true
        
        let photo2 = SKPhoto.photoWithImageURL("http://5b0988e595225.cdn.sohucs.com/images/20190702/bf3f3c86b45841039403f14b18999fab.gif")
        photo2.caption = caption[1]
        photo2.shouldCachePhotoURLImage = true
        
        let photo3 = SKPhoto.photoWithImageURL("http://5b0988e595225.cdn.sohucs.com/images/20190702/d0bac6311b194491833a2817ee88cbd5.gif")
        photo3.caption = caption[2]
        photo3.shouldCachePhotoURLImage = true
        
        let photo4 = SKPhoto.photoWithImageURL("http://p3.itc.cn/images01/20200918/8f2923842214446db2c2e5b557e2aec8.gif")
        photo4.caption = caption[3]
        photo4.shouldCachePhotoURLImage = true
        
        let photo5 = SKPhoto.photoWithImageURL("http://p9.itc.cn/images01/20201002/0aff622aa2f54d79ac6a7bbc9db43ea1.gif")
        photo5.caption = caption[4]
        photo5.shouldCachePhotoURLImage = true
        
        let photo6 = SKPhoto.photoWithImageURL("http://p1.itc.cn/images01/20201004/00708e0fd78f44e388227709caaf6562.gif")
        photo6.caption = caption[5]
        photo6.shouldCachePhotoURLImage = true
        
        let photo7 = SKPhoto.photoWithImageURL("http://p8.itc.cn/images01/20201004/8f035702cc564cc580ede60f74c06f57.gif")
        photo7.caption = caption[6]
        photo7.shouldCachePhotoURLImage = true
        
        let photo8 = SKPhoto.photoWithImageURL("http://p5.itc.cn/images01/20200921/c0ec3ebbd48e416aa2ea4b209f9dba99.gif")
        photo8.caption = caption[7]
        photo8.shouldCachePhotoURLImage = true
        
        
        photos.append(photo1)
        photos.append(photo2)
        photos.append(photo3)
        photos.append(photo4)
        photos.append(photo5)
        photos.append(photo6)
        photos.append(photo7)
        photos.append(photo8)

        return photos
    }
}

class CustomImageCache: SKImageCacheable {
    var cache: SDImageCache
    
    init() {
        let cache = SDImageCache(namespace: "com.suzuki.custom.cache")
        self.cache = cache
    }

    func imageForKey(_ key: String) -> UIImage? {
        guard let image = cache.imageFromDiskCache(forKey: key) else { return nil }
        
        return image
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.store(image, forKey: key)
    }

    func removeImageForKey(_ key: String) {}
    
    func removeAllImages() {}
    
}
