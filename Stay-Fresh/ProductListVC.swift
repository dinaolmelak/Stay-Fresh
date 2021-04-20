//
//  ProductListViewController.swift
//  Stay-Fresh
//
//  Created by Dinaol Melak on 4/1/21.
//

import UIKit

class ProductListVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    let fetchData = FetchData()
    var refresher = UIRefreshControl()
    @IBOutlet weak var productsTableView: UITableView!
    var products = [String:Date]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productsTableView.delegate = self
        productsTableView.dataSource = self
        refresher.attributedTitle = NSAttributedString(string: "Pull to Refresh...")
        refresher.addTarget(self, action: #selector(loadProductData), for: .valueChanged)
        productsTableView.addSubview(refresher)
        loadProductData()
    }
    override func viewDidAppear(_ animated: Bool) {
        loadProductData()
    }
    @IBAction func onTapAddProduct(_ sender: Any) {
        performSegue(withIdentifier: "AddProductSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(products.isEmpty){
            return  1
        }else{
            return products.count
        }
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        if(products.isEmpty){
            cell.productNameLabel.alpha = 0.0
            cell.expirationDateLabel.alpha = 0.0
            cell.messageLabel.text = "You have no products Stored Yet :)"
            cell.messageLabel.alpha = 1.0
        }else{
            let dater = DateFormatter()
            dater.dateFormat = "yyyy-MM-dd"
            let product = Array(products)[indexPath.row ]
            cell.productNameLabel.text = product.key
            cell.expirationDateLabel.text = dater.string(from: product.value)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            let item = Array(products)[indexPath.row]
            fetchData.deleteProduct(Name: item.key)
            //productsTableView.reloadData()
            loadProductData()
        }
        
    }
    
    @objc func loadProductData(){
        if let productsAvailable = fetchData.getLocalProducts(){
            products = productsAvailable
        }
        productsTableView.reloadData()
        if(refresher.isRefreshing){
            refresher.endRefreshing()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
