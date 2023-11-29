//
//  ViewController.swift
//  ColorApp
//
//  Created by Fatima Zahra SEDKI on 21/5/2023.
//

import UIKit

class ColorsVC : UIViewController  {

    var colors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call the function to feed the cell
        addRandomColors()
        
    }
    
    
    // a func to add the color to the array
    func addRandomColors()  {
        for _ in 0..<50{
            colors.append(createRandomColors())
        }
    }
    
    // a func to create rondom colors
    func createRandomColors() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    
    // pick the destination for the segue and pass the data the view contoller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DetalisColor 
        destVC.color = sender as? UIColor
    }
   
}

extension ColorsVC :UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else{
            return UITableViewCell()}
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    // a func  called when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToDetails", sender: color)
    }
  
}

