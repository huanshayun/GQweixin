//
//  GQContactDetailBaseInfoCellCollectionViewCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/23.
//
//  显示联系人的基本信息

#import "GQContactDetailBaseInfoCell.h"
#import "Masonry.h"

#define SPACE_X 14.0f
#define SPACE_Y 12.0f

@interface GQContactDetailBaseInfoCell()

//头像显示
@property (nonatomic, strong) UIButton *iconImage;
//展示名显示
@property (nonatomic, strong) UILabel *showName;
//用户id显示
@property (nonatomic, strong) UILabel *userID;
//位置信息显示
@property (nonatomic, strong) UILabel *location;
//昵称显示
@property (nonatomic, strong) UILabel *userName;

@end

@implementation GQContactDetailBaseInfoCell

//行高
+(CGFloat)viewCellHeight{
    return 130.0f;
}

//初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

//保存联系人基本信息
-(void)setContactModel:(GQContact *)contactModel{
    _contactModel = contactModel;
    [self.iconImage setImage:[UIImage imageNamed:contactModel.userIcon] forState:UIControlStateNormal];
    [self.showName setText:contactModel.showName];
    [self.userName setText:[NSString stringWithFormat:@"%@: %@", @"昵称", contactModel.userName]];
    [self.userID setText:[NSString stringWithFormat:@"%@: %@", @"微信号", contactModel.userID]];
    [self.location setText:[NSString stringWithFormat:@"%@: %@", @"地区", contactModel.userDetail.location]];
}

//页面初始化
- (void)initUI{
    //头像显示
    self.iconImage = [UIButton new];
    [self.contentView addSubview:self.iconImage];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
        make.height.mas_equalTo(self.iconImage.mas_width);
    }];
    
    //展示名显示
    self.showName = [UILabel new];
    [self.showName setTextColor:[UIColor darkGrayColor]];
    [self.showName setFont:[UIFont systemFontOfSize:20.0f]];
    [self.contentView addSubview:self.showName];
    [self.showName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).mas_offset(SPACE_X);
        make.top.mas_equalTo(self.iconImage.mas_top).mas_offset(3);
    }];
    [self.showName setContentCompressionResistancePriority:100 forAxis:UILayoutConstraintAxisHorizontal];
    
    //昵称显示
    self.userName = [UILabel new];
    [self.userName setTextColor:[UIColor grayColor]];
    [self.userName setFont:[UIFont systemFontOfSize:16.0f]];
    [self.contentView addSubview:self.userName];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showName);
        make.top.mas_equalTo(self.showName.mas_bottom).mas_offset(5);
    }];
    
    //用户id显示
    self.userID = [UILabel new];
    [self.userID setTextColor:[UIColor grayColor]];
    [self.userID setFont:[UIFont systemFontOfSize:16.0f]];
    [self.contentView addSubview:self.userID];
    [self.userID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showName);
        make.top.mas_equalTo(self.userName.mas_bottom).mas_offset(5);
    }];
    
    //位置信息显示
    self.location = [UILabel new];
    [self.location setTextColor:[UIColor grayColor]];
    [self.location setFont:[UIFont systemFontOfSize:16.0f]];
    [self.contentView addSubview:self.location];
    [self.location mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showName);
        make.top.mas_equalTo(self.userID.mas_bottom).mas_offset(5);
    }];
}
@end
