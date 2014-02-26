//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"
#import "Palavra.h"
#import "PalavraShared.h"

@implementation LetraAViewController

@synthesize dados,sections,palavraShared;

-(void) viewDidLoad {
    [super viewDidLoad];
    
    palavraShared = PalavraShared.defaultStore;
    
    dados = palavraShared.allItems;
    //TODO sortear apenas uma vez
    
    sections = [[NSMutableDictionary alloc]init];
    
    NSLog(@"Dados ordenados:");
    for (Palavra *c in dados) {
        //contar contatos da secao
        NSMutableArray * sec = [sections objectForKey:[c primeiraLetraPalavra]];
        if (sec==nil) {
            NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:[NSArray arrayWithObject:c]];
            //            [sections setValue:arr forKey:[c primeiraLetraNome]];
            [sections setObject:arr forKey:[c primeiraLetraPalavra]];
        }else{
            [sec addObject:c];
        }
        NSLog(@"Palavra: %@", [c string]);
    }
    
    
//    palavraShared.indice
    NSArray * keys = [sections allKeys];
    
    NSArray * allkeys = [keys sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
        NSString *nome1 = obj1;
        NSString *nome2 = obj2;
        return [nome1 compare:nome2];
    }];

    
    NSString * titulo = [allkeys objectAtIndex:palavraShared.indice];
    
    self.title = titulo;
    
    int indice = palavraShared.indice;
    int numLetras = [[sections allKeys]count];
    
    if (indice<numLetras-1) {
        UIBarButtonItem *next = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
        self.navigationItem.rightBarButtonItem=next;
    }
    
    
    NSMutableArray * arr = [sections objectForKey:titulo];
    double incremento = 0;
    for (Palavra*p in arr) {

        UIButton *botao = [UIButton
                           buttonWithType:UIButtonTypeRoundedRect];
        [botao
         setTitle:p.string
         forState:UIControlStateNormal];
        //    [botao sizeToFit];
        //    <#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>
        botao.frame = CGRectMake(10.0, 70.0+incremento, 160.0, 40.0);
        botao.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
        [botao addTarget:self action:@selector(palavraFalada:) forControlEvents:UIControlEventTouchDown];
        
        [self.view addSubview:botao];
        incremento+=50.0;
    }
    
}

-(void)next:(id)sender {
    palavraShared = PalavraShared.defaultStore;
    int indice = palavraShared.indice;
    int numLetras = [[sections allKeys]count];
    
    
    if (indice<numLetras-1) {
        palavraShared.indice++;
        LetraAViewController *proximo = [[LetraAViewController alloc]
                                         initWithNibName:nil
                                         bundle:NULL];
        [self.navigationController pushViewController:proximo
                                             animated:YES];
    }
    
}
-(void)palavraFalada:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSString *titulo = [[button titleLabel]text];
    NSLog(@"%@",titulo);
    
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:titulo];
    [av speakUtterance:utterance];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSArray * keys = [sections allKeys];
    
    NSArray * allkeys = [keys sortedArrayWithOptions:0 usingComparator:^(NSString* obj1, NSString* obj2) {
        NSString *nome1 = obj1;
        NSString *nome2 = obj2;
        return [nome1 compare:nome2];
    }];
    
    int indiceDaView = [allkeys indexOfObject:self.title];
    
    if (indiceDaView<palavraShared.indice) {
        palavraShared.indice--;
    }
}

@end
