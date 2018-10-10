//
//  ViewControllerSector.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerSector: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    var persona = PersonaMO()
    public var s : String = ""
    let  sectors = ["Informatica","Medico","Giuridico", "Economico"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
              persona.settore = s
            
            appDelegate.saveContext()
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = sectors[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        return myTitle
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        pickerView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
            
            pickerView.delegate = self
            pickerView.dataSource = self
            // Do any additional setup after loading the view.
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return sectors.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            s = sectors[row]
            return sectors[row]
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "segueSkills"){
            let wc = segue.destination as! ViewControllerSkills
            
            
            wc.persona = persona
            
        }
    }

}