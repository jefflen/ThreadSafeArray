//
//  ThreadSafeArray.h
//  ThreadSafeArray
//
//  Created by Hungju Lu on 06/12/2016.
//  Copyright © 2016 Hungju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadSafeArray : NSObject

- (NSArray *)getArray;

- (void)addObject:(id)object;

- (void)removeObject:(id)object;

@end
