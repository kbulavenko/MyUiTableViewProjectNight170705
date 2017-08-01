//
//  Events.h
//  MyUiTableViewProjectNight170705
//
//  Created by Z on 06.07.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"


@interface Events : NSObject

@property (strong, atomic)  NSMutableArray<Event *>     *collection;
@property  (strong, nonatomic)   dispatch_queue_t   readWriteQueue;

- (instancetype)init  UNAVAILABLE_ATTRIBUTE;

+ (instancetype)defaultCollection;

- (void)addEvent: (Event *) event;                              //   Синхронное добавление  события, чтение не выполняется
- (void)removeEventAtIndex:  (NSUInteger ) index;               //   Синхронное удаление события, чтение не выполняется
- (void)replaceEventAtIndex: (NSUInteger) index  byEvent: (Event*) event;  // Синхронная замена события по индексу , чтение не выполняется
- (Event *)eventAtIndex: (NSUInteger) index;                                            // Параллельное чтение
- (NSMutableArray<Event *> *)allEvents;                             // Параллельное чтение
- (NSUInteger)allEventsCount;                             // Параллельное чтение

@end
