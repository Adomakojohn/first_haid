import 'package:first_haid/core/widgets/bot_container.dart';
import 'package:first_haid/core/widgets/gradient_text.dart';
import 'package:first_haid/features/authentication/data/auth_services.dart';
import 'package:first_haid/features/home/widgets/health_article_widget.dart';
import 'package:first_haid/features/home/widgets/suggestions_widget.dart';
import 'package:first_haid/features/home/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SuggestionsWidget> suggestions = [
    const SuggestionsWidget(text: "Breast cancer"),
    const SuggestionsWidget(text: "Malaria"),
    const SuggestionsWidget(text: "Headaches"),
    const SuggestionsWidget(text: "Diarrhea"),
    const SuggestionsWidget(text: "Stomach Aches"),
    const SuggestionsWidget(text: "Colds and Flu"),
  ];

  final List<SuggestionsWidget> suggestionsTwo = [
    const SuggestionsWidget(text: "Cholera"),
    const SuggestionsWidget(text: "Hepatits A"),
    const SuggestionsWidget(text: "HIV/AIDS"),
    const SuggestionsWidget(text: "Diabetes"),
    const SuggestionsWidget(text: "Tuberclosis"),
    const SuggestionsWidget(text: "Heart Disease"),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerPage(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 7),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Open the drawer using GlobalKey
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Image.asset(
                        'assets/icons/menuIcon.png',
                        height: 38,
                      ),
                    ),
                    const SizedBox(
                      width: 75,
                    ),
                    const GradientText(
                      'Welcome, User',
                      style: TextStyle(fontSize: 20),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF01E1FE),
                          Color(0xFF1241C5),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const BotContainer(),
                const SizedBox(
                  height: 10,
                ),
                const GradientText(
                  'Suggestions',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF01E1FE),
                      Color(0xFF1241C5),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: suggestions[index],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          suggestionsTwo[index],
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const GradientText(
                  'Health Articles',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF01E1FE),
                      Color(0xFF1241C5),
                    ],
                  ),
                ),
                SizedBox(
                  height: 235,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: HealthArticleWidget(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
