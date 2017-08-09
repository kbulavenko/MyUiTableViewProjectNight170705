//
//  Events.m
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 06.07.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "Events.h"

@implementation Events


+ (instancetype)defaultCollection {
    static    Events   *defaultCollection  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultCollection   =  [[Events   alloc]  initPrivate];
        
    });
    return defaultCollection;
}


- (instancetype)  initPrivate {
    self = [super init];
    if (self) {
        self->_collection   = [NSMutableArray<Event *>   array];
        self->_readWriteQueue    =  dispatch_queue_create("com.KonstantinBulavenko.MyUiTableViewProjectNight170705.Events", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}


 //   Синхронное добавление  события, чтение не выполняется
//   Synchrounous event adding, reading stopped
- (void)addEvent: (Event *) event {
    if(event)
    {
        dispatch_barrier_async(self.readWriteQueue, ^{
            [self->_collection  addObject: event];
        });
    }
}


//   Синхронное удаление события, чтение не выполняется
//   Synchrounous event removing, reading stopped

- (void)removeEventAtIndex:  (NSUInteger ) index {
    if(self->_collection.count > 0)
    {
        dispatch_barrier_async(self.readWriteQueue, ^{
            [self->_collection  removeObjectAtIndex: index];
        });
    }
}
// Синхронная замена события по индексу , чтение не выполняется
//   Synchrounous event replacing, reading stopped

- (void)replaceEventAtIndex: (NSUInteger) index  byEvent: (Event*) event {
    if(self->_collection.count > 0 && index < self->_collection.count && event)
    {
        dispatch_barrier_async(self.readWriteQueue, ^{
            [self->_collection  replaceObjectAtIndex:index withObject:event ];
            NSArray      *sortedArray  =  [self->_collection  sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                Event    *event1  = obj1;
                Event    *event2  = obj2;
                NSDate    *date1  = event1.date.copy;
                NSDate    *date2  = event2.date.copy;
                return  [date1 compare: date2];
            }];
            self->_collection   = [NSMutableArray<Event *>   arrayWithArray: sortedArray];
        });
    }
}

// Параллельное чтение
// Parallel reading
- (Event *)eventAtIndex: (NSUInteger) index  {
    __block Event      *event  ;
    dispatch_sync(self->_readWriteQueue, ^{
        event = [self->_collection objectAtIndex: index];
    });
    return event;
}

// Параллельное чтение
// Parallel reading
- (NSArray<Event *> *)allEvents {
    __block    NSArray<Event *>   *array;
    dispatch_sync(self->_readWriteQueue,^{
        array   =  [NSArray arrayWithArray: self->_collection];
    });
    return array;
}

// Параллельное чтение
// Parallel reading
- (NSUInteger)allEventsCount  {
    __block    NSUInteger   count;
    dispatch_sync(self->_readWriteQueue,^{
        count   =  [NSArray arrayWithArray: self->_collection].count;
    });
    return count;
}





@end
