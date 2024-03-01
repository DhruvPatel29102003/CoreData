//
//  FourthViewController.swift
//  CoreDataDemo
//
//  Created by Droadmin on 28/08/23.
//

import UIKit
import CoreData
protocol FatchMark{
    func fatchMark()
}

class FourthViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  //  let studentName : StudentName? = nil
    var delegate: FatchMark?
    @IBOutlet weak var markTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMark(_ sender: Any) {
        let studentMarkData = ["mark" : markTxt.text ?? ""]
        saveMark(object: studentMarkData)
        //addMark(mark1: Int64(markTxt.text ?? "") ?? 0, name: self.studentName!)
        self.delegate?.fatchMark()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func saveMark(object: [String:String]){
        let studentMark = NSEntityDescription.insertNewObject(forEntityName: "StudentMark", into: context) as! StudentMark
        
        studentMark.mark = Int64(object["mark"] ?? "0") ?? 0
        
        do{
            try context.save()
            print("successfully saved")
        }catch{
            print("error\(error)")
        }
        
    }
//    func addMark(mark1: Int64, name:StudentName) {
//        let data = StudentMark(context: context)
//        data.mark = mark1
//        data.name = name
//        do{
//            try context.save()
//            print("successfully saved")
//        }catch{
//            print("error\(error)")
//        }
//
//    }
    
}

