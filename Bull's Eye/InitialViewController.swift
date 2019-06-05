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
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {
            fatalError("Unable to find View Controller named GameViewController")
        }
        present(viewController, animated: true)
    }

}
