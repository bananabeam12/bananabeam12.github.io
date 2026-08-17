import 'dart:ui';

import 'package:flutter/material.dart';

const primary = Color(0xFF0972ae);
const primaryShade = Color(0xFF075988);

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C5282),
        ),
      ),
      home: const SingleScreenProfile(),
    );
  }
}

class SingleScreenProfile extends StatelessWidget {
  const SingleScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information",
        style: TextStyle(
          fontWeight: FontWeight.normal
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.chevron_left),
        backgroundColor: primary, 
        foregroundColor: const Color.fromARGB(255, 238, 238, 238),
        surfaceTintColor: Colors.transparent, 
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Header Area with Avatar Overlay
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Image Header Background
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primary
                  ),
                  child: Image.network('https://plus.unsplash.com/premium_vector-1689096891818-5c18c6ccf630?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlapping Profile Picture
                Positioned(
                  top: 130,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xFFE2E8F0),
                      foregroundImage: NetworkImage('https://scontent-mnl1-1.xx.fbcdn.net/v/t39.30808-6/486868871_2029326974226319_8077378397231255079_n.jpg?stp=dst-jpg_tt6&cstp=mx1080x1350&ctp=s1080x1350&_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGAJ1-o_oiu5aRMQQCCatn4GUZgU1XXv7wZRmBTVde_vCuhHNboquzvntlnwpdhXUH6QCqogNH89hacPwtaEHMw&_nc_ohc=syuObyHfQjwQ7kNvwEadz-f&_nc_oc=AdqQM_s4jwSAUsYsf0G4UN4AOAXDdSxL_4R7ARWbLU_WYlwUX4pvqUN1IPJky9_LV5M&_nc_zt=23&_nc_ht=scontent-mnl1-1.xx&_nc_gid=uHleSPm2AVaKc4Pf0CDtJA&_nc_ss=7b2a8&oh=00_AQH6tnz3ZBMa2vEZXXm0yigEV5_iHA92XkCkZKZvdgv30w&oe=6A88DFDD',
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Profile Header Information
            const Text(
              'Noel E. Mercadal',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A202C),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'BS Information Technology • 3rd Year (3IT-B)',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 12),

            // Edit Profile Button Placeholder
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Profile editted successfully!'),
                    backgroundColor: primaryShade,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    duration: const Duration(seconds: 2), 
                  ),
                );
              },
              icon: const Icon(Icons.edit_outlined, size: 18),
              label: const Text(
                'Edit Profile',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
            ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(thickness: 1, color: Color(0xFFE2E8F0)),
            ),
           const SizedBox(height: 8),

            // Main Info List Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Personal Details'),
                  const SizedBox(height: 8),

                  _buildInfoTile(
                    icon: Icons.badge_outlined,
                    label: 'Nickname',
                    value: 'Noel',
                  ),
                  _buildInfoTile(
                    icon: Icons.cake_outlined,
                    label: 'Age',
                    value: '21 years old',
                  ),
                  _buildInfoTile(
                    icon: Icons.calendar_today_outlined,
                    label: 'Birthday',
                    value: 'December 2, 2004',
                  ),
                  _buildInfoTile(
                    icon: Icons.location_on_outlined,
                    label: 'Address',
                    value: '123 Address Street, Mamatid, Cabuyao',
                  ),
                  _buildInfoTile(
                    icon: Icons.sports_esports_outlined,
                    label: 'Hobby',
                    value: 'Coding, Graphic Design, Gaming, Reading Manwha, Anime',
                  ),
                  _buildInfoTile(
                    icon: Icons.format_quote_outlined,
                    label: 'Motto',
                    value: 'It is what it is.',
                  ),

                  const SizedBox(height: 20),
                  _buildSectionHeader('Academic Details'),
                  const SizedBox(height: 8),

                  _buildInfoTile(
                    icon: Icons.school_outlined,
                    label: 'Course / Program',
                    value: 'BS Information Technology',
                  ),
                  _buildInfoTile(
                    icon: Icons.layers_outlined,
                    label: 'Year Level & Section',
                    value: '3nd Year — Section 3IT-B',
                  ),
                  _buildInfoTile(
                    icon: Icons.menu_book_outlined,
                    label: 'Favorite Subject',
                    value: 'Object-Oriented Programming',
                  ),
                  _buildInfoTile(
                    icon: Icons.code_outlined,
                    label: 'Programming Languages',
                    value: 'HTML, CCS, Javascript, Java, Dart, SQL',
                  ),
                  _buildInfoTile(
                    icon: Icons.build_outlined,
                    label: 'Technical Skill',
                    value: 'MySQL, Git Version Control, Tailwind CSS',
                  ),
                  _buildInfoTile(
                    icon: Icons.flag_outlined,
                    label: 'Career Goal',
                    value: 'Front-End Software Engineer & App Developer',
                  ),
                  _buildInfoTile(
                    icon: Icons.psychology_outlined,
                    label: 'Academic Interest',
                    value: 'Front-End Design Patterns & Architecture',
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Label Header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: primary,
        ),
      ),
    );
  }

  // Single Standard Information Row (Matching Reference Image)
  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(214, 226, 232, 240), // Divider color
            width: 1.0
          )
        )
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(17, 43, 76, 126),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: primaryShade,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Value and Label Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}