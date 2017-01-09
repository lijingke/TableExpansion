//
//  ViewController.swift
//  JarusTask
//
//  Created by kvanamac3 on 1/7/17.
//  Copyright © 2017 kvanamac3. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataArray = [   ["stockName":"saideep","stockPrice":"12.44"],
                        ["stockName":"sandeep","stockPrice":"39.40"],
                        ["stockName":"mangaldeep","stockPrice":"4.18"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 2.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
        let horizontalConstraint = NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        let views = ["newView": tableView]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[newView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[newView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        
        
        
        
        let fileManager = FileManager.default
        
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentDirectory.appending("/profile.plist")
        
        if(!fileManager.fileExists(atPath: path)){
            print(path)
            
            let data : [String: String] = [
                "Company": "My Company",
                "FullName": "My Full Name",
                "FirstName": "My First Name",
                "LastName": "My Last Name",
                // any other key values
            ]
            
            let someData = NSDictionary(dictionary: data)
            let isWritten = someData.write(toFile: path, atomically: true)
            print("is the file created: \(isWritten)")
            
            
            
        }else{
            print("file exists")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.awakeFromNib()
        let object = dataArray[indexPath.row] as NSDictionary
        cell.nameLbl.text = object["stockName"] as? String
        cell.numberLbl.text = object["stockPrice"] as? String
        cell.checkBtn.setImage(UIImage(named:"uncheck"), for:UIControlState.normal)
        cell.firstName.text = String (indexPath.row.description)
        cell.isExpanded = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
            else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            tableView.beginUpdates()
            cell.isExpanded = !cell.isExpanded
            tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
                        tableView.endUpdates()
            
        })
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
            else { return }
        UIView.animate(withDuration: 0.3, animations: {
            tableView.beginUpdates()
            cell.isExpanded = false
            tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
            
            tableView.endUpdates()
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
        
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
            else{
                return 50
        }
        return cell.viewHeightConstraint
        
    }
}

