//
//  Palavra.h
//  TableJoaquim
//
//  Created by Danilo Lira de Lima on 18/02/14.
//  Copyright (c) 2014 danilo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palavra : NSObject

{
    NSString *string;
}
@property NSString *string;


-(Palavra*) initWithPalavra: (NSString *)string;
-(NSString*)primeiraLetraPalavra;



@end
