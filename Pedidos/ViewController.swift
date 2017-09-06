//
//  ViewController.swift
//  Pedidos
//
//  Created by Javier Camargo Urrego on 9/2/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Atributos y conexiones a elementos en la interfaz
    @IBOutlet weak var platosTableView: UITableView!
    var arregloPlato: [String] = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arregloPlato.append("Big Mac")
        arregloPlato.append("Royale with cheese")
        arregloPlato.append("Quarter Pounder")
        arregloPlato.append("Cheeseburger")
        arregloPlato.append("Angus deluxe")
        print("Los platos son: \(arregloPlato)")

        platosTableView.delegate = self
        platosTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloPlato.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellPlato")!
        cell.textLabel!.text = arregloPlato[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se ha seleccionado una  celda en la posicion : \(indexPath.row)")
        self.performSegue(withIdentifier: "GoToDetallePlato", sender: arregloPlato[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GoToDetallePlato"
        {
            let controladorDestino = segue.destination as! DetallePlatoViewController
            controladorDestino.textoTitulo = sender as? String
            print("ENTRANDO")
            
        }
    }

    

    
}

