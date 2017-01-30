//
//  ViewController.h
//  FirstLogin
//
//  Created by Elihu Alejandro Cruz Albores on 1/29/17.
//  Copyright © 2017 Elihu Alejandro Cruz Albores. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    //Declaracion de campos de texto
    IBOutlet UITextField *correo;
    IBOutlet UITextField *clave;
    
    //Inicio de sesion
    IBOutlet UIButton *iniciarSesion;
    
    //No estar registrado el men :v
    IBOutlet UIButton *registrar;
    
    
    
}

- (IBAction)iniciarSesion:(id)sender;

-(IBAction)registrar:(id)sender;


@end

