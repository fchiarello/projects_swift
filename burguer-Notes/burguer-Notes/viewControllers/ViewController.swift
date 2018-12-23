//
//  ViewController.swift
//  burguer-Notes
//
//  Created by Danilo Requena on 28/11/18.
//  Copyright © 2018 Danilo Requena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var localBurguerField: UITextField!
    @IBOutlet  weak var nameBurguerField: UITextField!
    @IBOutlet weak var avaliationField: UITextField?
    @IBOutlet weak var show: UILabel!
    
    var delegate : MealsTableViewController?
    
    var selected = Array<item>()
    
    var itens = [
        item(name: "Cheese", calories: 40, size: "Small"),
        item(name: "Burguer", calories: 150, size: "medium"),
        item(name: "Salad", calories: 20, size: "Small"),
        item(name: "Bacon", calories: 100, size: "Medium")
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = itens[indexPath.row]
                selected.append(item)
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = itens[indexPath.row]
                if let position = selected.index(of: item){
                    selected.remove(at: position)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = itens[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    @IBAction func add() {
    
        if (localBurguerField == nil || nameBurguerField == nil || avaliationField == nil) {
            
            return
        }
        
    let localBurguer = localBurguerField.text!
    let nameBurguer = nameBurguerField!.text!
    //let happinessComents: String
       
        if let avaliation = Int(avaliationField!.text!){
            let meal = Meal(name: nameBurguer, happiness: avaliation, items: selected)
            
            print ("Aqui no \(localBurguer), comi o hamburguer \(meal.name), e a nota que dou a ele é \(meal.happiness) com os itens \(meal.items)")
       
            if (delegate == nil) {
                return
            }
            
            delegate!.add(meal: meal)
            
            show.text = "Aqui no \(localBurguer), comi o hamburguer \(meal.name), e a nota que dou a ele é \(meal.happiness)"
            
            
            
           
          
            
//            navigationController?.popViewController(animated: true) -->  nesse caso tem o optional, o jeito abaixo é o modo seguro
            
            if let navigation = navigationController {
            navigation.popViewController(animated: true)
            }
        
        
        
            
    view.endEditing(true)
        
        }
        
    }


}

