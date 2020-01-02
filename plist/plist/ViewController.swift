//
//  ViewController.swift
//  plist
//
//  Created by sachin shinde on 02/01/20.
//  Copyright © 2020 sachin shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dictData = [String:AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        readPropertyList()
        // Do any additional setup after loading the view.
    }
    func readPropertyList() {
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        var plistData: [String: AnyObject] = [:] //Our data
        var plistDatanil: [String: AnyObject] = [:] //Our data
        let plistPath: String? = Bundle.main.path(forResource: "color", ofType: "plist")! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {//convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:AnyObject]
            dictData = plistData
            plistDatanil = plistData
        } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
        print(dictData)
        print("\(dictData["thirdColor"] as? String ?? "")")
    }
    func data()
    {
        var passDictHere = [String:AnyObject]()
        passDictHere = dictData
    }
}

