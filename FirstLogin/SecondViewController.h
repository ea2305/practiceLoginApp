//
//  SecondViewController.h
//  FirstLogin
//
//  Created by Elihu Alejandro Cruz Albores on 1/29/17.
//  Copyright © 2017 Elihu Alejandro Cruz Albores. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{

    
    IBOutlet UITableView *myTableView;
    NSMutableArray *myData;
    
}

@end
