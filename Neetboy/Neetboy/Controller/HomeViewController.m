//
//  HomeViewController.m
//  Neetboy
//
//  Created by lide on 14-3-20.
//  Copyright (c) 2014年 lide. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - private

- (void)clickRecommandButton:(id)sender
{
    [self.view addSubview:_recommandVC.view];
}

- (void)clickSpecialButton:(id)sender
{
    [self.view addSubview:_specialVC.view];
}

- (void)clickFavouriteButton:(id)sender
{
    [self.view addSubview:_favouriteVC.view];
}

#pragma mark - super

- (id)init
{
    self = [super init];
    if(self != nil)
    {
        
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
//    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    _tableView.backgroundColor = [UIColor whiteColor];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    _tableView.showsVerticalScrollIndicator = NO;
//    [self.view addSubview:_tableView];
//    
//    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
//    _scrollView.backgroundColor = [UIColor cyanColor];
//    _scrollView.contentSize = CGSizeMake(320, 400);
//    _scrollView.delegate = self;
//    _tableView.tableHeaderView = _scrollView;
//    _scrollView.scrollEnabled = NO;
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _scrollView.contentSize.width, _scrollView.contentSize.height)];
//    label.numberOfLines = 0;
//    label.text = @"orange range -*～アスタリスク～\n作詞:orange range\n作曲:orange range\n\n见上げた夜空の星达の光\n古の思い愿いが时代を超えいろあせるコトなく届く\nキラリ瞳に映る谁かの叫び 风に想いを\n月に愿いを 力ある限り生きてくんだ 今日も\n仆らの想いもいつか谁かの胸に\n光り続けよう あの星のように\n\n一つ二つ钟の音は响く心の中へと広く深く\n物语のような星の雫 その中に细い线路を筑く\n时间とともに时代は动く 流れる星は静かに动く\n目を闭じて耳をすませば GOOD BYE\n\n大空いっぱいの白黒写真 なびくマフラー 白い息\n少しでも近づきたくて あの高台まで 駆け足で\n重たい望远镜 取り出すと\nレンズはみだしたスターダスト\n时间を夺われた时间 时代を越えてくるロマン\n\n放て光 负けずにしっかり今 时を越え\n谁かに届くまで 栄光の光はこの向こうにキミたちと\nつくっていくストーリー\n\n见上げた夜空の星达の光\n古の思い愿いが时代を超えいろあせるコトなく届く\nキラリ瞳に映る谁かの叫び 风に想いを\n月に愿いを 力ある限り生きてくんだ 今日も\n仆らの想いもいつか谁かの胸に\n光り続けよう あの星のように\n\n产声上げた 小さな光 大きな光\n时空を超え出逢い\nすべての辉きがひとつとなり 作り出す物语\n点と点を结ぶ星座のように 谁かにとって\n仆らもきれいな絵 描けてたらいいね\n见上げてごらんよ ほら 冬のダイヤモンド\nゆるやかな天の川 すぐ勇気取り戻せるから\n\n放て光 负けずにしっかり今\n时を越え 谁かに届くまで\n栄光の光はこの向こうに\nキミたちとつくっていくストーリー\n\n见上げた夜空の星达の光\n古の思い愿いが时代を超えいろあせるコトなく届く\nキラリ瞳に映る谁かの叫び 风に想いを\n月に愿いを 力ある限り生きてくんだ 今日も\n仆らの想いもいつか谁かの胸に\n光り続けよう あの星のように\n\nこの空は一つ どこまでも広く そう\n海の向こう 今生まれる息吹 绝たれる命\n星は照らす 女神のごとく\n长く続く 缲り返す 春夏秋冬の\n一瞬でもいい 少しでいい 思いを刻む\nただ果てなく 时を越え 辉きだす\n\n物语は心の中で続いている\nあの日の君はいつか夜汽车に乗って\n\n见上げた夜空の星达の光\n古の思い愿いが时代を超えいろあせるコトなく届く\nキラリ瞳に映る谁かの叫び 风に想いを\n月に愿いを 力ある限り生きてくんだ 今日も\n见上げた夜空の星达の光\n古の想い愿いが时代を超えいろあせるコトなく届く\n仆らの想いもいつか谁かの胸に\n光り続けよう あの星のように\n\n光り続けよう あの星のように";
//    [_scrollView addSubview:label];
    
    _footView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 49, 320, 49)];
    _footView.backgroundColor = [UIColor whiteColor];
    _footView.layer.borderWidth = 1.0;
    _footView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_footView];
    
    _recommandButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _recommandButton.frame = CGRectMake(2, 2, 104, 45);
    _recommandButton.layer.borderWidth = 1.0;
    _recommandButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _recommandButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_recommandButton setTitle:@"Recommand" forState:UIControlStateNormal];
    [_recommandButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_recommandButton addTarget:self action:@selector(clickRecommandButton:) forControlEvents:UIControlEventTouchUpInside];
    [_footView addSubview:_recommandButton];
    
    _specialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _specialButton.frame = CGRectMake(108, 2, 104, 45);
    _specialButton.layer.borderWidth = 1.0;
    _specialButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _specialButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_specialButton setTitle:@"Special" forState:UIControlStateNormal];
    [_specialButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_specialButton addTarget:self action:@selector(clickSpecialButton:) forControlEvents:UIControlEventTouchUpInside];
    [_footView addSubview:_specialButton];
    
    _favouriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _favouriteButton.frame = CGRectMake(214, 2, 104, 45);
    _favouriteButton.layer.borderWidth = 1.0;
    _favouriteButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _favouriteButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_favouriteButton setTitle:@"Favourite" forState:UIControlStateNormal];
    [_favouriteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_favouriteButton addTarget:self action:@selector(clickFavouriteButton:) forControlEvents:UIControlEventTouchUpInside];
    [_footView addSubview:_favouriteButton];
    
    _recommandVC = [[RecommandViewController alloc] init];
    _recommandVC.homeViewController = self;
    [self.view addSubview:_recommandVC.view];
    
    _specialVC = [[SpecialViewController alloc] init];
    _specialVC.homeViewController = self;
    
    _favouriteVC = [[FavouriteViewController alloc] init];
    _favouriteVC.homeViewController = self;
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

#pragma mark - UIScrollViewDelegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if([scrollView isEqual:_tableView])
//    {
//        CGFloat offsetY = _tableView.contentOffset.y;
//        if(_scrollView.contentOffset.y + offsetY < 0)
//        {
//            [_scrollView setContentOffset:CGPointZero];
//        }
//        else if(_scrollView.contentOffset.y + offsetY > _scrollView.contentSize.height - _scrollView.frame.size.height)
//        {
//            [_scrollView setContentOffset:CGPointMake(0, _scrollView.contentSize.height - _scrollView.frame.size.height)];
//        }
//        else
//        {
//            [_scrollView setContentOffset:CGPointMake(0, _scrollView.contentOffset.y + offsetY)];
//            [_tableView setContentOffset:CGPointZero];
//        }
//    }
//    
////    NSLog(@"%lf_%lf", _scrollView.contentOffset.y, _tableView.contentOffset.y);
//}
//
//#pragma mark - UITableViewDataSource
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 20;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewControllerIdentifier"];
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeViewControllerIdentifier"];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%i", (int)indexPath.row];
//    
//    return cell;
//}

@end
