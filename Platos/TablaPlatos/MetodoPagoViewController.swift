//
//  MetodoPagoViewController.swift
//  TablaPlatos
//
//  Created by Javier Camargo Urrego on 9/19/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit

class MetodoPagoViewController: UIViewController {

    
    struct ConstantsSegmented {
        let Credito = 0
        let Debito = 1
        let Efectivo = 2
    }
    

    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var segmentedPago: UISegmentedControl!
    
    
    @IBAction func cambioMetodoPago(_ sender: Any)
    {
        if segmentedPago.selectedSegmentIndex == ConstantsSegmented().Credito {
            metodoSeleccionado = "Tarjeta de Crédito"
        } else if segmentedPago.selectedSegmentIndex ==
            ConstantsSegmented().Debito {
            metodoSeleccionado = "Tarjeta Débito"
        } else if segmentedPago.selectedSegmentIndex == ConstantsSegmented().Efectivo {
            metodoSeleccionado = "Efectivo" }
    }
    
    var timerREST: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSpinner.startAnimating()
        segmentedPago.isHidden = true
        //El Timer simula la solicitud REST
        timerREST = Timer.scheduledTimer(timeInterval: 3.0, target: self,
        selector: #selector(getMetodosPago), userInfo: nil, repeats: false)
    }
    func getMetodosPago() {
        //Acá acabaria la solicitud REST con el resultado
        loadingSpinner.stopAnimating()
        segmentedPago.isHidden = false
    }
    

    @IBAction func Confirmar(_ sender: Any)
    {
        dismiss(animated: true)
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true) { }
    }
    override func viewWillAppear(_ animated: Bool) { print("ViewWillAppear Invocado")
    }
    override func viewWillLayoutSubviews() { print("ViewWillLayoutSubviews Invocado")
    }
    override func viewDidLayoutSubviews() { print("ViewDidLayoutSubviews Invocado")
    }
    override func viewDidAppear(_ animated: Bool) { print("ViewDidAppear Invocado")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        print("ViewWillDisappear Invocado")
    timerREST.invalidate()
    }
    override func viewDidDisappear(_ animated: Bool) { print("ViewDidDissapear Invocado")
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
