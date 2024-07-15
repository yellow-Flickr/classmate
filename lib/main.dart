import 'dart:math';

import 'package:classmate/custom_buttons.dart';
import 'package:classmate/theme/dark_mode.dart';
import 'package:classmate/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:intl/intl.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MainApp());
}

class CirclesPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    var radius = size.width / 2;
    const angle = 2 * pi / 15;
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 20; i++) {
      final point = Offset(
        center.dx + radius * cos(angle * i),
        center.dy + radius * sin(angle * i),
      );
      canvas.drawCircle(point, radius, paint);
      radius -= 10;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceTypes) {
      return MaterialApp(
        themeMode: ThemeMode.system,
        theme: lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        home: const Onboarding(),
      );
    });
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            right: -75.w,
            child: SizedBox(
              width: 160.w,
              height: 100.h,
              child: CustomPaint(
                painter: CirclesPaint(),
              ),
            ),
          ),
          Positioned(
              bottom: -15.h,
              child: Image.asset(
                'assets/onboarding-retro.png',
                fit: BoxFit.contain,
                width: 160.w,
                height: 85.h,
              )

              // Container(
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //     image: AssetImage('assets/onboarding.png'),
              //   )),
              // )

              ),
          Positioned(
              top: 10.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        color: theme.colorScheme.secondary,
                        width: 10.w,
                        height: 10.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'ClassMate',
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 6.w,
                            fontFamily: 'PlusJakartaSans'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All-in-One Apps for Your School',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SizedBox(
                            width: 60.w,
                            child: Text(
                              'Access your lessons and contact your teachers. Join a Class and Course.',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelSmall
                                  ?.copyWith(color: Colors.white),
                            )),
                        SizedBox(
                          height: 3.h,
                        ),
                        Button(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LogIn(),
                            ));
                          },
                          text: 'Get Started',
                          color: theme.colorScheme.secondary,
                          borderRadius: 10,
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text(
              'Log In',
              style: theme.textTheme.headlineLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: theme.primaryColor,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                children: [
                  TextField(
                    style: theme.textTheme.bodySmall,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Email',
                      labelStyle: theme.textTheme.labelMedium,
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    style: theme.textTheme.bodySmall,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Password',
                        labelStyle: theme.textTheme.labelMedium,
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off)),
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: theme.primaryColor,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 6.h),
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Log In'),
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: theme.primaryColor,
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: theme.primaryColor,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      const Text('or log-in with'),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: theme.primaryColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: theme.primaryColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.g_mobiledata_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // SocialButton(
                      //   icon: Icons.facebook,
                      //   onPressed: () {},
                      // ),
                      // SizedBox(width: 2.w),
                      // SocialButton(
                      //   icon: Icons.google,
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: theme.textTheme.headlineLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: .5.h,
                ),
                Text(
                  'Enter your details below, sign up for free',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.white, /* fontWeight: FontWeight.bold */
                  ),
                ),
              ],
            ),
            backgroundColor: theme.primaryColor,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                children: [
                  TextField(
                    style: theme.textTheme.bodySmall,
                    decoration: InputDecoration(
                      isDense: true,
                      // contentPadding:
                      //     EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                      labelText: 'Email',
                      labelStyle: theme.textTheme.labelMedium,
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    style: theme.textTheme.bodySmall,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Password',
                        labelStyle: theme.textTheme.labelMedium,
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off)),
                  ),
                  SizedBox(height: 3.h),
                  ListTile(
                    dense: true,
                    onTap: () {},
                    leading: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const Text(
                        'By creating an account you have to agree with our them & condication.'),
                  ),
                  SizedBox(height: 3.h),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 6.h),
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Create Account'),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            /*  MaterialPageRoute(
                                  builder: (context) => const LogIn()) */
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: theme.primaryColor,
                        ),
                        child: const Text('Log In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdvancedDrawer(
        openRatio: .60,
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.primaryColor,
          child: Transform.scale(
              scale: 2,
              child: CustomPaint(
                painter: CirclesPaint(),
              )),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
            child: Container(
                child: ListTileTheme(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.w,
                              margin: EdgeInsets.only(
                                top: 24.0,
                                bottom: 2.h,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person,
                                color: theme.primaryColor,
                                size: 15.w,
                              ),
                            ),
                            Text(
                              'Bill John',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'College Student',
                              style: theme.textTheme.labelLarge
                                  ?.copyWith(color: Colors.white54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.home),
                          title: const Text('Home'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.cast_for_education_rounded),
                          title: const Text('My Class'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.task_alt_rounded),
                          title: const Text('My Tasks'),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => Schedule(),
                            ));
                          },
                          leading: const Icon(Icons.calendar_month_outlined),
                          title: const Text('Schedules'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.chat_bubble),
                          title: const Text('Messages'),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.exit_to_app_rounded),
                          title: const Text('Log out'),
                        ),
                        const Spacer(),
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                            child:
                                const Text('Terms of Service | Privacy Policy'),
                          ),
                        ),
                      ],
                    )))),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 12.w,
            leading: IconButton(
              onPressed: () {
                _advancedDrawerController.showDrawer();
              },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.list_alt_rounded,
                      size: 7.w,
                      color: theme.primaryColor,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            // Icon(
            //   Icons.list_alt_rounded,
            //   size: 7.w,
            //   color: theme.primaryColor,
            // ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  color: theme.primaryColor,
                  width: 6.w,
                  height: 6.w,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  'ClassMate',
                  style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.grey.shade800,
                      fontSize: 4.w,
                      fontFamily: 'PlusJakartaSans'),
                )
              ],
            ),
            actions: [
              Icon(
                Icons.notifications_active_rounded,
                color: theme.primaryColor,
                size: 6.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  radius: 3.5.w,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: IndexedStack(
            children: [
              const Dashboard(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(),
        ));
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // appBar: AppBar(
      //   titleSpacing: 0,
      //   leadingWidth: 12.w,
      //   leading: Icon(
      //     Icons.list_alt_rounded,
      //     size: 7.w,
      //     color: theme.primaryColor,
      //   ),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/logo.png',
      //         color: theme.primaryColor,
      //         width: 6.w,
      //         height: 6.w,
      //       ),
      //       SizedBox(
      //         width: 1.w,
      //       ),
      //       Text(
      //         'ClassMate',
      //         style: theme.textTheme.labelMedium?.copyWith(
      //             color: Colors.grey.shade800,
      //             fontSize: 4.w,
      //             fontFamily: 'PlusJakartaSans'),
      //       )
      //     ],
      //   ),
      //   actions: [
      //     Icon(
      //       Icons.notifications_active_rounded,
      //       color: theme.primaryColor,
      //       size: 6.w,
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 3.w),
      //       child: CircleAvatar(
      //         backgroundColor: theme.primaryColor,
      //         child: Icon(
      //           Icons.person,
      //           color: Colors.white,
      //         ),
      //         radius: 3.5.w,
      //       ),
      //     )
      //   ],
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 18.h,
            // width: width,
            child: CarouselSlider(
                options: CarouselOptions(
                  //scrollDirection: Axis.vertical,
                  aspectRatio: 3,
                  viewportFraction: 0.8,
                  //enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(2.h),
                        // width: width,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                        ),

                        child: CustomPaint(
                          painter: CirclesPaint(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'TEST RESULTS ARE OUT!',
                                        style: theme.textTheme.headlineMedium
                                            ?.copyWith(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                      ),
                                      SizedBox(height: .5.h),
                                      SizedBox(
                                        width: 25.w,
                                        child: Button(
                                          text: 'Check Now',
                                          color: theme.colorScheme.secondary,
                                          padding: 2.w,
                                          borderRadius: 25,
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 2,
                                child: Icon(Icons.shopping_basket,
                                    color: Colors.white, size: 50),
                              )
                            ],
                          ),
                        ),
                        //width: width*0.8,
                      ),
                    ),
                  ),
                )),
          ),
          Container(
            color: theme.scaffoldBackgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Recent Subjects',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text(
                            'See all',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    textBaseline: TextBaseline.alphabetic),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  height: 13.h,
                  // width: 90.w,
                  child: ListView(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: theme.colorScheme.primaryContainer,
                        ),
                        width: 28.w,
                        height: 13.h,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 12.5.w,
                              height: 12.5.w,
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color.fromARGB(40, 255, 109, 143)),
                              child: Icon(
                                Icons.brush_outlined,
                                color: Colors.red,
                                size: 8.w,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Art',
                              style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: theme.colorScheme.primaryContainer,
                        ),
                        width: 28.w,
                        height: 13.h,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 12.5.w,
                              height: 12.5.w,
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color.fromARGB(40, 249, 188, 96)),
                              child: Icon(
                                Icons.calculate_rounded,
                                color: const Color(0xffF9BC60),
                                size: 8.w,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Math',
                              style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: theme.colorScheme.primaryContainer,
                        ),
                        width: 28.w,
                        height: 13.h,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 12.5.w,
                              height: 12.5.w,
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color.fromARGB(40, 10, 66, 63)),
                              child: Icon(
                                Icons.storage_rounded,
                                color: const Color(0xff0A423F),
                                size: 8.w,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Database',
                              style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: Colors.white,
                        ),
                        width: 28.w,
                        height: 13.h,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 12.5.w,
                              height: 12.5.w,
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color.fromARGB(40, 148, 133, 248)),
                              child: Icon(
                                Icons.campaign_rounded,
                                color: const Color(0xFF9585F8),
                                size: 8.w,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Broadcast',
                              style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Today\'s Class',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  tileColor: theme.primaryColor,
                  leading: Container(
                    width: 12.5.w,
                    height: 12.5.w,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Colors.white12),
                    child: Icon(
                      Icons.calculate_rounded,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 8.w,
                    ),
                  ),
                  title: Text(
                    'Compulsory Maths',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.timelapse_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: .5.w,
                      ),
                      Text(
                        'In Session',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  tileColor: theme.colorScheme.primaryContainer,
                  leading: Container(
                    width: 12.5.w,
                    height: 12.5.w,
                    decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: theme.primaryColor.withOpacity(.2)),
                    child: Icon(
                      Icons.psychology_rounded,
                      color: theme.primaryColor,
                      size: 8.w,
                    ),
                  ),
                  title: Text(
                    'Psychology',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 15,
                      ),
                      SizedBox(
                        width: .5.w,
                      ),
                      Text(
                        '10a.m. - 12p.m.',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.tune_rounded,
                    size: 30,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  tileColor: theme.colorScheme.primaryContainer,
                  leading: Container(
                    width: 12.5.w,
                    height: 12.5.w,
                    decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: Colors.amber.shade800.withOpacity(.2)),
                    child: Icon(
                      Icons.agriculture_rounded,
                      color: Colors.amber.shade800,
                      size: 8.w,
                    ),
                  ),
                  title: Text(
                    'Agriculture',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 15,
                      ),
                      SizedBox(
                        width: .5.w,
                      ),
                      Text(
                        '10a.m. - 12p.m.',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.tune_rounded,
                    size: 30,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  tileColor: theme.colorScheme.primaryContainer,
                  leading: Container(
                    width: 12.5.w,
                    height: 12.5.w,
                    decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: Colors.purple.shade800.withOpacity(.2)),
                    child: Icon(
                      Icons.computer,
                      color: Colors.purple.shade800,
                      size: 8.w,
                    ),
                  ),
                  title: Text(
                    'Software Development',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 15,
                      ),
                      SizedBox(
                        width: .5.w,
                      ),
                      Text(
                        '10a.m. - 12p.m.',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.tune_rounded,
                    size: 30,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      initialIndex: 3,
      length: 14,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          toolbarHeight: 10.5.h,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Bill John',
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'College Student',
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                ],
              ),
            )
          ],
          flexibleSpace: Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.primaryColor,
            child: Transform.scale(
                scale: 2,
                child: CustomPaint(
                  painter: CirclesPaint(),
                )),
          ),
          bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelStyle: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              unselectedLabelStyle: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w200),
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10), bottom: Radius.circular(10)),
                  color: theme.colorScheme.secondary.withOpacity(.2)),
              labelColor: theme.colorScheme.secondary,
              indicatorPadding:
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
              tabs: List.generate(
                  14,
                  (index) => Tab(
                        iconMargin: EdgeInsets.only(bottom: 5),
                        height: 10.h,
                        icon: Text(
                          DateTime.now()
                              .subtract(Duration(days: 4 - index))
                              .day
                              .toString()
                              .padLeft(2, '0'),
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        text: DateFormat.E()
                            .format(DateTime.now()
                                .subtract(Duration(days: 4 - index))
                                .toUtc())
                            .substring(0, 2),
                        // child: Text(
                        //     DateFormat.E()
                        //         .format(DateTime.now()
                        //             .subtract(Duration(days: 4 - index))
                        //             .toUtc())
                        //         .substring(0, 2),
                        //     style: theme.textTheme.bodySmall),
                      ))),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          children: [
            Card.filled(
              color: theme.colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              // margin: ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  ListTile(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(16)),
                    // tileColor: Colors.white,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    leading: Container(
                      width: 12.5.w,
                      height: 12.5.w,
                      decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          color: theme.primaryColor.withOpacity(.2)),
                      child: Icon(
                        Icons.psychology_rounded,
                        color: theme.primaryColor,
                        size: 8.w,
                      ),
                    ),
                    title: Text(
                      'Psychology',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: .5.w,
                        ),
                        Text(
                          '10a.m. - 12p.m.',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.tune_rounded,
                      size: 30,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.school,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: .5.w,
                            ),
                            Text(
                              'Mr. John Lennon',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: .5.w,
                            ),
                            Text(
                              'Mr. John Lennon',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 13.w,
                              child: Stack(
                                // fit: StackFit.passthrough,
                                // alignment: AlignmentDirectional.centerStart,
                                children: [
                                  Container(
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        border: Border.all(
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: const Color.fromRGBO(
                                                224, 224, 224, 1),
                                            width: .8),
                                        borderRadius: BorderRadius.circular(
                                          2,
                                        )),
                                    // foregroundImage: NetworkImage(
                                    //     widget.groupPreview.groupMembers.last),
                                                                
                                    // backgroundImage: ,
                                    child: Icon(
                                      Icons.person,
                                      size: 7,
                                      color: Colors.white,
                                    ),
                                    // child: Text(
                                    //   "",
                                    //   style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),
                                  ),
                                  Positioned(
                                    left: 15,
                                    child: Container(
                                      width: 6.w,
                                      height: 6.w,
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          border: Border.all(
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color.fromRGBO(
                                                  224, 224, 224, 1),
                                              width: .8),
                                          borderRadius: BorderRadius.circular(2)),
                                      // foregroundImage: NetworkImage(
                                      //     widget.groupPreview.groupMembers.last),
                              
                                      // backgroundImage: ,
                                      child: Icon(
                                        Icons.person,
                                        size: 7,
                                        color: Colors.white,
                                      ),
                                      // child: Text(
                                      //   "",
                                      //   style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Positioned(
                                    left: 28,
                                    child: Container(
                                      width: 6.w,
                                      height: 6.w,
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          border: Border.all(
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color.fromRGBO(
                                                  224, 224, 224, 1),
                                              width: .8),
                                          borderRadius: BorderRadius.circular(2)),
                                      // foregroundImage: NetworkImage(
                                      //     widget.groupPreview.groupMembers.last),
                              
                                      // backgroundImage: ,
                              
                                      child: Center(
                                        child: Text(
                                          'AR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 6,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: .5.h ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: theme.primaryColor.withOpacity(.1)
                              ),
                              child: Text('+14',style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),       Card.filled(
              color: theme.colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              // margin: ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  ListTile(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(16)),
                    // tileColor: Colors.white,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    leading: Container(
                      width: 12.5.w,
                      height: 12.5.w,
                      decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          color: Colors.amber.withOpacity(.2)),
                      child: Icon(
                        Icons.calculate_rounded,
                        color: Colors.amber.shade800,
                        size: 8.w,
                      ),
                    ),
                    title: Text(
                      'Math',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: .5.w,
                        ),
                        Text(
                          '10a.m. - 12p.m.',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.tune_rounded,
                      size: 30,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.school,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: .5.w,
                            ),
                            Text(
                              'Mr. John Lennon',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: .5.w,
                            ),
                            Text(
                              'Mr. John Lennon',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 13.w,
                              child: Stack(
                                // fit: StackFit.passthrough,
                                // alignment: AlignmentDirectional.centerStart,
                                children: [
                                  Container(
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        border: Border.all(
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: const Color.fromRGBO(
                                                224, 224, 224, 1),
                                            width: .8),
                                        borderRadius: BorderRadius.circular(
                                          2,
                                        )),
                                    // foregroundImage: NetworkImage(
                                    //     widget.groupPreview.groupMembers.last),
                                                                
                                    // backgroundImage: ,
                                    child: Icon(
                                      Icons.person,
                                      size: 7,
                                      color: Colors.white,
                                    ),
                                    // child: Text(
                                    //   "",
                                    //   style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),
                                  ),
                                  Positioned(
                                    left: 15,
                                    child: Container(
                                      width: 6.w,
                                      height: 6.w,
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          border: Border.all(
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color.fromRGBO(
                                                  224, 224, 224, 1),
                                              width: .8),
                                          borderRadius: BorderRadius.circular(2)),
                                      // foregroundImage: NetworkImage(
                                      //     widget.groupPreview.groupMembers.last),
                              
                                      // backgroundImage: ,
                                      child: Icon(
                                        Icons.person,
                                        size: 7,
                                        color: Colors.white,
                                      ),
                                      // child: Text(
                                      //   "",
                                      //   style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Positioned(
                                    left: 28,
                                    child: Container(
                                      width: 6.w,
                                      height: 6.w,
                                      decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                          border: Border.all(
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color.fromRGBO(
                                                  224, 224, 224, 1),
                                              width: .8),
                                          borderRadius: BorderRadius.circular(2)),
                                      // foregroundImage: NetworkImage(
                                      //     widget.groupPreview.groupMembers.last),
                              
                                      // backgroundImage: ,
                              
                                      child: Center(
                                        child: Text(
                                          'AR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 6,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: .5.h ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: theme.primaryColor.withOpacity(.1)
                              ),
                              child: Text('+14',style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// final counterProvider = StateProvider((ref) => 2);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;

    return SalomonBottomBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedColorOpacity: 1,
      itemShape:
          currentIndex == 2 ? const CircleBorder() : const StadiumBorder(),
      // itemPadding: currentIndex==2?  EdgeInsets.symmetric(vertical: 10, horizontal: 10): EdgeInsets.symmetric(vertical: 10, horizontal: 16) ,
      // onTap: (i) => ref.read(counterProvider.notifier).state = i,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.ondemand_video_rounded),
          activeIcon: const Icon(
            Icons.ondemand_video_rounded,
            color: Colors.white,
          ),
          title: Text(
            "tv",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white),
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.newspaper_sharp),
          activeIcon: const Icon(
            Icons.newspaper_sharp,
            color: Colors.white,
          ),
          title: Text(
            "magazine",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white),
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.home_rounded),
          activeIcon: const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
          ),
          title: const SizedBox.shrink(),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.shopping_bag_rounded),
          activeIcon: const Icon(
            Icons.shopping_bag_rounded,
            color: Colors.white,
          ),
          title: Text(
            "shop",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white),
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.poll_sharp),
          activeIcon: const Icon(
            Icons.poll_sharp,
            color: Colors.white,
          ),
          title: Text(
            "polls",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );

    // return NavigationBar(
    //   selectedIndex: currentIndex,

    //   onDestinationSelected: (value) {
    //     ref.read(counterProvider.notifier).state = value;
    //   },
    //   height: 6.h,
    //   elevation: 0,
    //   indicatorColor:   Color(0xFF336699) ,
    //   indicatorShape:currentIndex == 2 ? CircleBorder(): StadiumBorder(),
    //   labelBehavior:
    //        NavigationDestinationLabelBehavior.alwaysHide
    //        ,
    //   destinations: [
    //     NavigationDestination(
    //       label: "tv",
    //       icon: const Icon(
    //         Icons.ondemand_video_rounded,
    //       ),
    //     ),
    //     NavigationDestination(
    //       label: "",
    //       // icon: Icon(TiastIcons.tiastlogowhite),
    //       // selectedIcon: Icon(
    //       //   TiastIcons.tiastnamedlogo,
    //       //   size: 60,
    //       // ),

    //       icon: const Icon(
    //         Icons.newspaper_sharp,
    //       ),
    //       selectedIcon: Padding(
    //          padding: EdgeInsets.all(10),
    //          child: Wrap(
    //           direction: Axis.horizontal,
    //           spacing: 10,
    //           children: [
    //             const Icon(
    //               Icons.newspaper_sharp,size: 20,color: Colors.white,
    //             ),
    //             Text('magazine',style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),)
    //           ],
    //         ),
    //       ),
    //     ),
    //     NavigationDestination(
    //       label: "home",
    //       icon: Icon(
    //         Icons.home,
    //         color: currentIndex == 2 ? Colors.white : Color(0xFF336699),
    //       ),
    //     ),
    //     NavigationDestination(
    //       label: "shop",
    //       icon: const Icon(
    //         Icons.shopping_bag,
    //       ),
    //     ),
    //     NavigationDestination(
    //       label: "polls",
    //       icon: const Icon(
    //         Icons.poll_sharp,
    //       ),
    //     ),
    //   ],
    // );
  }
}
