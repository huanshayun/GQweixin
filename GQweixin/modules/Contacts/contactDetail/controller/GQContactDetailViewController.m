//
//  GQContactDetailViewController.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  “联系人详细信息”页面的视图控制器

#import "GQContactDetailViewController.h"
#import "GQContactManage.h"
#import "Masonry.h"

#import "GQContactDetailBaseInfoCell.h"
#import "GQContactDetailTagsCell.h"
#import "GQContactDetailNormalTitleCell.h"
#import "GQContactDetailPhoneNumberCell.h"

@interface GQContactDetailViewController ()

//联系人微信id
@property (nonatomic, strong) NSString *userID;
//联系人数据模型
@property (nonatomic, strong) GQContact *contactModel;
//页面数据模型
@property (nonatomic, strong) NSMutableArray *sectionData;

@end

@implementation GQContactDetailViewController

//使用联系人id初始化
- (instancetype)initWithUserID:(NSString *)userID{
    if(self = [super init]){
        _userID = userID;
    }
    return self;
}

//使用联系人数据模型初始化
- (instancetype)initWithUserModel:(GQContact *)contactModel{
    if(self = [super init]){
        _userID = contactModel.userID;
        _contactModel = contactModel;
    }
    return self;
}

- (void)loadView{
    [super loadView];
    [self setTitle:@"详细信息"];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    /*
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(15, 0, 0, 0));
    }];
    */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataWithUserID:self.userID];  //加载联系人数据模型
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadDataWithUserID:(NSString *)userID{
    _contactModel = [[GQContactManage contactManage] getContactInfo:userID];
}

#pragma mark - Table view data source

//section数量（共有4个section，目前实现了前两个）
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

//每个section的item数目
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if(section == 0){//基本信息，仅有1个item
        return 1;
    }
    else if(section == 1){//标签和权限section
        if(self.contactModel.userDetail.phoneNumber.length > 0){//联系人有“手机号码”信息
            return 3;
        }
        else{
            return 2;
        }
    }
    return 1;
}

//设置tableviewcell的显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    
    //基本信息section
    if(section == 0){
        NSString *cellID = @"baseInfo";
        GQContactDetailBaseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if(!cell){
            cell = [[GQContactDetailBaseInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        [cell setContactModel:_contactModel];
        return cell;
    }
    //权限和标签section
    else if(section == 1){
        //备注和标签
        if(row == 0){
            //若此联系人有设置备注和标签信息，则显示这些标签
            if(self.contactModel.userDetail.tags.count > 0){
                NSString *cellID = @"tags";
                GQContactDetailTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
                if(!cell){
                    cell = [[GQContactDetailTagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                }
                [cell setTitleText:@"标签" tags:self.contactModel.userDetail.tags];
                return cell;
            }
            //否则仅显示“设置备注和标签”
            else{
                NSString *cellID = @"normalTitle";
                GQContactDetailNormalTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
                if(!cell){
                    cell = [[GQContactDetailNormalTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                }
                [cell setTitleText:@"设置备注和标签"];
                return cell;
            }
        }
        //显示”联系人权限“
        else if(row == 1){
            NSString *cellID = @"normalTitle";
            GQContactDetailNormalTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell){
                cell = [[GQContactDetailNormalTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            [cell setTitleText:@"朋友权限"];
            return cell;
        }
        //若联系人有”电话号码“信息，则显示
        else{
            NSString *cellID = @"phoneNumber";
            GQContactDetailPhoneNumberCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell){
                cell = [[GQContactDetailPhoneNumberCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            [cell setTitleText:@"电话号码" phoneNumber:self.contactModel.userDetail.phoneNumber];
            return cell;
        }
    }
    // Configure the cell
    return nil;
}

//设置各个section的cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;

    if(section == 0){
        CGFloat cellHeight = [GQContactDetailBaseInfoCell viewCellHeight];
        return cellHeight;
    }
    else{
        CGFloat cellHeight = [GQContactDetailNormalTitleCell viewCellHeight];
        return cellHeight;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
