//
//  ViewController.m
//  FirstLogin
//
//  Created by Team ObjectiveC.
//  Copyright © 2017 Elihu Alejandro Cruz Albores. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)iniciarSesion:(id)sender{
    
    //Variable bandera para validacion de sesion
    BOOL existe = NO; // como boolean pero define constantes YES : NO
    
    /*
        Obtenemos los datos del sistema
        type : pointer
     */
    NSUserDefaults *guardado = [NSUserDefaults standardUserDefaults];
    
    /*
        Referencia de datos almacenados en app
        type : Mutable Array
     */
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
    
    
    //Loop basico para iteracion de elementos
    /*
        Equivalencia : array.length
        Array de elementos mutables : [MyArray count]
     */
    for(int i = 0; i < [correos count]; i++){
        
        //Verificamos si el usuario se encuentra registrado.
        if([correos[i] isEqualToString:correo.text] && [claves[i] isEqualToString:clave.text]){
            existe = YES;//Si lo esta cambiamos la bandera a verdadero
            break;//Salimos bruscamente
        }
        
    }
    
    
    //Verificacion de usuarios registrados    
    if(existe == YES){
        
        NSLog(@"Start to jump");//Impresion de pantalla para verificacion
        [self performSegueWithIdentifier:@"secondView" sender:self];
        
    }else{
        
        //Creamos alerta -> con opcion de salida
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Inicio de sesión"
                                     message:@"¿Quien sos?"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        //Creamos elemento para vista de alerta tipo boton
        UIAlertAction *ok = [UIAlertAction
                             actionWithTitle:@"Entiendo"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 //Acciones
                             }];
        
        [alert addAction:ok];//Agregamos componente a la alerta
        //Accion para salida de alerta
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
}

-(IBAction)registrar:(id)sender{
    
    //Verificacion de elementos vacios
    BOOL espacios = NO;
    
    //Log de verificacion
    NSLog(@"Vamo a guardar\n");
    
    //Obtencion de elementos alamacenados en el dispositivo
    //datos de usuarios.
    NSUserDefaults *guardado = [NSUserDefaults standardUserDefaults];
    
    
    //Nuevo buffer de datos
    NSMutableArray *correos = [NSMutableArray array];
    NSMutableArray *claves = [NSMutableArray array];
    
    //Obtenemos datos anteriores
    NSMutableArray *bak_correos = [guardado objectForKey:@"correos"];
    NSMutableArray *bak_claves = [guardado objectForKey:@"claves"];
    
    
    
    
    //Clean data :
    /*
        [guardado setObject:[NSMutableArray arrayWithObjects:@"mail",@"mail2", nil] forKey:@"correos"];
        [guardado setObject:[NSMutableArray arrayWithObjects:@"pass",@"pass2", nil] forKey:@"claves"];
    */
    
    //Agregamos los datos nuevamente a userDef
    for (int i = 0; i < [bak_correos count]; i++) {
        
        NSLog(@"::__::"); //Verificacion
        
        //Equivalente a push en arreglo mutable especial para xcode.
        [correos addObject:bak_correos[i]]; //Agregamos los elementos a correos
        [claves addObject:bak_claves[i]];//Vaciamos los elementos en contenedor
        
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
