import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Avatar
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400",
                ),
              ),
              const SizedBox(height: 16),

              // Name
              const Text(
                "Albert Stevano",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),

              // Email
              const Text(
                "albert.stevano@example.com",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Info card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ProfileItem(
                        icon: Icons.phone,
                        title: "Phone",
                        subtitle: "+62 812 3456 7890",
                      ),
                      const Divider(),
                      ProfileItem(
                        icon: Icons.location_on,
                        title: "Address",
                        subtitle: "Jakarta, Indonesia",
                      ),
                      const Divider(),
                      ProfileItem(
                        icon: Icons.cake,
                        title: "Birthday",
                        subtitle: "January 15, 1990",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reusable untuk item profile
class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
