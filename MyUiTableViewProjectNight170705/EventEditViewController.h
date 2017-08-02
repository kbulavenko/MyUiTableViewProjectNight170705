//
//  EventEditViewController.h
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 02.08.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *eventTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDetailLabel;

@property (weak, nonatomic) IBOutlet UITextField *eventTimeTextField;

@property (weak, nonatomic) IBOutlet UITextField *eventShortInfoTextField;

@property (weak, nonatomic) IBOutlet UITextField *eventDetailInfoTextField;

@property   (assign, nonatomic)  NSInteger   indexOfEvent;

@end
