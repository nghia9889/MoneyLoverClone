//
//  AddEventTableViewController.swift
//  MoneyLoverClone
//
//  Created by V000232 on 9/23/20.
//  Copyright © 2020 Vu Xuan Cuong. All rights reserved.
//

import UIKit
import SwiftDate



class AddEventTableViewController: UITableViewController {
    
    @IBOutlet private weak var txtName: UITextField!
    @IBOutlet private weak var lblDate: UITextField!
    @IBOutlet private var tblAddEvent: UITableView!
    @IBOutlet private weak var btnLuu: UIBarButtonItem!
    @IBOutlet weak var imgIcon: UIImageView!
    
    let formatter = DateFormatter()
    let formattershort = DateFormatter()
    var imgString : String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAddEvent.delegate = self
        tblAddEvent.dataSource = self
        setupDate()
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
////        imgIcon.isUserInteractionEnabled = true
//        imgIcon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IconViewController") as! IconViewController
//        vc.imageIconDelegate = self
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupDate(){
        let locale = Locale(identifier: "vi")
        formattershort.do{
            $0.dateFormat = "yyyy-MM-dd"
            $0.locale = locale
            $0.timeZone = TimeZone(secondsFromGMT: 7)
        }
        formatter.do {
            $0.dateStyle = .full
            $0.locale = locale
            
        }
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func estimateDay(endDate : Date){
        let now = Date()
        let nowString = formattershort.string(from: now)
        let dateNowFormater = formattershort.date(from: nowString)
        let components = Calendar.current.dateComponents([.day], from: dateNowFormater! , to: endDate )
    }
    
    
    
    @IBAction func btnSave(_ sender: Any) {
        guard let nameEvent = txtName.text else {return}
        guard let date = formatter.date(from: lblDate.text!) else {return}
        guard let imgString = imgIcon.image else { return }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        switch row {
        case 1:
            let calendarScreen = CalendarViewController.instantiate()
            navigationController?.pushViewController(calendarScreen, animated: true)
            calendarScreen.passDate = {
                let dateString = self.formatter.string(from: $0)
                self.lblDate.text = dateString
                self.lblDate.textColor = UIColor.black
            }
        default:
            print("")
        }
    }
    
    @IBAction func editText(_ sender: Any) {
        txtName.textColor = UIColor.black
        if txtName.text!.isEmpty || lblDate.text!.isEmpty {
            btnLuu.isEnabled = false
        }
        else {
            btnLuu.isEnabled = true
        }
    }
    
}
//extension AddEventTableViewController : displayImage{
//
//    func setIcon(data: String) {
//        imgIcon.image = UIImage.init(named: "icon\(data)")
//    }
//
//}


