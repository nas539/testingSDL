//  SDLPutFile.m
//

#import "SDLPutFile.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

#import <zlib.h>

NS_ASSUME_NONNULL_BEGIN

@implementation SDLPutFile

- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNamePutFile]) {
    }
    return self;
}

- (instancetype)initWithFileName:(NSString *)fileName fileType:(SDLFileType)fileType {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.syncFileName = fileName;
    self.fileType = fileType;

    return self;
}

- (instancetype)initWithFileName:(NSString *)fileName fileType:(SDLFileType)fileType persistentFile:(BOOL)persistentFile {
    self = [self initWithFileName:fileName fileType:fileType];
    if (!self) {
        return nil;
    }

    self.persistentFile = @(persistentFile);

    return self;
}

- (instancetype)initWithFileName:(NSString *)fileName fileType:(SDLFileType)fileType persistentFile:(BOOL)persistentFile systemFile:(BOOL)systemFile offset:(UInt32)offset length:(UInt32)length {
    self = [self initWithFileName:fileName fileType:fileType persistentFile:persistentFile];
    if (!self) {
        return nil;
    }

    self.systemFile = @(systemFile);
    self.offset = @(offset);
    self.length = @(length);

    return self;
}

- (instancetype)initWithFileName:(NSString *)fileName fileType:(SDLFileType)fileType persistentFile:(BOOL)persistentFile systemFile:(BOOL)systemFile offset:(UInt32)offset length:(UInt32)length crc:(UInt64)crc {
    self = [self initWithFileName:fileName fileType:fileType persistentFile:persistentFile];
    if (!self) {
        return nil;
    }

    self.systemFile = @(systemFile);
    self.offset = @(offset);
    self.length = @(length);
    self.crc = crc == 0 ? nil : @(crc);

    return self;
}

- (instancetype)initWithFileName:(NSString *)fileName fileType:(SDLFileType)fileType persistentFile:(BOOL)persistentFile systemFile:(BOOL)systemFile offset:(UInt32)offset length:(UInt32)length bulkData:(NSData *)bulkData {

    self = [self initWithFileName:fileName fileType:fileType persistentFile:persistentFile systemFile:systemFile offset:offset length:length crc:[self.class sdl_getCRC32ChecksumForBulkData:bulkData]];
    if (!self) {
        return nil;
    }

    self.bulkData = bulkData;

    return self;
}

#pragma mark - Getters and Setters

- (void)setSyncFileName:(NSString *)syncFileName {
    [parameters sdl_setObject:syncFileName forName:SDLRPCParameterNameSyncFileName];
}

- (NSString *)syncFileName {
    NSError *error = nil;
    return [parameters sdl_objectForName:SDLRPCParameterNameSyncFileName ofClass:NSString.class error:&error];
}

- (void)setFileType:(SDLFileType)fileType {
    [parameters sdl_setObject:fileType forName:SDLRPCParameterNameFileType];
}

- (SDLFileType)fileType {
    NSError *error = nil;
    return [parameters sdl_enumForName:SDLRPCParameterNameFileType error:&error];
}

- (void)setPersistentFile:(nullable NSNumber<SDLBool> *)persistentFile {
    [parameters sdl_setObject:persistentFile forName:SDLRPCParameterNamePersistentFile];
}

- (nullable NSNumber<SDLBool> *)persistentFile {
    return [parameters sdl_objectForName:SDLRPCParameterNamePersistentFile ofClass:NSNumber.class error:nil];
}

- (void)setSystemFile:(nullable NSNumber<SDLBool> *)systemFile {
    [parameters sdl_setObject:systemFile forName:SDLRPCParameterNameSystemFile];
}

- (nullable NSNumber<SDLBool> *)systemFile {
    return [parameters sdl_objectForName:SDLRPCParameterNameSystemFile ofClass:NSNumber.class error:nil];
}

- (void)setOffset:(nullable NSNumber<SDLUInt> *)offset {
    [parameters sdl_setObject:offset forName:SDLRPCParameterNameOffset];
}

- (nullable NSNumber<SDLUInt> *)offset {
    return [parameters sdl_objectForName:SDLRPCParameterNameOffset ofClass:NSNumber.class error:nil];
}

- (void)setLength:(nullable NSNumber<SDLUInt> *)length {
    [parameters sdl_setObject:length forName:SDLRPCParameterNameLength];
}

- (nullable NSNumber<SDLUInt> *)length {
    return [parameters sdl_objectForName:SDLRPCParameterNameLength ofClass:NSNumber.class error:nil];
}

- (void)setCrc:(nullable NSNumber<SDLUInt> *)crc {
    [parameters sdl_setObject:crc forName:SDLRPCParameterNameCRC];
}

- (nullable NSNumber<SDLUInt> *)crc {
    return [parameters sdl_objectForName:SDLRPCParameterNameCRC ofClass:NSNumber.class error:nil];
}

#pragma mark - Helpers

+ (unsigned long)sdl_getCRC32ChecksumForBulkData:(NSData *)data {
    if (data.length == 0) {
        return 0;
    }

    return crc32(0, data.bytes, (uInt)data.length);
}

@end

NS_ASSUME_NONNULL_END
