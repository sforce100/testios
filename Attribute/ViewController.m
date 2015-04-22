//
//  ViewController.m
//  Attribute
//
//  Created by hzh on 15/4/21.
//  Copyright (c) 2015年 LittleFox. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName : @3,
                           NSStrokeColorAttributeName : self.outlineButton.tintColor}
                   range:NSMakeRange(0, title.length)];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self usePerferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(perferredFontsChange)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"HomeDetail"]) {
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]) {                  DetailViewController *detail = (DetailViewController *)segue.destinationViewController;
            detail.textContent = @"detail from home";
        }
    }
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"isNotHomeDetail"]) {
        return NO;
    }
    return YES;
}

-(void) perferredFontsChange:(NSNotification *)notification
{
    [self usePerferredFonts];
}


-(void) usePerferredFonts
{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (IBAction)changeSelectTextColorWithBackgroundColor:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}
- (IBAction)outlineBodySelect:(id)sender {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName : @-3, NSStrokeColorAttributeName : [UIColor blackColor]}
                                   range:self.body.selectedRange];
}

@end
