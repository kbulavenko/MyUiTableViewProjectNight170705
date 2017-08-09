//
//  EventEditViewController.m
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 02.08.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "EventEditViewController.h"
#import "Event.h"
#import "Events.h"

@interface EventEditViewController ()

@end

@implementation EventEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"EventEditViewController viewDidLoad  ");
    // Do any additional setup after loading the view from its nib.
    Event    *currentEvent  = [[Events defaultCollection]   eventAtIndex: self->_indexOfEvent];
    
    
 //   NSLog(@"currentEvent =%@", currentEvent);
 //   NSLog(@"self.view = %@", self.view);
   // self->_eventTimeTextField.text          = currentEvent.time.copy;
    self->_eventDatePicker.date             = currentEvent.date.copy;
    self->_eventShortInfoTextField.text     = currentEvent.shortInfo.copy;
    self->_eventDetailInfoTextField.text    = currentEvent.detailInfo.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    
    NSLog(@"EventEditViewController  prepareForSegue ");
    
    EventEditViewController     *eventEditViewControllerExemplar    =  segue.sourceViewController;
    NSLog(@"%@", eventEditViewControllerExemplar);
    Event     *changedEvent  =  [[Event alloc]   initWithShortInfo: self.eventShortInfoTextField.text andDetailInfo:self.eventDetailInfoTextField.text];
    changedEvent.date   = self.eventDatePicker.date.copy;
    [changedEvent  timeStringFromDateFormat];
    NSLog(@"changedEvent = %@", changedEvent);
    [[Events defaultCollection] replaceEventAtIndex: self.indexOfEvent byEvent: changedEvent];
    // Pass the selected object to the new view controller.
}


- (void) didMoveToParentViewController:(UIViewController *)parent {
    NSLog(@"didMoveToParentViewController");
    Event     *changedEvent  =  [[Event alloc]   initWithShortInfo: self.eventShortInfoTextField.text andDetailInfo:self.eventDetailInfoTextField.text];
    changedEvent.date   = self.eventDatePicker.date.copy;
    [changedEvent  timeStringFromDateFormat];
    NSLog(@"changedEvent = %@", changedEvent);
    [[Events defaultCollection] replaceEventAtIndex: self.indexOfEvent byEvent: changedEvent];
    NSLog(@"%@", [[Events defaultCollection]  allEvents]);
}


@end
