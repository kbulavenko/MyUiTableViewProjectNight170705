//
//  MyTableViewController.m
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 06.07.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem              = self.editButtonItem;
    self.eventsTableView.allowsSelectionDuringEditing   = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    
    NSInteger adjustment  =  [self isEditing]? 1 : 0;
    
    return [[Events defaultCollection] allEventsCount ]  + adjustment;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"eventsId" forIndexPath: indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]  initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: @"eventsId"];
    }
    if(indexPath.row >= [[Events defaultCollection] allEventsCount] && [self isEditing])   {
        cell.textLabel.text             = @"Add event";
        cell.detailTextLabel.text       = nil;
        //cell.imageView.image            = nil;
    }
    else {
        Event     *currentEvent  =[[Events  defaultCollection]   eventAtIndex: indexPath.row];
        
        cell.textLabel.text   =  [NSString    stringWithFormat:  @"%@ %@", currentEvent.time , currentEvent.shortInfo ];
        cell.detailTextLabel.text  =  currentEvent.detailInfo.copy;
    }
    
    // Configure the cell...
    
    return cell;
}

//  Добавляем возможность редактирования


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    if (editing) {
        
        [self.tableView beginUpdates];
        // ....
        [self.eventsTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow: [[Events defaultCollection] allEventsCount] inSection:0]] withRowAnimation: UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
        
    } else {
        
        [self.tableView beginUpdates];
        // ....
        [self.eventsTableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow: [[Events defaultCollection] allEventsCount] inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic ];
        [self.tableView endUpdates];
        
    }

}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[Events  defaultCollection]   removeEventAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
