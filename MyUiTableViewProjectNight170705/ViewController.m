//
//  ViewController.m
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 05.07.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [Events defaultCollection];
    
    self->_myTableVC   = [EventsTableViewController  new];
    
    self->_myTableVC.eventsTableView.dataSource    = self->_myTableVC;
    self->_myTableVC.eventsTableView.delegate      = self->_myTableVC;
   // self->_MyTableView.dataSource   = self->_myTableVC;
  //  self->_MyTableView.delegate     = self->_myTableVC;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
