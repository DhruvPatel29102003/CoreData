//
//  SecondViewController.swift
//  CoreDataDemo
//
//  Created by Droadmin on 28/08/23.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, fatchStudent {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var studentName: [StudentName] = []
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Student Name"

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchStudent()
    }
    

    @IBAction func addStudent(_ sender: Any) {
        let secondVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        secondVc.delegate = self
        self.navigationController?.pushViewController(secondVc, animated: true)
        
    }
    func fetchStudent(){
        let request: NSFetchRequest<StudentName> = StudentName.fetchRequest()
        do{
            studentName = try context.fetch(request)
           
            for students in studentName {
                if let name = students.name{
                    print("Student Name: \(name)")
                    self.myTableView.reloadData()
                }
            }
        }catch{
            print(error)
        }
    }
    
}
extension SecondViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.StudentNameLbl.text = studentName[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdVc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController")as! ThirdViewController
        thirdVc.selectedStudent = studentName[indexPath.row]
        self.navigationController?.pushViewController(thirdVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completonHandler) in
            let deleteStudent = self.studentName[indexPath.row]
            self.context.delete(deleteStudent)
            do{
                try self.context.save()
                self.studentName.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }catch{
                print("error")
            }
            completonHandler(true)
        }
        delete.backgroundColor = .red
        let edit = UIContextualAction(style: .normal, title: "edit") { action, view, completion in
            let navigation = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            navigation.selectedStudentName = self.studentName[indexPath.row] // Set the selectedStudent property
            self.navigationController?.pushViewController(navigation, animated: true)
            completion(true)
        }
        edit.backgroundColor = .blue
        let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
        
       
    }
    
    
}
