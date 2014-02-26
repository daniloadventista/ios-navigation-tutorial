//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class PalavraShared;
@class Palavra;

@interface LetraAViewController : UIViewController
{
    NSMutableArray *dados;
    NSMutableDictionary  *sections;
    PalavraShared *palavraShared;
}
@property NSMutableArray *dados;
@property NSMutableDictionary  *sections;
@property (nonatomic, strong) PalavraShared *palavraShared;


@end
