//
//  ViewController.swift
//  TablaPlatos
//
//  Created by Javier Camargo Urrego on 9/12/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableViewPlatos: UITableView!
    var platos:[Plato] = [Plato] ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPlatos.delegate = self
        tableViewPlatos.dataSource = self
        getPlatos()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return platos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlatoCell", for: indexPath)
        
        let currentPlato: Plato = platos[indexPath.row]
       
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.setImageWith(URL(string: currentPlato.imagen!)!)
        
        let labelNombre: UILabel = cell.viewWithTag(2) as! UILabel
        labelNombre.text = currentPlato.nombre!
        
        let labelPrecio: UILabel = cell.viewWithTag(3) as! UILabel
        labelPrecio.text = String(currentPlato.precio!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let platoSeleccionado: Plato = platos[indexPath.row]
        self.performSegue(withIdentifier: "ShowPedidoView", sender: platoSeleccionado)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPedidoView" {
            let viewController: DetalleControler = segue.destination as!
            DetalleControler
            viewController.platoSeleccionado = sender as! Plato
        }
    }
    
    
    
    func getPlatos()
    {
        manager.get("/platos", parameters: nil, progress: {(progress) in
        }, success: {(task: URLSessionDataTask, response) in
            let arrayResponse: NSArray = response! as! NSArray
            
            for item in arrayResponse {
                let currentPlato: Plato = Plato (item as! Dictionary<String,
                AnyObject>)
                self.platos.append(currentPlato)
                self.tableViewPlatos.reloadData()
            }
            
            
        }) {(task: URLSessionDataTask?, error:Error) in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

