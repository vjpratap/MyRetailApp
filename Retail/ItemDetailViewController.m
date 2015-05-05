//
//  ItemDetailViewController.m
//  Retail
//
//  Created by Vijay Pratap Singh on 30/04/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "ItemDetailViewController.h"

static NSDictionary *itemDetailsDictionary;

@interface ItemDetailViewController ()
{
 
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLable;
@property (weak, nonatomic) IBOutlet UIImageView *displeyImageView;

@end

@implementation ItemDetailViewController

+(void)initialize {
    itemDetailsDictionary = @{@"TV":
  @{@"title": @"Sony HD Television", @"price": @"Rs 12,000", @"description":@"This is an awesome TV", @"image":@"tv"},
                              @"AC":
                                  @{@"title": @"Samsung AC", @"price": @"Rs 15,000", @"description":@"This is an awesome AC", @"image":@"ac"},
                              @"Printer":
                                  @{@"title": @"HP printer", @"price": @"Rs 5,000", @"description":@"This is an awesome printer", @"image":@"printer"},
                              @"Sofa":
                                  @{@"title": @"Italiano Sofa", @"price": @"Rs 19,000", @"description":@"This is an awesome Sofa", @"image":@"sofa"},
                              @"Chair":
                                  @{@"title": @"Italiano Chair", @"price": @"Rs 4,000", @"description":@"This is an awesome chair", @"image":@"chair"},
                              @"T-shirt":
                                  @{@"title": @"SuperMan T-shirt", @"price": @"Rs 400", @"description":@"Feel like a Super Hero", @"image":@"t-shirt"},
                              @"Jeans":
                                  @{@"title": @"Jeans", @"price": @"Rs 800", @"description":@"Made for feel comfort", @"image":@"jeans"},
                              @"Cricket Bat":
                                  @{@"title": @"Cricket Bat", @"price": @"Rs 1,500", @"description":@"For playing good cricket", @"image":@"bat"},
                              @"Tennis Ball":
                                  @{@"title": @"Wilson tennis Ball", @"price": @"Rs 150", @"description":@"For playing good tennis", @"image":@"ball"}};
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *key = _selectedItem;
    _titleLabel.text = itemDetailsDictionary[key][@"title"];
    _priceLabel.text = itemDetailsDictionary[key][@"price"];
    _descriptionLable.text = itemDetailsDictionary[key][@"description"];
    _displeyImageView.image = [UIImage imageNamed:itemDetailsDictionary[key][@"image"]];
                                                    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AddToCart:(id)sender {
    NSString *previousString = [NSString stringWithFormat:@"%@",itemDetailsDictionary[_selectedItem]];
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/file.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSLog(@"File exists : %@", [fileManager fileExistsAtPath:@"my_file.txt"]? @"YES" : @"NO");
    if ([fileManager fileExistsAtPath:filePath] == NO) {
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
        NSLog(@"is creation in succeded");
    }
    NSData *dataBuffer;
    dataBuffer = [fileManager contentsAtPath:filePath];
    NSString *fileContent = [[NSString alloc]initWithBytes:[dataBuffer bytes] length:[dataBuffer length] encoding:NSUTF8StringEncoding];
//    NSLog(@"=======%@",fileContent);
    fileContent = [fileContent stringByAppendingString:previousString];
    
    NSError *error;
    
    [fileContent writeToFile:filePath atomically:NO encoding:NSUTF8StringEncoding error:&error];
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
