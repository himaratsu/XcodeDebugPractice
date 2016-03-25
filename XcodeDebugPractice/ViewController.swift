//
//  ViewController.swift
//  XcodeDebugPractice
//
//  Created by 平松　亮介 on 2016/03/25.
//  Copyright © 2016年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. LLDBコマンドをつかってデバッグ出力
        let age = 27
        let name = "Ryosuke Hiramatsu"
        
        // 2. QuickLookをつかって画像を確認
        let coverImage = UIImage(named: "sample.jpg")
        
        
        // 3. CustomStringConvertibleを使う
        let person = Person(name: name, age: age, coverImage: coverImage)
        print(person)
        

        // 4. Breakpointを編集して特別な条件でのみマッチさせる
        for i in 0...50 {
            print(i)
        }

        // 5. 保存したデータを確認する
        // 5-1. NSUserDefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("@himara2", forKey: "account")
        defaults.synchronize()

        // 5-2. Diskに保存する
        if let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true).first,
            coverImage = coverImage {
                let targetPath = path.stringByAppendingString("/sample_data.jpg")
                if let data = UIImageJPEGRepresentation(coverImage, 0.5) {
                    let success = data.writeToFile(targetPath, atomically: true)
                    print(success)
                }
        }
    }
}

class Person: CustomStringConvertible, CustomDebugStringConvertible {
    let name: String
    let age: Int
    let coverImage: UIImage?
    
    init(name: String, age: Int, coverImage: UIImage?) {
        self.name = name
        self.age = age
        self.coverImage = coverImage
    }
    
    var description: String {
        return "\(name), \(age)"
    }
    
    var debugDescription: String {
        return "\(name), \(age), \(coverImage)"
    }
}