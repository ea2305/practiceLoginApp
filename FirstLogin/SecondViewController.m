//
//  SecondViewController.m
//  FirstLogin
//
//  Created by Elihu Alejandro Cruz Albores on 1/29/17.
//  Copyright © 2017 Elihu Alejandro Cruz Albores. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //DATOS DE USUARIOS
    NSUserDefaults *guardado = [NSUserDefaults standardUserDefaults];
    
    // table view data is being set here
    
    
    
     myData = [guardado objectForKey:@"correos"];
    /* 
     myData = [[NSMutableArray alloc]initWithObjects:
     @"Data 1 in array",@"Data 2 in array",@"Data 3 in array",
     @"Data 4 in array",@"Data 5 in array",@"Data 5 in array",
     @"Data 6 in array",@"Data 7 in array",@"Data 8 in array",
     @"Data 9 in array", nil];
     */
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section{
    return [myData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *stringForCell;
    if (indexPath.section == 0) {
        stringForCell= [myData objectAtIndex:indexPath.row];
        
    }
    else if (indexPath.section == 1){
        stringForCell= [myData objectAtIndex:indexPath.row+ [myData count]/2];
        
    }
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    
    return @"Usuarios registrados";
}


@end
