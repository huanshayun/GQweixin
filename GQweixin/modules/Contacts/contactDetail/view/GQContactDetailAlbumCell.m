//
//  GQContactDetailAlbumCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/26.
//
//  显示联系人的相册

#import "GQContactDetailAlbumCell.h"
#import "Masonry.h"

#define MAX_ALBUM_NUM 4

@interface GQContactDetailAlbumCell ()

//标题
@property (nonatomic, strong) UILabel *titleLabel;
//相册图片位1
@property (nonatomic, strong) UIImageView *albumImage1;
//相册图片位2
@property (nonatomic, strong) UIImageView *albumImage2;
//相册图片位3
@property (nonatomic, strong) UIImageView *albumImage3;
//相册图片位4
@property (nonatomic, strong) UIImageView *albumImage4;
//右箭头标志
@property (nonatomic, strong) UIImageView *rightArrow;

@end


@implementation GQContactDetailAlbumCell

//行高
+ (CGFloat)viewCellHeight{
    return 90.0f;
}

//初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

//视图初始化
-(void)initUI{
    //标题文字显示
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor darkGrayColor]];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        //make.width.mas_equalTo(80);
    }];
    
    //相册位1
    self.albumImage1 = [UIImageView new];
    [self.contentView addSubview:self.albumImage1];
    [self.albumImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(30);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.width.mas_equalTo(self.albumImage1.mas_height);
    }];
    
    //相册位2
    self.albumImage2 = [UIImageView new];
    [self.contentView addSubview:self.albumImage2];
    [self.albumImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.albumImage1.mas_right).mas_offset(8);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.width.mas_equalTo(self.albumImage2.mas_height);
    }];
    
    //相册位3
    self.albumImage3 = [UIImageView new];
    [self.contentView addSubview:self.albumImage3];
    [self.albumImage3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.albumImage2.mas_right).mas_offset(8);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.width.mas_equalTo(self.albumImage3.mas_height);
    }];
    
    //相册位4
    self.albumImage4 = [UIImageView new];
    [self.contentView addSubview:self.albumImage4];
    [self.albumImage4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.albumImage3.mas_right).mas_offset(8);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.width.mas_equalTo(self.albumImage4.mas_height);
    }];
    
    self.rightArrow = [UIImageView new];
    [self.rightArrow setImage:[UIImage imageNamed:@"right_arrow"]];
    [self.contentView addSubview:self.rightArrow];
    [self.rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(10, 15));
        make.right.mas_equalTo(-15);
    }];
}

//保存标题和相册信息
- (void)setTitleText:(NSString *)titleText album:(NSArray *)album{
    [self.titleLabel setText:titleText];
    NSUInteger albumCount = album.count;
    NSArray *albumArray = albumCount > MAX_ALBUM_NUM ? [album subarrayWithRange:NSMakeRange(0, MAX_ALBUM_NUM)] : album;//判断联系人相册数量是否大于最大显示数量
    NSUInteger index = 0;
    if(index < albumArray.count){
        [self.albumImage1 setImage:[UIImage imageNamed:albumArray[index]]];
    }
    else{
        [self.albumImage1 setImage:nil];
    }
    index++;
    if(index < albumArray.count){
        [self.albumImage2 setImage:[UIImage imageNamed:albumArray[index]]];
    }
    else{
        [self.albumImage2 setImage:nil];
    }
    index++;
    if(index < albumArray.count){
        [self.albumImage3 setImage:[UIImage imageNamed:albumArray[index]]];
    }
    else{
        [self.albumImage3 setImage:nil];
    }
    index++;
    if(index < albumArray.count){
        [self.albumImage4 setImage:[UIImage imageNamed:albumArray[index]]];
    }
    else{
        [self.albumImage4 setImage:nil];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
