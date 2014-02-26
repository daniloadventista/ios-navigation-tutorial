//
//  PalavraShared.m
//  Homepwner
//
//  Created by joeconway on 8/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PalavraShared.h"
#import "Palavra.h"


@implementation PalavraShared
@synthesize indice;

+ (PalavraShared *)defaultStore
{
    static PalavraShared *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init 
{
    self = [super init];
    if(self) {
        
        Palavra * p1 = [[Palavra alloc] initWithPalavra:@"Macarrão"];
        
        Palavra * p2 = [[Palavra alloc] initWithPalavra:@"Beterraba"];
        
        Palavra * p3 = [[Palavra alloc] initWithPalavra:@"Maçã"];
        
        Palavra * p4 = [[Palavra alloc] initWithPalavra:@"Cebola"];
        
        Palavra * p5 = [[Palavra alloc] initWithPalavra:@"Avião"];
        
        Palavra * p6 = [[Palavra alloc] initWithPalavra:@"Danilo"];
        
        Palavra * p7 = [[Palavra alloc] initWithPalavra:@"Danilo Lima"];
        
        Palavra * p8 = [[Palavra alloc] initWithPalavra:@"Elefante"];
        
        Palavra * p9 = [[Palavra alloc] initWithPalavra:@"Zebra"];
        
        allItems = [[NSMutableArray alloc] initWithArray: [NSArray arrayWithObjects:p1,p2,p3,p4,p5,p6,p7,p8,p9, nil]];
        
        [allItems sortWithOptions:0 usingComparator:^(Palavra* obj1, Palavra* obj2) {
            NSString *nome1 = obj1.string;
            NSString *nome2 = obj2.string;
            return [nome1 compare:nome2];
        }];
        
        indice = 0;
        
    }
    return self;
}

- (void)removeItem:(Palavra *)p
{
    [allItems removeObjectIdenticalTo:p];
}

- (NSMutableArray *)allItems
{
    return allItems;
}

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to
{
    if (from == to) {
        return;
    }
    // Obtem o objeto na posicao de destino, para memorizar em 'p'
    Palavra *p = [allItems objectAtIndex:from];

    // Remove o objeto da posicao destino
    [allItems removeObjectAtIndex:from];

    // Insere o objeto memorizado em 'p' na posicao destino
    [allItems insertObject:p atIndex:to];
}

- (void)addItem: (Palavra *)c;
{
    [allItems insertObject:c atIndex:0];
   
}
@end
