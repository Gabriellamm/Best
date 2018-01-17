
#import <Foundation/Foundation.h>

#define LanKey @"Lankey" // 当前语言的 key
#define LANG_KEY_T @"zh-Hant"
#define LANG_KEY_S @"zh-Hans"
#define LANG_KEY_en @"en"

#define setLanguage(language) \
[[LocalizationManager sharedManager] setLanguage:(language)]

#define getLocalizedString(key) \
[[LocalizationManager sharedManager] localizedStringForKey:(key)]

#define getLocalizedStringWithLanguage(key,lang) \
[[LocalizationManager sharedManager] localizedStringForKey:(key) language:(lang)]

#define getLocalizedLanguage \
[[LocalizationManager sharedManager] getLanguage]
@interface LocalizationManager : NSObject
{
    NSBundle *bundle;
}

+ (LocalizationManager *)sharedManager;
- (void)setLanguage:(NSString *)language;
- (NSString *)localizedStringForKey:(NSString *)key;
- (NSString *)localizedStringForKey:(NSString *)key language:(NSString *)language;
- (NSString*)getLanguage;

@end
