//


#import "DXCSaveDataTool.h"

@implementation DXCSaveDataTool
/**
 *  保存bool值
 *
 *  @param b   <#b description#>
 *  @param key <#key description#>
 */
+ (void)saveBool:(BOOL)b forKey:(NSString*)key{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:b forKey:key];
    
    [defaults synchronize];
}
/**
 *  取出bool值
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)boolForKey:(NSString*)key{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}
/**
 *  保存对象数据
 *
 *  @param object <#object description#>
 *  @param key    <#key description#>
 */
+ (void)saveObject:(id)object forKey:(NSString*)key{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];
}
/**
 *  取出对象
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
+ (id)objectForKey:(NSString*)key{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
    
}

/**
 *  删除对象
 *
 *  @param key <#key description#>
 */
+ (void)removeObjectForKey:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    
}
@end
