//
//  PalavraShared.h
//  Homepwner
//
//  Created by joeconway on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Palavra;

@interface PalavraShared : NSObject
{
    NSMutableArray *allItems;
    NSIndexPath * indexPath;
    int indice;
}
@property int indice;

+ (PalavraShared *)defaultStore;

- (void)removeItem:(Palavra *)c;

- (NSMutableArray *)allItems;

- (void)addItem: (Palavra *)c;

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;

@end
