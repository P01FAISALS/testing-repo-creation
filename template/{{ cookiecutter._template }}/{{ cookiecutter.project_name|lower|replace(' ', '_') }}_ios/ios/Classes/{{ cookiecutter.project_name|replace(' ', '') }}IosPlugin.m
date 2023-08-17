#import "{{ cookiecutter.project_name|replace(' ', '') }}IosPlugin.h"
#if __has_include(<{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios-Swift.h>)
#import <{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios-Swift.h"
#endif

@implementation {{ cookiecutter.project_name|replace(' ', '') }}IosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [Swift{{ cookiecutter.project_name|replace(' ', '') }}IosPlugin registerWithRegistrar:registrar];
}
@end
