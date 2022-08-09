//
//  ViewController.swift
//  TimeDatePickerKullanimi
//
//  Created by MaSheN on 9.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ffTarih: UITextField!
    @IBOutlet weak var ffSaat: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        ffTarih.inputView = datePicker
        datePicker?.preferredDatePickerStyle = .wheels
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        ffSaat.inputView = timePicker
        timePicker?.preferredDatePickerStyle = .wheels
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        
        view.addGestureRecognizer(dokunmaAlgilama)
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(uiDatePicker:)), for: .valueChanged)
        
        timePicker?.addTarget(self, action: #selector(self.saatGoster(uiDatePicker:)), for: .valueChanged)
        
    }

    @objc func dokunmaAlgilamaMetod(){
        print("Ekrana Dokunuldu")
        view.endEditing(true)
    }
    
    @objc func tarihGoster(uiDatePicker:UIDatePicker){
        let tarihFormati = DateFormatter()
        tarihFormati.dateFormat = "MM/dd/yyyy"
        let alinanTarih = tarihFormati.string(from: uiDatePicker.date)
        ffTarih.text = alinanTarih
        
    }
    
    @objc func saatGoster(uiDatePicker:UIDatePicker){
        let saatFormati = DateFormatter()
        saatFormati.dateFormat = "hh:mm"
        let alinanSaat = saatFormati.string(from: uiDatePicker.date)
        ffSaat.text = alinanSaat
        
    }

}

