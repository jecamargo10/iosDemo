//
//  AppDelegate.swift
//  Pagando Ando
//
//  Created by Javier Camargo Urrego on 9/19/17.
//  Copyright © 2017 isis3510. All rights reserved.
//
import UIKit
import AFNetworking


var baseURL:URL = URL(string: "http://demo7931028.mockable.io/")!

let manager = AFHTTPSessionManager(baseURL: baseURL as URL!)


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    func applicationWillResignActive(_ application: UIApplication)
    {
        print("Por ejemplo acá me llego una llamada - Probar")
    }
    func applicationDidEnterBackground(_ application: UIApplication)
    {
        print("Acaba de entrar en Background")
    }
    func applicationWillEnterForeground(_ application: UIApplication)
    {
        print("La aplicación va a entrar a primer plano")
    }
    func applicationDidBecomeActive(_ application: UIApplication)
    {
        print("La aplicación nuevamente esta en estado activo")
    }
    func applicationWillTerminate(_ application: UIApplication)
    {
        print("La aplicación va a terminar su ejecución")
    }
    
}



