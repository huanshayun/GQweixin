#import <Foundation/Foundation.h>

@interface NSData (Gzip)

/**
 *  GZIP压缩
 *
 *  @param level 压缩级别
 */
- (NSData *)gzippedDataWithCompressionLevel:(float)level;

/**
 *  GZIP压缩 压缩级别 默认-1
 *
 *  @return 压缩后的数据
 */
- (NSData *)gzippedData;

/**
 *  GZIP解压
 *
 *  @return 解压后数据
 */
- (NSData *)gunzippedData;

- (BOOL)isGzippedData;

@end
