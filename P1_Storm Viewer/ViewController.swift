//
//  ViewController.swift
//  P1_Storm Viewer
//
//  Created by Igor Zhukov on 1/25/17.
//  Copyright © 2017 Igor Zhukov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        // FileManager.default is a data type that lets work with the filesystem, in this case to look for files.
        
        let path = Bundle.main.resourcePath!
        // path that is set to the resource path of app's bundle
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    // method sets how many rows should appear in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // method sets text of picture to ech cell and dequeuing cells when user doesn't see them
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            // push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

