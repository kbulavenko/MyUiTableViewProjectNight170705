//
//  EventsNavigationControllerDelegate.m
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 02.08.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "EventsNavigationControllerDelegate.h"
#import "EventsTableViewController.h"


@interface EventsNavigationControllerDelegate ()

@end

@implementation EventsNavigationControllerDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"willShowViewController    viewController: %@",viewController);
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated  {
    NSLog(@"didShowViewController    viewController: %@",viewController);
    if([viewController   isKindOfClass: [EventsTableViewController class]])
    {
        EventsTableViewController      *etvc  =  (EventsTableViewController *)  viewController;
        [etvc.tableView  reloadData];
    }
}


@end
