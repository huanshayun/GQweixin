//
//  GQContactHeaderView.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/4.
//

#import "GQContactHeaderView.h"
#import "Masonry.h"

@interface GQContactHeaderView()
    
@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation GQContactHeaderView 

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        UIView *backgroundView = [UIView new];
        [backgroundView setBackgroundColor:[UIColor colorWithRed:(239.0/255) green:(239.0/255) blue:(244.0/255) alpha:1.0]];
        [self setBackgroundView:backgroundView];
        
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self.titleLabel setTextColor:[UIColor grayColor]];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_lessThanOrEqualTo(-15);
            make.centerY.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)setViewTitle:(id)data{
    [self setTitle:data];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    [self.titleLabel setText:title];
}

+ (CGFloat)viewHeaderHeight{
    return 22.0f;
}

@end
