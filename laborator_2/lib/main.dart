import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Jakarta',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0; // Track current page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex =
            _pageController.page!.round(); // Update current index
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Header(),
              const SizedBox(height: 16),
              Image.asset(
                '../assets/home_card.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const SearchBar(),
              const SizedBox(height: 16),
              const SectionTitle(title: "Nearest Barbershop"),
              BarberCardList(
                barbers: [
                  Barber(
                      name: 'Alana Barbershop - Haircut massage & Spa',
                      location: 'Banguntapan (5 km)',
                      rating: 4.5,
                      imagePath: '../assets/list1.png'),
                  Barber(
                      name: 'Hercha Barbershop - Haircut & Styling',
                      location: 'Jalan Kaliurang (8 km)',
                      rating: 5.0,
                      imagePath: '../assets/list2.png'),
                  Barber(
                      name: 'Barberking - Haircut styling & massage',
                      location: 'Jogja Expo Centre (12 km)',
                      rating: 4.5,
                      imagePath: '../assets/list3.png'),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side:
                          const BorderSide(color: Color(0xFF363062), width: 2),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Color(0xFF363062),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Color(0xFF363062),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: "Most Recommended"),
              BarberCardList(
                barbers: [
                  Barber(
                      name: 'Masterpiece Barbershop',
                      location: 'Jogja Expo Centre (2 km)',
                      rating: 5.0,
                      imagePath: '../assets/barbershop.jfif',
                      isRecommended: true),
                ],
              ),
              const SizedBox(height: 16),
              // Carousel section
              Column(
                children: [
                  // Pagination dots above the carousel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildPageIndicator(),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      height: 400,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: BarberCard(
                                    barber: Barber(
                                      name: 'Varcity Barbershop',
                                      location: 'Condongcatur (10 km)',
                                      rating: 4.5,
                                      imagePath: '../assets/list4.png',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: BarberCard(
                                    barber: Barber(
                                      name: 'Twinsky Monkey Barber',
                                      location: 'Jl Taman Siswa (8 km)',
                                      rating: 5.0,
                                      imagePath: '../assets/list5.png',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: BarberCard(
                                    barber: Barber(
                                      name: 'Barberman',
                                      location: 'J-Walk Centre (17 km)',
                                      rating: 4.5,
                                      imagePath: '../assets/list6.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // pagination dots
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(5, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPageIndex == index ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPageIndex == index
                ? const Color(0xFF363062)
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

// Remaining classes remain unchanged
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Color(0xFF363062)),
            SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Yogyakarta', style: TextStyle(color: Colors.grey)),
                Text(
                  'Joe Samanta',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827)),
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage('../assets/profile_picture.png'),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(color: Color(0xFF8683A1), fontSize: 14),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search barber's, haircut service...",
              hintStyle:
                  const TextStyle(color: Color(0xFF8683A1), fontSize: 14),
              fillColor: const Color(0xFFEBF0F5),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFC8D5E1)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF363062),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, size: 20),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
      ],
    );
  }
}

class Barber {
  final String name;
  final String location;
  final double rating;
  final String imagePath;
  final bool isRecommended;

  Barber({
    required this.name,
    required this.location,
    required this.rating,
    required this.imagePath,
    this.isRecommended = false,
  });
}

class BarberCardList extends StatelessWidget {
  final List<Barber> barbers;

  const BarberCardList({super.key, required this.barbers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: barbers.map((barber) => BarberCard(barber: barber)).toList(),
    );
  }
}

class BarberCard extends StatelessWidget {
  final Barber barber;

  const BarberCard({super.key, required this.barber});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child:
          barber.isRecommended ? _buildRecommendedCard() : _buildStandardCard(),
    );
  }

  Widget _buildRecommendedCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.asset(
            barber.imagePath,
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
        _buildCardContent(),
      ],
    );
  }

  Widget _buildStandardCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            barber.imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildCardContent()),
      ],
    );
  }

  Widget _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(barber.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827))),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFF8683A1), size: 16),
              const SizedBox(width: 4),
              Text(barber.location, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star_rounded,
                  color: Color(0xFF8683A1), size: 16),
              const SizedBox(width: 4),
              Text(barber.rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
