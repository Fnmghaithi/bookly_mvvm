import 'package:bookly_mvvm/constants.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/service_locator.dart';
import 'package:bookly_mvvm/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_mvvm/features/home/presentation/manager/featured_books_bloc/featured_books_bloc.dart';
import 'package:bookly_mvvm/features/home/presentation/manager/newest_books_bloc/newest_books_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksBloc(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..add(FetchFeaturedBooksEvent()),
        ),
        BlocProvider(
          create: (context) => NewestBooksBloc(
            homeRepo: getIt.get<HomeRepoImpl>(),
          )..add(FetchNewestBooksEvent()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
