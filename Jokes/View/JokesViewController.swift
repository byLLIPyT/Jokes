//
//  JokesViewController.swift
//  Jokes
//
//  Created by Александр Уткин on 06.03.2020.
//  Copyright © 2020 Александр Уткин. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countJokes: UITextField!
    
    private var url = "http://api.icndb.com/jokes/random/"
    private var jokes: [Value] = []
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        cell.labelJoke.text    = jokes[indexPath.row].joke
        return cell
    }
    
    @IBAction func downloadJokes(_ sender: Any) {
        
        guard let strCount = countJokes.text else { return }
        guard let _ = Int(strCount) else { return }
        let newUrl = url + strCount
        jokes = []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        fetchData(url: newUrl)
    }
    
    private func fetchData(url: String) {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let downloadJokes = try decoder.decode(Jokes.self, from: data)
                self.jokes = downloadJokes.value
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch let err {
                print(err)
            }
        }.resume()
    }
}
