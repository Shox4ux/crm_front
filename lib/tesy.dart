import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AdminPanelApp());
}

class AdminPanelApp extends StatefulWidget {
  const AdminPanelApp({super.key});

  @override
  State<AdminPanelApp> createState() => _AdminPanelAppState();
}

class _AdminPanelAppState extends State<AdminPanelApp> {
  // Toggle for simulation
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Premium Admin Panel',
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // LIGHT MODE PALETTE
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA), // Soft Pearl Grey
        primaryColor: const Color(0xFF6366F1), // Soft Blue/Indigo
        cardColor: Colors.white,
        dividerColor: const Color(0xFFE2E8F0),
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        colorScheme: const ColorScheme.light(
          surface: Colors.white,
          onSurface: Color(0xFF1E293B), // Deep Charcoal text
          primaryContainer: Color(0xFFEEF2FF), // Pale Blue
        ),
        useMaterial3: true,
      ),
      // DARK MODE PALETTE
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Deep Charcoal
        primaryColor: const Color(0xFF818CF8), // Muted Lavender
        cardColor: const Color(0xFF1E293B), // Muted Navy
        dividerColor: const Color(0xFF334155),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF1E293B),
          onSurface: Color(0xFFF1F5F9), // Soft White text
          primaryContainer: Color(0xFF312E81), // Deep Muted Purple
        ),
        useMaterial3: true,
      ),
      home: DashboardLayout(toggleTheme: toggleTheme, isDark: isDarkMode),
    );
  }
}

class DashboardLayout extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const DashboardLayout({
    super.key,
    required this.toggleTheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 1. SIDEBAR (Glassy/Soft)
          Container(
            width: 260,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(
                right: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo Area
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFF6366F1),
                  child: Icon(Icons.dashboard_rounded, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Nexus Admin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 40),
                // Menu Items
                _MenuItem(
                  icon: Icons.grid_view_rounded,
                  label: "Dashboard",
                  isActive: false,
                ),
                _MenuItem(
                  icon: Icons.shopping_bag_outlined,
                  label: "Orders",
                  isActive: true,
                ),
                _MenuItem(
                  icon: Icons.people_outline_rounded,
                  label: "Clients",
                  isActive: false,
                ),
                _MenuItem(
                  icon: Icons.inventory_2_outlined,
                  label: "Warehouse",
                  isActive: false,
                ),
                const Spacer(),
                // Theme Toggle
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PremiumCard(
                    padding: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dark Mode",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Switch.adaptive(
                          value: isDark,
                          onChanged: (v) => toggleTheme(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 2. MAIN CONTENT AREA
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Orders Management",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=32",
                        ),
                      ),
                    ],
                  ),
                ),
                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // KPI Cards
                        Row(
                          children: const [
                            Expanded(
                              child: KPICard(
                                title: "Total Orders",
                                value: "1,240",
                                trend: "+12%",
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: KPICard(
                                title: "Pending",
                                value: "34",
                                trend: "-5%",
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: KPICard(
                                title: "Completed",
                                value: "1,102",
                                trend: "+8%",
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Screen #7: Order List
                        const OrderListTable(),
                      ],
                    ),
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

// --- COMPONENTS ---

class KPICard extends StatelessWidget {
  final String title, value, trend;
  final Color color;
  const KPICard({
    super.key,
    required this.title,
    required this.value,
    required this.trend,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: Theme.of(context).hintColor)),
              Icon(
                Icons.more_horiz_rounded,
                color: Theme.of(context).hintColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              trend,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderListTable extends StatelessWidget {
  const OrderListTable({super.key});

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      padding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Text(
                  "Recent Orders",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                const Chip(
                  label: Text("Filter"),
                  avatar: Icon(Icons.filter_list_rounded, size: 16),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Theme.of(context).dividerColor),
          // Table Header
          _row(
            context,
            isHeader: true,
            id: "#ID",
            name: "Customer",
            amount: "Amount",
            status: "Status",
            date: "Date",
          ),
          // Table Rows
          _row(
            context,
            id: "#8231",
            name: "Alice Johnson",
            amount: "\$120.50",
            status: "Completed",
            date: "Nov 24",
            statusColor: Colors.green,
          ),
          _row(
            context,
            id: "#8232",
            name: "Mark Spencer",
            amount: "\$85.00",
            status: "Pending",
            date: "Nov 24",
            statusColor: Colors.orange,
          ),
          _row(
            context,
            id: "#8233",
            name: "Dory Grey",
            amount: "\$210.20",
            status: "Processing",
            date: "Nov 23",
            statusColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context, {
    bool isHeader = false,
    required String id,
    required String name,
    required String amount,
    required String status,
    required String date,
    Color? statusColor,
  }) {
    TextStyle style = TextStyle(
      fontWeight: isHeader ? FontWeight.w600 : FontWeight.normal,
      color: isHeader
          ? Theme.of(context).hintColor
          : Theme.of(context).colorScheme.onSurface,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: isHeader
            ? null
            : Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.5),
                ),
              ),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(id, style: style)),
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: isHeader
                  ? style
                  : style.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(flex: 1, child: Text(amount, style: style)),
          Expanded(
            flex: 1,
            child: isHeader
                ? Text(status, style: style)
                : Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor!.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
          Expanded(flex: 1, child: Text(date, style: style)),
          if (!isHeader)
            const Icon(Icons.edit_outlined, size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}

class PremiumCard extends StatelessWidget {
  final Widget child;
  final double padding;
  const PremiumCard({super.key, required this.child, this.padding = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20), // 20px Rounding as requested
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: isActive
          ? BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            )
          : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).hintColor,
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isActive
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
