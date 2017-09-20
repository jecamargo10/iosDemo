//
//  DetalleControler.swift
//  TablaPlatos
//
//  Created by Javier Camargo Urrego on 9/12/17.
//  Copyright © 2017 isis3510. All rights reserved.
//
import AFNetworking
import UIKit

var metodoSeleccionado: String = "Efectivo"

class DetalleControler: UIViewController {
    @IBAction func cerrar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    var platoSeleccionado: Plato!
    
    @IBOutlet weak var lblNombre: UITextField!
    @IBOutlet weak var lblLugar: UITextField!
    
    
    @IBAction func hacerPedido(_ sender: Any) {
        //Validaciones
        
        if lblNombre.text == nil || lblNombre.text == ""
        {
        showAlert(title: "Nombre Vacio", message: "Debe agregar un nombre para realizar el pedido", closeButtonTitle: "Cerrar")
            return
        }
        
        if lblLugar.text == nil || lblLugar.text == ""
        {
            showAlert(title: "Lugar Vacio", message: "Debe agregar un lugar para realizar el pedido", closeButtonTitle: "Cerrar")
            return
        }
        
        let params: [String:Any] = [
            "platoId":String(platoSeleccionado.id),
            "cliente":lblNombre.text!,
            "lugar": lblLugar.text!
        ]
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.post("/pedidos", parameters: params, progress: {(progress) in
        }, success: {(task: URLSessionDataTask, response) in

            //            print(dictionaryResponse)
            let dictionaryResponse: NSDictionary = response! as! NSDictionary
            
            let alertController = UIAlertController(title:"Pedido Exitoso",
        message: dictionaryResponse["msg"] as? String,preferredStyle: .alert)
            
            let volverAction = UIAlertAction(title: "Volver a Platos", style:
            .default) {(action:UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(volverAction)
            self.present(alertController,animated: true){}
            
        }){
            (task: URLSessionDataTask?, error: Error) in
            
            self.showAlert(title: "Error en solicitud", message: error.localizedDescription, closeButtonTitle: "Cerrar")
        }
        
        
        
    }
    
    func showAlert(title:String,message:String,closeButtonTitle:String)
    {
        let alertController = UIAlertController(title:title,message:message,preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: closeButtonTitle, style: .default)
        {
            (action:UIAlertAction) in
            //ALGO
            
        }
        alertController.addAction(cancelAction)
        self.present(alertController,animated: true)
        {
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var labelMetodoPago: UILabel!

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        labelMetodoPago.text = "Pago con " + metodoSeleccionado
    }
    
    @IBAction func cambiarMetodoPago(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "GoToMetodoPago",sender: self)
   
        
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
