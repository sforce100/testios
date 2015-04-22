//
//  DetailViewController.m
//  Attribute
//
//  Created by hzh on 15/4/22.
//  Copyright (c) 2015年 LittleFox. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
//    [self updateUI];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) setTextContentFromHome:(NSAttributedString *) content
{
    _textContent = content;
    if (self.view.window) {
        [self updateUI];
    }
}

-(void) updateUI
{
    NSLog(@"data: %s", _textContent);
}

@end
