//
//  ViewController.swift
//  desafioSavingDataAppGroups
//
//  Created by Italo Chesley Gomes da Silva on 18/02/18.
//  Copyright © 2018 Italo Chesley Gomes da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let keyDesafioSavingData = "group.desafioSavingData"
    let keyParametroNumeroVisitas = "parametroNumeroVisitas"
    
    @IBOutlet weak var numeroVisitasLabel: UILabel!
    @IBOutlet weak var numeroVisitarStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numeroVisitarStepper.value = obterNumeroVisitas()
        setarLabelComStepper()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func incrementarNumeroVisitas(_ sender: UIStepper) {
        ajustarNumeroVisitas(numeroVisitasRequeridas: sender.value)
        setarLabelComStepper()
    }
    
    func setarLabelComStepper() {
        numeroVisitasLabel.text = String(numeroVisitarStepper.value)
    }
    
    func obterNumeroVisitas() -> Double {
        let userDefaults = UserDefaults(suiteName: keyDesafioSavingData)
        return userDefaults?.double(forKey: keyParametroNumeroVisitas) ?? 1
    }
    
    func ajustarNumeroVisitas(numeroVisitasRequeridas: Double) {
        let userDefaults = UserDefaults(suiteName: keyDesafioSavingData)
        userDefaults?.set(numeroVisitasRequeridas, forKey: keyParametroNumeroVisitas)
    }
}

