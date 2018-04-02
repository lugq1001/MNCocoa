//
//  ViewController.swift
//  Examples
//
//  Created by 陆广庆 on 2018/4/2.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var iVoiceButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func voice(_ sender: UIButton) {
        performSegue(withIdentifier: "Voice", sender: self)
    }

}
