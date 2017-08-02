//
//  MyTableViewController.h
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 06.07.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"
#import "Event.h"

@interface EventsTableViewController<UITableViewDelegate, UITableViewDataSource> : UITableViewController


@property (strong, nonatomic) IBOutlet UITableView *eventsTableView;


@end
