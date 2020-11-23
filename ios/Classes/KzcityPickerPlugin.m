#import "KzcityPickerPlugin.h"
#if __has_include(<kzcity_picker/kzcity_picker-Swift.h>)
#import <kzcity_picker/kzcity_picker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kzcity_picker-Swift.h"
#endif

@implementation KzcityPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKzcityPickerPlugin registerWithRegistrar:registrar];
}
@end
