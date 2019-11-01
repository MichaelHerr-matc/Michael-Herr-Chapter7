//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by Michael Her on 10/30/19.
//  Copyright © 2019 Michael Her. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var images:[UIImage]!
    @IBOutlet weak var customPicker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    
    // Mark: Picker Data Source Method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }

    // Mark: Picker Delegate Method
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    @IBAction func spin(_ sender: UIButton) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal {
                // numInRow++ *** Note that increment/decrement operators are deprecated in Swift 3
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            customPicker.selectRow(newValue, inComponent: i, animated: true)
            customPicker.reloadComponent(i)
            
            if numInRow >= 3 {
                win = true
            }
        }
        winLabel.text = win ? "WINNER!" : " " // Note the space between the quotes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        images = [ UIImage(named: "seven")!,
                  UIImage(named: "bar")!,
                  UIImage(named: "crown")!,
                  UIImage(named: "cherry")!,
                  UIImage(named: "lemon")!,
                  UIImage(named: "apple")!
        ]
        winLabel.text = " " // Note the space between the quotes
        arc4random_stir()
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
