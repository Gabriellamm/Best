

#import <Foundation/Foundation.h>


/**
 *  保存数据工具类
 */
@interface DXCSaveDataTool : NSObject
/**
 *  保存bool值
 *
 *  @param b   <#b description#>
 *  @param key <#key description#>
 */
+ (void)saveBool:(BOOL)b forKey:(NSString*)key;
/**
 *  取出bool值
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)boolForKey:(NSString*)key;
/**
 *  保存对象数据
 *
 *  @param object <#object description#>
 *  @param key    <#key description#>
 */
+ (void)saveObject:(id)object forKey:(NSString*)key;
/**
 *  取出对象
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
+ (id)objectForKey:(NSString*)key;
/**
 *  删除对象
 *
 *  @param key <#key description#>
 */
+ (void)removeObjectForKey:(NSString*)key;

@end
