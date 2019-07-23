//
//  PostsVC.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-04.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit

class PostsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let data = DataSet()
    var arrdata = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getdata() {
        let url = URL(string: "https://floclu.ca/posts.php")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    self.arrdata = try JSONDecoder().decode([Post].self, from: data!)
                    
                    for mainarr in self.arrdata {
                        print(mainarr.title, " : ", mainarr.detail)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()

                        }
                    }
                }
            }
            catch {
                print("Error in getting json data")
            }
        }.resume()
    }
    
    
    
    
    // Table View functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostCell {
//            cell.configureCell(post: self.allPosts[indexPath.row])
            cell.postTitleLabel.text = self.arrdata[indexPath.row].title
            cell.postDetailsLabel.text = self.arrdata[indexPath.row].detail
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //        performSegue(withIdentifier: "toDetailsVC", sender: self)
//        let detail: PostDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! PostDetailsVC
//        detail.postTitle = arrdata[indexPath.row].title
//        detail.postDetail = arrdata[indexPath.row].detail
//        self.navigationController?.pushViewController(detail, animated: true)
//    }
//
    
    
    
    @IBAction func ReadPostMore(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "toDetailsVC", sender: self)
        let detail: PostDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! PostDetailsVC
        detail.postTitle = arrdata[indexPath.row].title
        detail.postDetail = arrdata[indexPath.row].detail
        self.navigationController?.pushViewController(detail, animated: true)
    }

}
