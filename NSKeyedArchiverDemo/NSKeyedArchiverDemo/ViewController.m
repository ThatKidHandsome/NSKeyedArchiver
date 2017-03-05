//
//  ViewController.m
//  NSKeyedArchiverDemo
//
//  Created by 韩锐 on 17/3/4.
//  Copyright © 2017年 HanRui. All rights reserved.
//

#import "ViewController.h"
#import "OAuthTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *takeButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//存储
- (IBAction)save:(id)sender {
    OAuth *oAuth = [OAuthTool OAuth];
    oAuth.name = @"小明";
    oAuth.age = @"15";
    [OAuthTool saveOAuth:oAuth];
}
//取数据
- (IBAction)take:(id)sender {
    OAuth *oAuth = [OAuthTool OAuth];
    NSLog(@"name=%@age=%@",oAuth.name,oAuth.age);
}
//删除
- (IBAction)delete:(id)sender {
    [OAuthTool logOut];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
