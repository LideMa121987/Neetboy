//
//  RecommandViewController.m
//  Neetboy
//
//  Created by lide on 14-3-21.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "RecommandViewController.h"
#import "GridView.h"

@interface RecommandViewController ()

@end

@implementation RecommandViewController

@synthesize homeViewController = _homeViewController;

- (id)init
{
    self = [super init];
    if(self != nil)
    {
        _itemArray = [[NSMutableArray alloc] initWithCapacity:0];
        for(NSUInteger i = 0; i < 40; i++)
        {
            CGSize size = CGSizeMake(100, 80 + rand() % 5 * 10);
            [_itemArray addObject:NSStringFromCGSize(size)];
        }
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    _titleLabel.text = @"Recommand";

    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - 49);
    
    _gridView = [[SMGridView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height, 320, self.view.frame.size.height - _adjustView.frame.size.height)];
    _gridView.vertical = YES;
    _gridView.numberOfRows = 3;
    _gridView.padding = 5;
    _gridView.dataSource = self;
    _gridView.gridDelegate = self;
    [self.view addSubview:_gridView];
    [_gridView reloadData];
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - SMGridViewDataSource

- (NSInteger)smGridView:(SMGridView *)gridView numberOfItemsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (CGSize)smGridView:(SMGridView *)gridView sizeForIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeFromString([_itemArray objectAtIndex:indexPath.row]);
}

- (UIView *)smGridView:(SMGridView *)gridView viewForIndexPath:(NSIndexPath *)indexPath
{
    GridView *view = (GridView *)[gridView dequeReusableViewOfClass:[GridView class]];
    if(view == nil)
    {
        view = [[GridView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.borderWidth = 1.0;
        view.layer.borderColor = [UIColor darkGrayColor].CGColor;
    }
    
    CGSize size = CGSizeFromString([_itemArray objectAtIndex:indexPath.row]);
    view.frame = CGRectMake(0, 0, size.width, size.height);
    
    return view;
}

@end
