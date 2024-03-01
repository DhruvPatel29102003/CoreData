//
//  ViewController.swift
//  CoreData2
//
//  Created by Droadmin on 28/08/23.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    override func viewDidLoad() {
        super.viewDidLoad()
        song(title: "song", releaseDate: "2", singer: singer(name: "Ram"))
        saveData()
        
        // Do any additional setup after loading the view.
    }
    
    func singer(name: String) -> Singar {
        let singer = Singar(context: context)
        singer.name = name
        return singer
    }
    func song(title: String, releaseDate: String, singer: Singar) {
        let song = Song(context: context)
        song.title = title
        song.releaseDate = releaseDate
        singer.addToSongs(song)
        
    }
    func saveData(){
        do {
            try context.save()
            print("Data saved successfully.")
        } catch {
            print("Error saving data: \(error)")
        }
    }
    func singers() -> [Singar] {
      let request: NSFetchRequest<Singar> = Singar.fetchRequest()
      var fetchedSingers: [Singar] = []
      do {
         fetchedSingers = try context.fetch(request)
      } catch let error {
         print("Error fetching singers \(error)")
      }
      return fetchedSingers
    }
    func songs(singer: Singar) -> [Song] {
      let request: NSFetchRequest<Song> = Song.fetchRequest()
      request.predicate = NSPredicate(format: "singer = %@", singer)
      request.sortDescriptors = [NSSortDescriptor(key: "releaseDate", ascending: false)]
      var fetchedSongs: [Song] = []
      do {
        fetchedSongs = try context.fetch(request)
          print(fetchedSongs)
      } catch let error {
        print("Error fetching songs \(error)")
      }
      return fetchedSongs
    }
    
}

