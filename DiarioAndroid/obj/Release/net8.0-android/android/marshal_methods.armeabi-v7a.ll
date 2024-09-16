; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [48 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [96 x i32] [
	i32 39109920, ; 0: Newtonsoft.Json.dll => 0x254c520 => 1
	i32 117431740, ; 1: System.Runtime.InteropServices => 0x6ffddbc => 31
	i32 205061960, ; 2: System.ComponentModel => 0xc38ff48 => 10
	i32 230752869, ; 3: Microsoft.CSharp.dll => 0xdc10265 => 3
	i32 246610117, ; 4: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 29
	i32 347058389, ; 5: DiarioAndroid.dll => 0x14afb0d5 => 2
	i32 395744057, ; 6: _Microsoft.Android.Resource.Designer => 0x17969339 => 0
	i32 442565967, ; 7: System.Collections => 0x1a61054f => 7
	i32 459347974, ; 8: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 34
	i32 469710990, ; 9: System.dll => 0x1bff388e => 43
	i32 498788369, ; 10: System.ObjectModel => 0x1dbae811 => 24
	i32 672442732, ; 11: System.Collections.Concurrent => 0x2814a96c => 4
	i32 690569205, ; 12: System.Xml.Linq.dll => 0x29293ff5 => 40
	i32 759454413, ; 13: System.Net.Requests => 0x2d445acd => 23
	i32 775507847, ; 14: System.IO.Compression => 0x2e394f87 => 18
	i32 798464603, ; 15: DiarioAndroid => 0x2f979a5b => 2
	i32 804715423, ; 16: System.Data.Common => 0x2ff6fb9f => 12
	i32 823281589, ; 17: System.Private.Uri.dll => 0x311247b5 => 25
	i32 830298997, ; 18: System.IO.Compression.Brotli => 0x317d5b75 => 17
	i32 904024072, ; 19: System.ComponentModel.Primitives.dll => 0x35e25008 => 8
	i32 955402788, ; 20: Newtonsoft.Json => 0x38f24a24 => 1
	i32 975874589, ; 21: System.Xml.XDocument => 0x3a2aaa1d => 42
	i32 992768348, ; 22: System.Collections.dll => 0x3b2c715c => 7
	i32 1019214401, ; 23: System.Drawing => 0x3cbffa41 => 16
	i32 1036536393, ; 24: System.Drawing.Primitives.dll => 0x3dc84a49 => 15
	i32 1044663988, ; 25: System.Linq.Expressions.dll => 0x3e444eb4 => 19
	i32 1082857460, ; 26: System.ComponentModel.TypeConverter => 0x408b17f4 => 9
	i32 1098259244, ; 27: System => 0x41761b2c => 43
	i32 1324164729, ; 28: System.Linq => 0x4eed2679 => 20
	i32 1408764838, ; 29: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 33
	i32 1462112819, ; 30: System.IO.Compression.dll => 0x57261233 => 18
	i32 1480492111, ; 31: System.IO.Compression.Brotli.dll => 0x583e844f => 17
	i32 1543031311, ; 32: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 38
	i32 1639515021, ; 33: System.Net.Http.dll => 0x61b9038d => 21
	i32 1639986890, ; 34: System.Text.RegularExpressions => 0x61c036ca => 38
	i32 1657153582, ; 35: System.Runtime => 0x62c6282e => 35
	i32 1677501392, ; 36: System.Net.Primitives.dll => 0x63fca3d0 => 22
	i32 1679769178, ; 37: System.Security.Cryptography => 0x641f3e5a => 36
	i32 1763938596, ; 38: System.Diagnostics.TraceSource.dll => 0x69239124 => 14
	i32 1780572499, ; 39: Mono.Android.Runtime.dll => 0x6a216153 => 46
	i32 1824175904, ; 40: System.Text.Encoding.Extensions => 0x6cbab720 => 37
	i32 1824722060, ; 41: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 33
	i32 1858542181, ; 42: System.Linq.Expressions => 0x6ec71a65 => 19
	i32 1870277092, ; 43: System.Reflection.Primitives => 0x6f7a29e4 => 30
	i32 1910275211, ; 44: System.Collections.NonGeneric.dll => 0x71dc7c8b => 5
	i32 1939592360, ; 45: System.Private.Xml.Linq => 0x739bd4a8 => 26
	i32 2045470958, ; 46: System.Private.Xml => 0x79eb68ee => 27
	i32 2070888862, ; 47: System.Diagnostics.TraceSource => 0x7b6f419e => 14
	i32 2079903147, ; 48: System.Runtime.dll => 0x7bf8cdab => 35
	i32 2127167465, ; 49: System.Console => 0x7ec9ffe9 => 11
	i32 2142473426, ; 50: System.Collections.Specialized => 0x7fb38cd2 => 6
	i32 2193016926, ; 51: System.ObjectModel.dll => 0x82b6c85e => 24
	i32 2201231467, ; 52: System.Net.Http => 0x8334206b => 21
	i32 2305521784, ; 53: System.Private.CoreLib.dll => 0x896b7878 => 44
	i32 2353062107, ; 54: System.Net.Primitives => 0x8c40e0db => 22
	i32 2368005991, ; 55: System.Xml.ReaderWriter.dll => 0x8d24e767 => 41
	i32 2435356389, ; 56: System.Console.dll => 0x912896e5 => 11
	i32 2475788418, ; 57: Java.Interop.dll => 0x93918882 => 45
	i32 2538310050, ; 58: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 29
	i32 2562349572, ; 59: Microsoft.CSharp => 0x98ba5a04 => 3
	i32 2585220780, ; 60: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 37
	i32 2617129537, ; 61: System.Private.Xml.dll => 0x9bfe3a41 => 27
	i32 2664396074, ; 62: System.Xml.XDocument.dll => 0x9ecf752a => 42
	i32 2665622720, ; 63: System.Drawing.Primitives => 0x9ee22cc0 => 15
	i32 2676780864, ; 64: System.Data.Common.dll => 0x9f8c6f40 => 12
	i32 2724373263, ; 65: System.Runtime.Numerics.dll => 0xa262a30f => 32
	i32 2909740682, ; 66: System.Private.CoreLib => 0xad6f1e8a => 44
	i32 2959614098, ; 67: System.ComponentModel.dll => 0xb0682092 => 10
	i32 3038032645, ; 68: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 0
	i32 3059408633, ; 69: Mono.Android.Runtime => 0xb65adef9 => 46
	i32 3059793426, ; 70: System.ComponentModel.Primitives => 0xb660be12 => 8
	i32 3159123045, ; 71: System.Reflection.Primitives.dll => 0xbc4c6465 => 30
	i32 3220365878, ; 72: System.Threading => 0xbff2e236 => 39
	i32 3316684772, ; 73: System.Net.Requests.dll => 0xc5b097e4 => 23
	i32 3366347497, ; 74: Java.Interop => 0xc8a662e9 => 45
	i32 3471940407, ; 75: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 9
	i32 3476120550, ; 76: Mono.Android => 0xcf3163e6 => 47
	i32 3509114376, ; 77: System.Xml.Linq => 0xd128d608 => 40
	i32 3608519521, ; 78: System.Linq.dll => 0xd715a361 => 20
	i32 3672681054, ; 79: Mono.Android.dll => 0xdae8aa5e => 47
	i32 3748608112, ; 80: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 13
	i32 3792276235, ; 81: System.Collections.NonGeneric => 0xe2098b0b => 5
	i32 3802395368, ; 82: System.Collections.Specialized.dll => 0xe2a3f2e8 => 6
	i32 3823082795, ; 83: System.Security.Cryptography.dll => 0xe3df9d2b => 36
	i32 3849253459, ; 84: System.Runtime.InteropServices.dll => 0xe56ef253 => 31
	i32 3896106733, ; 85: System.Collections.Concurrent.dll => 0xe839deed => 4
	i32 3928044579, ; 86: System.Xml.ReaderWriter => 0xea213423 => 41
	i32 4054681211, ; 87: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 28
	i32 4068434129, ; 88: System.Private.Xml.Linq.dll => 0xf27f60d1 => 26
	i32 4073602200, ; 89: System.Threading.dll => 0xf2ce3c98 => 39
	i32 4099507663, ; 90: System.Drawing.dll => 0xf45985cf => 16
	i32 4100113165, ; 91: System.Private.Uri => 0xf462c30d => 25
	i32 4147896353, ; 92: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 28
	i32 4181436372, ; 93: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 34
	i32 4213026141, ; 94: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 13
	i32 4274976490 ; 95: System.Runtime.Numerics => 0xfecef6ea => 32
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [96 x i32] [
	i32 1, ; 0
	i32 31, ; 1
	i32 10, ; 2
	i32 3, ; 3
	i32 29, ; 4
	i32 2, ; 5
	i32 0, ; 6
	i32 7, ; 7
	i32 34, ; 8
	i32 43, ; 9
	i32 24, ; 10
	i32 4, ; 11
	i32 40, ; 12
	i32 23, ; 13
	i32 18, ; 14
	i32 2, ; 15
	i32 12, ; 16
	i32 25, ; 17
	i32 17, ; 18
	i32 8, ; 19
	i32 1, ; 20
	i32 42, ; 21
	i32 7, ; 22
	i32 16, ; 23
	i32 15, ; 24
	i32 19, ; 25
	i32 9, ; 26
	i32 43, ; 27
	i32 20, ; 28
	i32 33, ; 29
	i32 18, ; 30
	i32 17, ; 31
	i32 38, ; 32
	i32 21, ; 33
	i32 38, ; 34
	i32 35, ; 35
	i32 22, ; 36
	i32 36, ; 37
	i32 14, ; 38
	i32 46, ; 39
	i32 37, ; 40
	i32 33, ; 41
	i32 19, ; 42
	i32 30, ; 43
	i32 5, ; 44
	i32 26, ; 45
	i32 27, ; 46
	i32 14, ; 47
	i32 35, ; 48
	i32 11, ; 49
	i32 6, ; 50
	i32 24, ; 51
	i32 21, ; 52
	i32 44, ; 53
	i32 22, ; 54
	i32 41, ; 55
	i32 11, ; 56
	i32 45, ; 57
	i32 29, ; 58
	i32 3, ; 59
	i32 37, ; 60
	i32 27, ; 61
	i32 42, ; 62
	i32 15, ; 63
	i32 12, ; 64
	i32 32, ; 65
	i32 44, ; 66
	i32 10, ; 67
	i32 0, ; 68
	i32 46, ; 69
	i32 8, ; 70
	i32 30, ; 71
	i32 39, ; 72
	i32 23, ; 73
	i32 45, ; 74
	i32 9, ; 75
	i32 47, ; 76
	i32 40, ; 77
	i32 20, ; 78
	i32 47, ; 79
	i32 13, ; 80
	i32 5, ; 81
	i32 6, ; 82
	i32 36, ; 83
	i32 31, ; 84
	i32 4, ; 85
	i32 41, ; 86
	i32 28, ; 87
	i32 26, ; 88
	i32 39, ; 89
	i32 16, ; 90
	i32 25, ; 91
	i32 28, ; 92
	i32 34, ; 93
	i32 13, ; 94
	i32 32 ; 95
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
