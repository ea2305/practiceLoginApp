//
//  ViewController.m
//  FirstLogin
//
//  Created by Elihu Alejandro Cruz Albores on 1/29/17.
//  Copyright © 2017 Elihu Alejandro Cruz Albores. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)iniciarSesion:(id)sender{
    
    //Obtenemos los datos del sistema
    NSUserDefaults *guardado = [NSUserDefaults standardUserDefaults];
    
    //Asignamos los datos para uso en APP
    NSMutableArray *correos = [guardado objectForKey:@"correos"];
    NSMutableArray *claves = [guardado objectForKey:@"claves"];
    
    /* Fase de pruebas de logica
    NSMutableArray *correos = [NSMutableArray array];
    NSMutableArray *claves = [NSMutableArray array];
    
    [correos addObject:@"mono"];
    [correos addObject:@"mono2"];
    [correos addObject:@"mono3"];
    
    [claves addObject:@"mono"];
    [claves addObject:@"mono2"];
    [claves addObject:@"mono3"];
    */
    
    BOOL existe = NO;
    
    for(int i = 0; i < [correos count]; i++){
        
        
        if([correos[i] isEqualToString:correo.text] && [claves[i] isEqualToString:clave.text]){
            existe = YES;
            break;
        }
        
    }
    
    
    //Verificacion de usuarios registrados
    NSString *mensaje;
    if(existe == YES){
        NSLog(@"Start to jump");
        [self performSegueWithIdentifier:@"secondView" sender:self];
    }else{
        mensaje = @"¿Quién sos?";
    }
    
    //Creamos alerta
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Inicio de sesión"
                                 message:mensaje
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction
                               actionWithTitle:@"Entiendo"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)registrar:(id)sender{
    
    BOOL espacios = NO;
    NSLog(@"Vamo a guardar\n");
    NSUserDefaults *guardado = [NSUserDefaults standardUserDefaults];
    
    
    //Nuevo buffer de datos
    
    NSMutableArray *correos = [NSMutableArray array];
    NSMutableArray *claves = [NSMutableArray array];
    
    //Obtenemos datos anteriores
    NSMutableArray *bak_correos = [guardado objectForKey:@"correos"];
    NSMutableArray *bak_claves = [guardado objectForKey:@"claves"];
    
    /*
     Clean data
     */
    
    //Agregamos los datos nuevamente a userDef
    /*
    [guardado setObject:[NSMutableArray arrayWithObjects:@"mail",@"mail2", nil] forKey:@"correos"];
    [guardado setObject:[NSMutableArray arrayWithObjects:@"pass",@"pass2", nil] forKey:@"claves"];
    */
    
    
    for (int i = 0; i < [bak_correos count]; i++) {
        
        NSLog(@"OOOOOOO __________");
        [correos addObject:bak_correos[i]];
        [claves addObject:bak_claves[i]];
        
    }
    
    if( ! [correo.text isEqualToString:@""]){
        //Agregamos nuevos datos
        [correos addObject:correo.text];
        
    }else{ espacios = YES; }
    
    if( ! [clave.text isEqualToString:@""]){
        //Agregamos nuevos datos
        [claves addObject:clave.text];
    }else{ espacios = YES; }
    
    //Agregamos los datos nuevamente a userDef
    [guardado setObject:correos forKey:@"correos"];
    [guardado setObject:claves forKey:@"claves"];
    
    
    if(espacios == NO){
        
        //Creamos alerta
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Ya estas papu!"
                                     message:@"Tus credenciales han sido agregadas"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"Arre !"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 //Handle no, thanks button
                             }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        //Creamos alerta de error
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Llena los campos man"
                                     message:@"No quieras hakiar el sistema"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"Arre !"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 //Handle no, thanks button
                             }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
