//
//  LoginViewController.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/21.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "LoginViewController.h"
#import "Util.h"
#import "User.h"
#import "SqliteServie.h"
#import "ServiceTable.h"
@interface LoginViewController ()<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *mainscroller;
@property (strong, nonatomic) IBOutlet UIView *usernamebg;
@property (strong, nonatomic) IBOutlet UIView *pwdbg;
@property (strong, nonatomic) IBOutlet UIButton *loginbtn;
@property (strong, nonatomic) IBOutlet UITextField *username;

@property (strong, nonatomic) IBOutlet UITextField *pwd;

@end

@implementation LoginViewController
- (IBAction)showSetServerView:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"配置服务器地址" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"配置", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *serverTF = [alert textFieldAtIndex:0];
    serverTF.text = [Util getServerIp];
    [alert show];
}

- (IBAction)hidekeyboard:(id)sender {
    [_username resignFirstResponder];
    [_pwd resignFirstResponder];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField *serverTF = [alertView textFieldAtIndex:0];
    NSString *serverIP = serverTF.text;
    [serverTF resignFirstResponder];
    if (buttonIndex == 1) {
        [Util setServerIp:serverIP];
    }
}
- (IBAction)getDataFromServer:(id)sender {
    NSString *serverip = [Util getServerIp];
    if (serverip.length==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请先配置服务器地址" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        [Util startLoading:self.view];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 10;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain", @"text/html",nil];
        [manager POST:[NSString stringWithFormat:@"%@:8090/Service.asmx/GetUsers",serverip] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSLog(@"%@",responseObject);
           
            [[SqliteServie getInstance] removeClassWith:[User class]];
            NSMutableArray *insertarray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in responseObject) {
                User *user = [[User alloc] initWithDict:dict];
                [insertarray addObject:[Util getInsertStringWithObject:user]];
            }
            [[SqliteServie getInstance] execInsertTransactionSql:insertarray];
             [Util stopLoading:self.view];
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [Util stopLoading:self.view];
        }];
    
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginbtn.layer.cornerRadius = 5.0;
    _loginbtn.layer.masksToBounds = YES;
    _usernamebg.layer.cornerRadius = 5.0;
    _usernamebg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _usernamebg.layer.borderWidth = 0.5;
    _usernamebg.layer.masksToBounds = YES;
    _pwdbg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _pwdbg.layer.borderWidth = 0.5;
    _pwdbg.layer.cornerRadius = 5.0;
    _pwdbg.layer.masksToBounds = YES;
    [_loginbtn setBackgroundImage:[Util createImageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doLogin:(id)sender {
    [self hidekeyboard:nil];
    if ( [[SqliteServie getInstance] checkUserinfoWithUsername:_username.text :_pwd.text]) {
        NSLog(@"login success");
        [self performSegueWithIdentifier:@"pushToMain" sender:self];
    }
    else{
        NSLog(@"login fail");
    }
   
    
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
