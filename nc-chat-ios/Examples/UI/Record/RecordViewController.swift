//
//  RecordViewController.swift
//  Examples
//
//  Created by 陆广庆 on 2018/4/2.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

import UIKit
import NCChat

class RecordViewController: UIViewController {

    @IBOutlet weak var iRecordingButton: RecordingButton!

    private var recording: Recording!

    override func viewDidLoad() {
        super.viewDidLoad()
        recording = Recording(iRecordingButton)
    }

}
