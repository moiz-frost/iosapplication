//
//  MainMenuSubViewViewController.m
//  Application
//
//  Created by Abdul Moiz on 20/04/2017.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import "MainMenuSubViewViewController.h"

@interface MainMenuSubViewViewController ()

@end

@implementation MainMenuSubViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"btn_left_nav_normal@2x" ofType:@"png"];
    
    UIImage *leftBtnImg = [[UIImage alloc] initWithContentsOfFile:path];
    UIBarButtonItem *leftNavBtn = [[UIBarButtonItem alloc]
                                   initWithImage:leftBtnImg
                                   style:UIBarStyleDefault
                                   target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = leftNavBtn;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
