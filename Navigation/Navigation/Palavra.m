//
//  Palavra.m
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 18/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import "Palavra.h"



@implementation Palavra
@synthesize string;


-(Palavra*) initWithPalavra: (NSString *)stringE{
    //chamando nsobject
    self = [super init];
    
    if (self)
    {
        string = stringE;
    }
    return self;
}

-(NSString*)primeiraLetraPalavra{
    return [[[self string] substringToIndex:1] capitalizedString];
}
    
@end
