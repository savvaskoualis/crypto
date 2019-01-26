
#import "RCTCrypto.h"
#import "SecurityUtil.h"

@implementation RCTCrypto

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(encrypt:(NSString *)string
                  key:(NSString *)key
                  aad:(NSString *)aad
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString *encryptedString = [SecurityUtil encryptAES:string key:key aad:aad];
    if (encryptedString.length <= 0) {
        reject(@"ERROR", @"encrypt failed", nil);
    }
    resolve (encryptedString);
}

RCT_EXPORT_METHOD(decrypt:(NSString *)string
                  key:(NSString *)key
                  aad:(NSString *)aad
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSString *decryptedString = [SecurityUtil decryptAES:string key:key aad:aad];
    
    if (decryptedString.length <= 0) {
        reject(@"ERROR", @"decrypt failed", nil);
    }
    resolve (decryptedString);
}
@end
  
