// bin/config.dart

class AppConfig {
  static const String executableName = 'flutter_pro_architect';

  // 📂 Folder Blueprint
  static const List<String> folderStructure = [
    'lib/app/config',
    'lib/controllers',
    'lib/data/source/local/object_box',
    'lib/data/source/local/secure',
    'lib/data/source/remote/api',
    'lib/data/source/remote/dio',
    'lib/data/source/remote/interceptors',
    'lib/di',
    'lib/model',
    'lib/repositories',
    'lib/res/constants',
    'lib/res/routes',
    'lib/res/themes',
    'lib/utils/helper',
    'lib/view/screens',
    'lib/view/widgets',
  ];

  // 📦 Dependency Blueprint (Map of Package Name : Version/Comment)
  // We use a Map so we can loop through and generate the formatted string
static const Map<String, String> dependencies = {
    '# State Management': '',
    'get': '',
    '# Navigation': '',
    'go_router': '',
    '# Network Communication': '',
    'dio': '',
    'talker_dio_logger': '',
    'retrofit': '',
    'http': '',
    '# Local Storage': '',
    'objectbox': '',
    'objectbox_flutter_libs': '',
    'path_provider': '',
    '# Utilities & Responsive': '',
    'flutter_screenutil': '',
    'flutter_dotenv': '',
    'intl': '',
    'fluttertoast': '',
    'cached_network_image': '',
    'image_picker': '',
    'file_picker': '',
  };

static const String serviceLocatorContent = '''
import 'package:get/get.dart';
// import 'package:dio/dio.dart'; // Uncomment after adding dio
// import 'package:image_picker/image_picker.dart'; // Uncomment after adding image_picker
// import 'locator_index.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // CORE / UTILS
    // Get.lazyPut<Dio>(
    //   () => DioClient(baseUrl: ApiEndpoints.baseUrl).dio,
    //   fenix: true,
    // );
    // Get.lazyPut(() => ApiClient(Get.find<Dio>()), fenix: true);
    // Get.lazyPut(() => ImagePicker(), fenix: true);

    // REPOSITORIES
    // Get.lazyPut(() => AuthRepository(Get.find()), fenix: true);

    // CONTROLLERS
    // Get.lazyPut(() => AppController(), fenix: true);
  }
}
''';
}
