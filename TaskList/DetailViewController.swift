//
//  DetailViewController.swift
//  TaskList
//
//  Created by Harlie  Brindak on 1/31/17.
//  Copyright © 2017 Harlie  Brindak. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UITextView!


    func configureView() {
        // Update the user interface for the detail item.
        if objects.count == 0 {
            return
        }
            if let label = self.detailDescriptionLabel {
                label.text = objects[currentIndex]
                if label.text == BLANK_NOTE {
                    label.text = ""
                }
            }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailViewController = self
        //show the keyboard
        detailDescriptionLabel.becomeFirstResponder()
        detailDescriptionLabel.delegate = self
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if objects.count == 0 {
            return
        }
        objects[currentIndex] = detailDescriptionLabel.text
        if detailDescriptionLabel.text == "" {
            objects[currentIndex] = BLANK_NOTE
        }
        saveAndUpdate()
    }
    
    // save data and update tableview
    func saveAndUpdate(){
        masterView?.save()
        masterView?.tableView.reloadData()
    }
    
    //requires using textviewdelegate
    func textViewDidChange(_ textView: UITextView) {
        objects[currentIndex] = detailDescriptionLabel.text
        saveAndUpdate()
    }


}

