//
//  Event.m
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 09.07.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "Event.h"

@implementation Event


- (instancetype)initWithShortInfo: (NSString *) si andDetailInfo:  (NSString *) di
{
    self = [super init];
    if (self) {
        self->_date   =   [NSDate   date];
        NSDateFormatter  *formatter   =  [NSDateFormatter  new];
        [formatter      setDateFormat: @"YYYY:MM:dd HH:mm:ss"];
        self->_time   =  [formatter   stringFromDate:  self->_date];
        self->_shortInfo   = si.copy;
        self->_detailInfo  = di.copy;
        
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"date:%@ info:%@ detail:%@",self.time, self.shortInfo, self.detailInfo ];
}

- (void)timeStringFromDateFormat
{
    NSDateFormatter  *formatter   =  [NSDateFormatter  new];
    [formatter      setDateFormat: @"YYYY:MM:dd HH:mm:ss"];
    self.time   =  [formatter   stringFromDate:  self.date];
}


@end
