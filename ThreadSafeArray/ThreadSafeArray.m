//
//  ThreadSafeArray.m
//  ThreadSafeArray
//
//  Created by Hungju Lu on 06/12/2016.
//  Copyright © 2016 Hungju. All rights reserved.
//

#import "ThreadSafeArray.h"

@interface ThreadSafeArray ()
@property (atomic, copy) NSMutableArray *cache;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation ThreadSafeArray

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = dispatch_queue_create("Array Acccessing Queue", nil);
        _cache = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)getArray {
    __block NSArray *returnVal = nil;
    dispatch_sync(self.queue, ^{
        returnVal = [NSArray arrayWithArray:self.cache];
    });
    return returnVal;
}

- (void)addObject:(id)object {
    __weak id weakObject = object;
    dispatch_sync(self.queue, ^{
        __strong id strongObject = weakObject;
        [_cache addObject:strongObject];
    });
}

- (void)removeObject:(id)object {
    __weak id weakObject = object;
    dispatch_sync(self.queue, ^{
        __strong id strongObject = weakObject;
        [_cache removeObject:strongObject];
    });
}

@end
