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
        let age = 999
        let name = "Ryosuke Hiramatsu"
        let coverImage = UIImage(named: "sample.jpg")
        
        // 2. CustomStringConvertibleを使う
        let person = Person(name: name, age: age, coverImage: coverImage)
        print(person)
        
        // 3. Breakpointを編集して特別な条件でのみマッチさせる
        for i in 0...50 {
            print(i)
        }
        
        // 4. 保存したデータを確認する
        // 4-1. NSUserDefaults
        NSUserDefaults.standardUserDefaults().setObject("@himara2", forKey: "account")
        
        // 4-2. Diskに保存する
        if let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .AllDomainsMask, true).first,
            coverImage = coverImage {
            let targetPath = path.stringByAppendingString("sample_data.jpg")
            
            let data = UIImageJPEGRepresentation(coverImage, 1)
            data?.writeToFile(targetPath, atomically: true)
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