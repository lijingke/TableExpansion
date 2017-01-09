//
//  CustomTableViewCell.swift
//  JarusTask
//
//  Created by kvanamac3 on 1/7/17.
//  Copyright © 2017 kvanamac3. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let cellview = UIView()
    
    
    let checkBtn = UIButton()
    let numberLbl = UILabel()
    let nameLbl = UILabel()
    let disclosureBtn = UIButton()
    
   
    
    
    var firstName = UILabel()
    var lastNmae = UILabel()
    var city = UILabel()
    
    
    var viewHeightConstraint: CGFloat = 50.0
    
    
    
    var isExpanded:Bool! = false
        {
        didSet
        {
            if !isExpanded {
                self.viewHeightConstraint = 50.0
                
            } else {
                self.viewHeightConstraint = 128.0
            }
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
         cellview.translatesAutoresizingMaskIntoConstraints = false
         cellview.backgroundColor = UIColor.cyan
         contentView.addSubview(cellview)
       
        let horizontalConstraint = NSLayoutConstraint(item: cellview, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.centerX, multiplier: 2, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: cellview, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.centerY, multiplier: 2, constant: 0)
        
        let myView = ["newView": cellview]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[newView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myView)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[newView]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myView)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        
        
        
        checkBtn.translatesAutoresizingMaskIntoConstraints = false
        numberLbl.translatesAutoresizingMaskIntoConstraints = false
        numberLbl.textAlignment = NSTextAlignment.left
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.textAlignment = NSTextAlignment.left
        disclosureBtn.translatesAutoresizingMaskIntoConstraints = false
        disclosureBtn.setImage(UIImage(named:"arrow"), for:UIControlState.normal)
         cellview.addSubview(checkBtn)
         cellview.addSubview(numberLbl)
         cellview.addSubview(nameLbl)
         cellview.addSubview(disclosureBtn)
        
        let views = ["checkBtn": checkBtn,
                     "nameLbl": nameLbl,
                     "numberLbl": numberLbl,
                     "disclosureBtn":disclosureBtn]
        
        
        var allConstraints = [NSLayoutConstraint]()
        
        
        
        let checkVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-20-[checkBtn(30)]",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += checkVerticalConstraints
        
        
        let nameVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-20-[numberLbl(30)]",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += nameVerticalConstraints
        
        
        
        let numberVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-20-[nameLbl(30)]",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += numberVerticalConstraints
        
        
        
        let discolsureVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-20-[disclosureBtn(30)]",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += discolsureVerticalConstraints
        
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[checkBtn(30)]-[numberLbl]-[nameLbl]-[disclosureBtn(30)]-15-|",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += topRowHorizontalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
        
        
//subView.frame = CGRect (x: 0 ,y : 50 , width : self.frame.width , height : 50)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
