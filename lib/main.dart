import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/View/Themes/Colors.dart';

import 'Controller/Auth/auth_cubit.dart';
import 'Controller/Categoriescubit/categoriescubit_cubit.dart';
import 'Controller/Home/home_cubit.dart';
import 'Controller/bolcobserver.dart';
import 'View/Screens/Home/HomeScreen.dart';
import 'View/Themes/Route.dart';
import 'helper/CacheHelper.dart';
import 'helper/DioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init(); //! =>>>>>>>>>> SharedPreferences
  DioHelper.init(); //!   =>>>>>>>>>>       Dio
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: premiumColor,
      // statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: premiumColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
          ),
          BlocProvider<CategoriesCubit>(
            create: (context) => CategoriesCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: GoogleFonts.roboto().copyWith(
                color: Colors.black.withOpacity(0.85),
              ),
            ),
          ),
          routes: myRoute,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
