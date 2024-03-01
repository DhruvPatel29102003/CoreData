//
//  ThirdViewController.swift
//  CoreDataDemo
//
//  Created by Droadmin on 28/08/23.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var studentMark: [StudentMark] = []
    var selectedStudent: StudentName?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        fatchMark()
    }

    @IBAction func addMark(_ sender: Any) {
        let firstVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        firstVc.selectedStudent = self.selectedStudent
        self.navigationController?.pushViewController(firstVc, animated: true)
        
    }
    func fatchMark(){
        if let mark = selectedStudent {
            let request: NSFetchRequest<StudentMark> = StudentMark.fetchRequest()
            request.predicate = NSPredicate(format: "names = %@", mark)
            request.sortDescriptors = [NSSortDescriptor(key: "mark", ascending: false)]
            
            do {
                
                studentMark = try context.fetch(request)
                for students in studentMark {
                    let mark = students.mark
                    print("Student mark: \(mark)")
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentMark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mySecondTableViewCell", for: indexPath)as! mySecondTableViewCell
        cell.markLbl.text = String(studentMark[indexPath.row].mark)
        return cell
    }

}
