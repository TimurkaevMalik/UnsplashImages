//
//  ViewController.swift
//  UnsplashImages
//
//  Created by Malik Timurkaev on 18.09.2025.
//

import UIKit
import FontsPackage

final class ViewController: UIViewController {
    let textView = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        textView.text = "dsfafafafasfasfsafsf"
        textView.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        textView.font = Fonts.mono
        view.backgroundColor = .systemTeal
    }
}
