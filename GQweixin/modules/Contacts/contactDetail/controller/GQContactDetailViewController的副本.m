//
//  GQContactDetailViewController.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/23.
//
//

#import "GQContactDetailViewController.h"
#import "GQContactManage.h"
#import "Masonry.h"

#import "GQContactDetailBaseInfoCell.h"
#import "GQContactDetailTagsCell.h"
#import "GQContactDetailNormalTitleCell.h"
#import "GQContactDetailPhoneNumberCell.h"

@interface GQContactDetailViewController ()

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) GQContact *contactModel;
@property (nonatomic, strong) NSMutableArray *sectionData;

@end

@implementation GQContactDetailViewController

- (instancetype)initWithUserID:(NSString *)userID{
    //UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //layout.minimumLineSpacing = 5;
    //layout.minimumInteritemSpacing = 5;
    //layout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
    //layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    if(self = [super init]){
        _userID = userID;
    }
    return self;
}

- (instancetype)initWithUserModel:(GQContact *)contactModel{
    //UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //layout.minimumLineSpacing = 10;
    //layout.minimumInteritemSpacing = 5;
    //layout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
    //layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    if(self = [super init]){
        _userID = contactModel.userID;
        _contactModel = contactModel;
    }
    return self;
}
- (void)loadView{
    [super loadView];
    [self setTitle:@"详细信息"];
    //[self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    /*
    [self.collectionView registerClass:[GQContactDetailBaseInfoCell class] forCellWithReuseIdentifier:@"baseInfo"];
    [self.collectionView registerClass:[GQContactDetailTagsCell class] forCellWithReuseIdentifier:@"tags"];
    [self.collectionView registerClass:[GQContactDetailNormalTitleCell class] forCellWithReuseIdentifier:@"normalTitle"];
    [self.collectionView registerClass:[GQContactDetailPhoneNumberCell class] forCellWithReuseIdentifier:@"phoneNumber"];
    */
    [self loadDataWithUserID:self.userID];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)loadDataWithUserID:(NSString *)userID{
    _contactModel = [[GQContactManage contactManage] getContactInfo:userID];
    [self loadUIWithContactModel:_contactModel];
}

- (void)loadUIWithContactModel:(GQContact *)contactModel{
    NSArray *baseInfo = [NSArray arrayWithObjects:contactModel.userIcon, contactModel.showName, contactModel.userName, contactModel.userID, contactModel.userDetail.location, nil];
    
    NSMutableArray *customInfo = [[NSMutableArray alloc] init];
    if(contactModel.userDetail.phoneNumber.length > 0){
        [customInfo addObject:contactModel.userDetail.phoneNumber];
    }
    
}

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    #warning Incomplete implementation, return the number of sections
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    #warning Incomplete implementation, return the number of items
    if(section == 0){
        return 1;
    }
    else if(section == 1){
        if(self.contactModel.userDetail.phoneNumber.length > 0){
            return 3;
        }
        else{
            return 2;
        }
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    
    if(section == 0){
        NSString *cellID = @"baseInfo";
        GQContactDetailBaseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if(!cell){
            cell = [[GQContactDetailBaseInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        [cell setContactModel:_contactModel];
        return cell;
    }
    else if(section == 1){ //section==1
        if(row == 0){
            if(self.contactModel.userDetail.tags.count > 0){
                NSString *cellID = @"tags";
                GQContactDetailTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
                if(!cell){
                    cell = [[GQContactDetailTagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                }
                [cell setTitleText:@"标签" tags:self.contactModel.userDetail.tags];
                return cell;
            }
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
        else if(row == 1){
            NSString *cellID = @"normalTitle";
            GQContactDetailNormalTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell){
                cell = [[GQContactDetailNormalTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            [cell setTitleText:@"朋友权限"];
            return cell;
        }
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

#pragma mark <UITableViewDelegate>
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
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *margin = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 15)];
    margin.backgroundColor = [UIColor clearColor];
    return margin;
}
*/
@end
