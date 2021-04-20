//
//  FetchData.swift
//  Stay-Fresh
//
//  Created by Dinaol Melak on 4/3/21.
//

import Foundation

class FetchData{
    // setData to local storage
    let storingKey = "LocalStorage"
    func saveLocalProducts(Name inProduct:String, Date inDate:Date){
        // There might already be some products
        if var existingProducts = UserDefaults.standard.dictionary(forKey: storingKey){
            existingProducts[inProduct] = inDate
            UserDefaults.standard.set(existingProducts, forKey: storingKey)
        }else{
            let newData = [inProduct:inDate]
            UserDefaults.standard.set(newData, forKey: storingKey)
        }
    }
    // fetchData from locally stored
    func getLocalProducts()->[String:Date]?{
        if let existingProducts = UserDefaults.standard.dictionary(forKey: storingKey){
            
            var outProducts = [String:Date]()
            for products in existingProducts{
                outProducts[products.key] = products.value as? Date
            }
            return outProducts
        }else{
            return nil
        }
    }
    func deleteProduct(Name inProduct: String){
        if var existingProducts = UserDefaults.standard.dictionary(forKey: storingKey){
            if(existingProducts[inProduct] != nil){
                existingProducts[inProduct] = nil
                UserDefaults.standard.set(existingProducts, forKey: storingKey)
            }
        }
    }
}
