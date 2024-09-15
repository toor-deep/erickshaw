import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                children: [
                  buildOnboardingPage(
                    title: "Book a Ride",
                    description: "Easily book a ride to your destination.",
                    image: AppImages.on1,
                  ),
                  buildOnboardingPage(
                    title: "Choose Your Vehicle",
                    description: "Select from various vehicle types.",
                    image: AppImages.on2,
                  ),
                  buildOnboardingPage(
                    title: "Track Your Driver",
                    description: "Track your driver in real-time.",
                    image: AppImages.on3
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Colors.blue,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            SizedBox(height: 20),
            isLastPage
                ? ElevatedButton(
              onPressed: () {
                // Navigate to the main app
              },
              child: Text("Get Started"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage({
    required String title,
    required String description,
    required String image,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        SizedBox(height: 32),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
