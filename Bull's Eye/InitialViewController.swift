//
//  InitialViewController.swift
//  Bull's Eye
//
//  Created by Rahul on 7/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit

enum Difficulty {
    case easy
    case medium
    case hard
}

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapStartGameButton() {
        performSegue(withIdentifier: "InitialToGame", sender: nil)
    }

}
