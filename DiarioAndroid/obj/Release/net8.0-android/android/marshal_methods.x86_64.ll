; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [48 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [96 x i64] [
	i64 120698629574877762, ; 0: Mono.Android => 0x1accec39cafe242 => 47
	i64 196720943101637631, ; 1: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 19
	i64 560278790331054453, ; 2: System.Reflection.Primitives => 0x7c6829760de3975 => 30
	i64 799765834175365804, ; 3: System.ComponentModel.dll => 0xb1956c9f18442ac => 10
	i64 1010599046655515943, ; 4: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 30
	i64 1268860745194512059, ; 5: System.Drawing.dll => 0x119be62002c19ebb => 16
	i64 1476839205573959279, ; 6: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 22
	i64 1494089412583047780, ; 7: DiarioAndroid => 0x14bc12679baf4264 => 2
	i64 1513467482682125403, ; 8: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 46
	i64 1731380447121279447, ; 9: Newtonsoft.Json => 0x18071957e9b889d7 => 1
	i64 1767386781656293639, ; 10: System.Private.Uri.dll => 0x188704e9f5582107 => 25
	i64 1875417405349196092, ; 11: System.Drawing.Primitives => 0x1a06d2319b6c713c => 15
	i64 2102659300918482391, ; 12: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 15
	i64 2133195048986300728, ; 13: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 1
	i64 2287834202362508563, ; 14: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 4
	i64 2497223385847772520, ; 15: System.Runtime => 0x22a7eb7046413568 => 35
	i64 3325875462027654285, ; 16: System.Runtime.Numerics => 0x2e27e21c8958b48d => 32
	i64 3551103847008531295, ; 17: System.Private.CoreLib.dll => 0x31480e226177735f => 44
	i64 3571415421602489686, ; 18: System.Runtime.dll => 0x319037675df7e556 => 35
	i64 3647754201059316852, ; 19: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 41
	i64 3933965368022646939, ; 20: System.Net.Requests => 0x369840a8bfadc09b => 23
	i64 4009997192427317104, ; 21: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 34
	i64 4073500526318903918, ; 22: System.Private.Xml.dll => 0x3887fb25779ae26e => 27
	i64 4154383907710350974, ; 23: System.ComponentModel => 0x39a7562737acb67e => 10
	i64 4187479170553454871, ; 24: System.Linq.Expressions => 0x3a1cea1e912fa117 => 19
	i64 4205801962323029395, ; 25: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 9
	i64 4809057822547766521, ; 26: System.Drawing => 0x42bd349c3145ecf9 => 16
	i64 5103417709280584325, ; 27: System.Collections.Specialized => 0x46d2fb5e161b6285 => 6
	i64 5182934613077526976, ; 28: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 6
	i64 5570799893513421663, ; 29: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 17
	i64 5573260873512690141, ; 30: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 36
	i64 6284145129771520194, ; 31: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 28
	i64 6357457916754632952, ; 32: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 0
	i64 6786606130239981554, ; 33: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 14
	i64 6814185388980153342, ; 34: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 42
	i64 6876862101832370452, ; 35: System.Xml.Linq => 0x5f6f85a57d108914 => 40
	i64 7083547580668757502, ; 36: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 26
	i64 7270811800166795866, ; 37: System.Linq => 0x64e71ccf51a90a5a => 20
	i64 7377312882064240630, ; 38: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 9
	i64 7488575175965059935, ; 39: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 40
	i64 7489048572193775167, ; 40: System.ObjectModel => 0x67ee71ff6b419e3f => 24
	i64 7654504624184590948, ; 41: System.Net.Http => 0x6a3a4366801b8264 => 21
	i64 7714652370974252055, ; 42: System.Private.CoreLib => 0x6b0ff375198b9c17 => 44
	i64 7735176074855944702, ; 43: Microsoft.CSharp => 0x6b58dda848e391fe => 3
	i64 8064050204834738623, ; 44: System.Collections.dll => 0x6fe942efa61731bf => 7
	i64 8087206902342787202, ; 45: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 13
	i64 8167236081217502503, ; 46: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 45
	i64 8185542183669246576, ; 47: System.Collections => 0x7198e33f4794aa70 => 7
	i64 8368701292315763008, ; 48: System.Security.Cryptography => 0x7423997c6fd56140 => 36
	i64 8410671156615598628, ; 49: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 29
	i64 8511651620614829260, ; 50: DiarioAndroid.dll => 0x761f760d629ff4cc => 2
	i64 8563666267364444763, ; 51: System.Private.Uri => 0x76d841191140ca5b => 25
	i64 8626175481042262068, ; 52: Java.Interop => 0x77b654e585b55834 => 45
	i64 8638972117149407195, ; 53: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 3
	i64 8725526185868997716, ; 54: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 13
	i64 8941376889969657626, ; 55: System.Xml.XDocument => 0x7c1626e87187471a => 42
	i64 9659729154652888475, ; 56: System.Text.RegularExpressions => 0x860e407c9991dd9b => 38
	i64 9702891218465930390, ; 57: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 5
	i64 9808709177481450983, ; 58: Mono.Android.dll => 0x881f890734e555e7 => 47
	i64 10038780035334861115, ; 59: System.Net.Http.dll => 0x8b50e941206af13b => 21
	i64 10051358222726253779, ; 60: System.Private.Xml => 0x8b7d990c97ccccd3 => 27
	i64 10245369515835430794, ; 61: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 29
	i64 10364469296367737616, ; 62: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 28
	i64 10785150219063592792, ; 63: System.Net.Primitives => 0x95ac8cfb68830758 => 22
	i64 11485890710487134646, ; 64: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 31
	i64 12201331334810686224, ; 65: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 34
	i64 12475113361194491050, ; 66: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 0
	i64 12517810545449516888, ; 67: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 14
	i64 12550732019250633519, ; 68: System.IO.Compression => 0xae2d28465e8e1b2f => 18
	i64 12708922737231849740, ; 69: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 37
	i64 13068258254871114833, ; 70: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 33
	i64 13343850469010654401, ; 71: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 46
	i64 13717397318615465333, ; 72: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 8
	i64 13881769479078963060, ; 73: System.Console.dll => 0xc0a5f3cade5c6774 => 11
	i64 14125464355221830302, ; 74: System.Threading.dll => 0xc407bafdbc707a9e => 39
	i64 14254574811015963973, ; 75: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 37
	i64 14461014870687870182, ; 76: System.Net.Requests.dll => 0xc8afd8683afdece6 => 23
	i64 14622043554576106986, ; 77: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 33
	i64 14987728460634540364, ; 78: System.IO.Compression.dll => 0xcfff1ba06622494c => 18
	i64 15076659072870671916, ; 79: System.ObjectModel.dll => 0xd13b0d8c1620662c => 24
	i64 15115185479366240210, ; 80: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 17
	i64 15133485256822086103, ; 81: System.Linq.dll => 0xd204f0a9127dd9d7 => 20
	i64 15527772828719725935, ; 82: System.Console => 0xd77dbb1e38cd3d6f => 11
	i64 15609085926864131306, ; 83: System.dll => 0xd89e9cf3334914ea => 43
	i64 15661133872274321916, ; 84: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 41
	i64 16154507427712707110, ; 85: System => 0xe03056ea4e39aa26 => 43
	i64 16856067890322379635, ; 86: System.Data.Common.dll => 0xe9ecc87060889373 => 12
	i64 16890310621557459193, ; 87: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 38
	i64 17008137082415910100, ; 88: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 5
	i64 17062143951396181894, ; 89: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 8
	i64 17230721278011714856, ; 90: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 26
	i64 17260702271250283638, ; 91: System.Data.Common => 0xef8a5543bba6bc76 => 12
	i64 17712670374920797664, ; 92: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 31
	i64 17777860260071588075, ; 93: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 32
	i64 18025913125965088385, ; 94: System.Threading => 0xfa28e87b91334681 => 39
	i64 18245806341561545090 ; 95: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 4
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [96 x i32] [
	i32 47, ; 0
	i32 19, ; 1
	i32 30, ; 2
	i32 10, ; 3
	i32 30, ; 4
	i32 16, ; 5
	i32 22, ; 6
	i32 2, ; 7
	i32 46, ; 8
	i32 1, ; 9
	i32 25, ; 10
	i32 15, ; 11
	i32 15, ; 12
	i32 1, ; 13
	i32 4, ; 14
	i32 35, ; 15
	i32 32, ; 16
	i32 44, ; 17
	i32 35, ; 18
	i32 41, ; 19
	i32 23, ; 20
	i32 34, ; 21
	i32 27, ; 22
	i32 10, ; 23
	i32 19, ; 24
	i32 9, ; 25
	i32 16, ; 26
	i32 6, ; 27
	i32 6, ; 28
	i32 17, ; 29
	i32 36, ; 30
	i32 28, ; 31
	i32 0, ; 32
	i32 14, ; 33
	i32 42, ; 34
	i32 40, ; 35
	i32 26, ; 36
	i32 20, ; 37
	i32 9, ; 38
	i32 40, ; 39
	i32 24, ; 40
	i32 21, ; 41
	i32 44, ; 42
	i32 3, ; 43
	i32 7, ; 44
	i32 13, ; 45
	i32 45, ; 46
	i32 7, ; 47
	i32 36, ; 48
	i32 29, ; 49
	i32 2, ; 50
	i32 25, ; 51
	i32 45, ; 52
	i32 3, ; 53
	i32 13, ; 54
	i32 42, ; 55
	i32 38, ; 56
	i32 5, ; 57
	i32 47, ; 58
	i32 21, ; 59
	i32 27, ; 60
	i32 29, ; 61
	i32 28, ; 62
	i32 22, ; 63
	i32 31, ; 64
	i32 34, ; 65
	i32 0, ; 66
	i32 14, ; 67
	i32 18, ; 68
	i32 37, ; 69
	i32 33, ; 70
	i32 46, ; 71
	i32 8, ; 72
	i32 11, ; 73
	i32 39, ; 74
	i32 37, ; 75
	i32 23, ; 76
	i32 33, ; 77
	i32 18, ; 78
	i32 24, ; 79
	i32 17, ; 80
	i32 20, ; 81
	i32 11, ; 82
	i32 43, ; 83
	i32 41, ; 84
	i32 43, ; 85
	i32 12, ; 86
	i32 38, ; 87
	i32 5, ; 88
	i32 8, ; 89
	i32 26, ; 90
	i32 12, ; 91
	i32 31, ; 92
	i32 32, ; 93
	i32 39, ; 94
	i32 4 ; 95
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
