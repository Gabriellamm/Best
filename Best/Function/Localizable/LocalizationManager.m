

#import "LocalizationManager.h"
#import "DXCSaveDataTool.h"

@implementation LocalizationManager

+ (LocalizationManager *)sharedManager {
    static dispatch_once_t pred;
    static LocalizationManager *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[LocalizationManager alloc] init];
    });
    return shared;
}

- (void)setLanguage:(NSString *)language
{
    NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj" ];
    if(language == nil)
    {
        NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        NSString *languageName = [appLanguages objectAtIndex:0];


        path = [[ NSBundle mainBundle ] pathForResource:languageName ofType:@"lproj" ];
         [DXCSaveDataTool saveObject:languageName forKey:LanKey];
    }else
    {
        
        [DXCSaveDataTool saveObject:language forKey:LanKey];
    }
    
    bundle = [NSBundle bundleWithPath:path];
}

- (NSString *)localizedStringForKey:(NSString *)key
{
    
    NSString*text = [bundle localizedStringForKey:key value:nil table:nil];
    return text;
}

- (NSString *)localizedStringForKey:(NSString *)key language:(NSString *)language
{
    NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj" ];
    if(!path)
    {
        path = [[ NSBundle mainBundle ] pathForResource:@"en" ofType:@"lproj" ];
    }
    NSBundle *tempBundle = [NSBundle bundleWithPath:path];
    return [tempBundle localizedStringForKey:key value:nil table:nil];
}
- (NSString*)getLanguage{
    
    return [DXCSaveDataTool objectForKey:LanKey];
}
@end
