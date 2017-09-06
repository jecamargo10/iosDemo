//
//  DetallePlatoViewController.swift
//  Pedidos
//
//  Created by Javier Camargo Urrego on 9/2/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit

class DetallePlatoViewController: UIViewController {

    @IBOutlet weak var labelTitulo: UILabel!
    var textoTitulo: String!

    @IBAction func cerrarVentana(_ sender: Any) {
        self.dismiss(animated: true){
    }
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitulo.text = textoTitulo

        // Do any additional setup after loading the view.
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
