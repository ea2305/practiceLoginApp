//
//  ViewController.h
//  FirstLogin
//
//  Created by Elihu Alejandro Cruz Albores on 1/29/17.
//  Copyright © 2017 Elihu Alejandro Cruz Albores. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    /*
        Declaracion de campos de texto
        Llamada de elementos via IBOutlet
        type : TextField : pointer
     */
    
    IBOutlet UITextField *correo;
    IBOutlet UITextField *clave;
    
    /*
        Componenete de boton
        Inicio de sesio
        type : Button : pointer
     */
    IBOutlet UIButton *iniciarSesion;
    
    /*
        Boton para referencia de registro
        por si el man no esta registrado
        type : Button : pointer
     */
    IBOutlet UIButton *registrar;
    
    
    
}

/*
    Funcion de inicio de sesion
    params: event
 */
- (IBAction)iniciarSesion:(id)sender;

/*
    Registro de man en Defaultelements
    params: event
 */
-(IBAction)registrar:(id)sender;


@end

