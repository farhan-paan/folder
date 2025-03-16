import 'package:flutter/material.dart';
import '../models/utama_model.dart'; // Import your model

class PaparanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          backgroundColor: Color(0xFF2B32B2),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 65, left: 12, right: 12),
            child: Row(
              children: [
                // Left side: 2 Pictures + 2 Icons
                Image.asset('assets/jatanegara.png', width: 40, height: 40, fit: BoxFit.cover),
                SizedBox(width: 8),
                Image.asset('assets/jpjlogo.png', width: 40, height: 40, fit: BoxFit.cover),
                SizedBox(width: 9),
                Icon(Icons.language_outlined, size: 30, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.help, size: 30, color: Colors.white),
                
                Spacer(), // Pushes the right-side icon to the end
                
                // Right side: 1 Icon
                Icon(Icons.menu, size: 30, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
      
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18), // Adjust the radius as needed
              bottomRight: Radius.circular(18),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFF2B32B2),
            ),
          ),

          // Dynamic ListView for Sections
          Expanded(
            child: ListView(
              
              padding: EdgeInsets.all(16),
              children: [ 
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/picture1.png'),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SYAFIQA ANEESA BINTI JOHARI',
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          'Orang Awam Malaysia',
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'syafigajohari@gmail.com',
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'STANDARD',
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                _buildSection('Pelesenan Kenderaan', UtamaModel.getPelesenanKenderaan(), context),
                _buildSection('Pelesenan Pemandu', UtamaModel.getPelesenanPemandu(), context),
                _buildSection('Penguatkuasaan', UtamaModel.getPenguatkuasaan(), context),
                _buildSection('Perhkidmatan Umum', UtamaModel.getPerkhidmatanUmum(), context), 
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color(0xFF2B32B2),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed, // Ensures all labels are shown
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Utama'),
        BottomNavigationBarItem(icon: Icon(Icons.mail_rounded), label: 'Peti Masuk'),
        BottomNavigationBarItem(icon: Icon(Icons.pin_drop_rounded), label: 'Direktori'),
        BottomNavigationBarItem(icon: Icon(Icons.safety_check), label: 'Profil'),
      ],
    ),

    );
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////// WIDGETTTTTTTTTTT SECTIONNNNNNN ////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Widget _buildSection(String title, List<UtamaModel> items, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFE8EAF6),
            borderRadius: BorderRadius.circular(12),
          ),
          child:LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true, // Ensures grid only takes needed space
                physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside grid
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220, // Adjusted for better responsiveness
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: constraints.maxWidth / (constraints.maxWidth * 0.55), // Auto-scale
                ),
                
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildItem(items[index], context);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildItem(UtamaModel item, BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, item.route),
    
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(item.iconPath),
            radius: 20, // Adjusted icon size
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              maxLines: 4, // Prevents excessive height
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}


}
