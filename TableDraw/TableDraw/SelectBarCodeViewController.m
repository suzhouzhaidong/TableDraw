//
//  SelectBarCodeViewController.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "SelectBarCodeViewController.h"

@interface SelectBarCodeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *searchbtn;

@property (strong, nonatomic) IBOutlet UIView *codebg;
@property (strong, nonatomic) IBOutlet UITextField *code;
@end

@implementation SelectBarCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _codebg.layer.cornerRadius = 5.0;
    _codebg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _codebg.layer.borderWidth = 0.5;
    _codebg.layer.masksToBounds = YES;
    [_searchbtn setBackgroundImage:[Util createImageWithColor:[UIColor greenColor]] forState:UIControlStateNormal];
    _searchbtn.layer.cornerRadius = 5.0;
    _searchbtn.layer.masksToBounds = YES;
    // Do any additional setup after loading the view.
}
- (IBAction)showscanner:(id)sender {
}
- (IBAction)search:(id)sender {
    [self performSegueWithIdentifier:@"goToTableList" sender:self];
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
