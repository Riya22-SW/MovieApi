//
//  ViewController.swift
//  MoviesCD
//
//  Created by admin on 16/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var moviesarr:[MoviesModel]=[]
    var moviesarr1:[MovieModel]=[]


    @IBOutlet weak var tablevc1: UITableView!
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        callMoviesApi()
        // Do any additional setup after loading the view.
    }

    func callMoviesApi(){
        ApiManager().fetchmovies{ result in
            switch result {
                
            case.success(let data):
                self.moviesarr1.append(contentsOf: data)
                print(self.moviesarr1)
                self.tablevc1.reloadData()
                
                
            case.failure(let failure):
                debugPrint("something went wrong in calling API\(failure)")
                
            }
        }
    }
    
    
    func setup(){
        tablevc1.dataSource=self
        tablevc1.delegate=self
        tablevc1.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesarr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
//        cell.lbl1.text = String(moviesarr[indexPath.row].id)
//        cell.lbl2.text = moviesarr[indexPath.row].title
//        cell.lbl3.text = String(moviesarr[indexPath.row].year)
//        cell.lbl4.text = moviesarr[indexPath.row].genre.joined(separator: ", ")
//        cell.lbl5.text = moviesarr[indexPath.row].actors.first ?? "No actors available"
        
        cell.lbl1.text = String(moviesarr1[indexPath.row].id)
        cell.lbl2.text=moviesarr1[indexPath.row].movie
        cell.lbl3.text=moviesarr1[indexPath.row].image
        cell.lbl4.text=moviesarr1[indexPath.row].imdb_url
        cell.lbl5.text=String(moviesarr1[indexPath.row].rating)


        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

