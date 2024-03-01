//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Droadmin on 25/08/23.
//

import UIKit
import CoreData
protocol fatchStudent{
    func fetchStudent()
   
}


class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var markTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    var editName = false
    var delegate:fatchStudent?
    var selectedStudent: StudentName?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Student Name & Mark"
        nameTxt.text = selectedStudent?.name
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
      if selectedStudent != nil {
            mark(mark: Int64(markTxt.text ?? "0") ?? 0, student: selectedStudent!)
            
            saveData()
            self.navigationController?.popViewController(animated: true)
        }
        else {
            mark(mark: Int64(markTxt.text ?? "0") ?? 0, student: student(name: nameTxt.text ?? "0"))
            saveData()
            
            self.delegate?.fetchStudent()
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    func student(name: String) -> StudentName{
        let student = StudentName(context: context)
        student.name = name
        return student
    }
    func mark(mark: Int64 , student: StudentName) {
        let studentMark = StudentMark(context: context)
        studentMark.mark = mark
        student.addToMarks(studentMark)
    }
    func saveData(){
        do {
            try context.save()
            print("Data saved successfully.")
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
}

