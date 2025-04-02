import 'package:flutter/material.dart';
import 'dart:ui'; // Required for BackdropFilter
import 'wave.dart';

class JupiterPage extends StatelessWidget {
  const JupiterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // Make the entire page scrollable
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Aligns children horizontally
              children: [
                WaveText(
                  text: 'Jupiter',
                  textStyle: TextStyle(
                    fontSize: 72,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ), // Spacing between the title and the image
                Image.asset(
                  'images/jupiter.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 50,
                ), // Spacing between the image and the description
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ), // Blur effect
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(
                          51,
                        ), // Semi-transparent background
                        border: Border.all(
                          color: Colors.white.withAlpha(77), // Border
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(
                        16.0,
                      ), // Padding inside the container
                      child: const Text(
                        'Mercury is the closest planet to the Sun and the smallest planet in the Solar System.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacing before the grid
                Center(
                  child: SizedBox(
                    width:
                        MediaQuery.of(context).size.width *
                        0.5, // Half the screen width
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap:
                              true, // Ensures the grid takes only the necessary space
                          physics:
                              const NeverScrollableScrollPhysics(), // Disable grid scrolling
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                childAspectRatio: 4, // Grid items shape
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                          itemCount: 4, // Number of facts to display
                          itemBuilder: (context, index) {
                            final facts = [
                              'Radius: 2,439.7 km',
                              'Distance from Sun: 57.91 million km',
                              'Tilt: 0.034°',
                              'Known moons: None',
                            ];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Rounded corners
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ), // Blur effect
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(
                                      51,
                                    ), // Semi-transparent background
                                    border: Border.all(
                                      color: Colors.white.withAlpha(
                                        77,
                                      ), // Border
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    facts[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        ), // Spacing at the bottom of the page
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
