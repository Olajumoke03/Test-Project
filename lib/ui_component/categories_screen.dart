import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_project_github/category_provider.dart';
import 'package:test_project_github/model/catgegory_model.dart';
import 'package:test_project_github/model/home_news_model.dart';
import 'package:test_project_github/ui_component/dummy_news_details.dart';
import 'package:test_project_github/ui_component/news_by_category.dart';
import 'package:test_project_github/ui_component/news_details_screen.dart';
import 'package:test_project_github/ui_component/search_screen.dart';

class CategoriesScreen extends StatefulWidget {
  final List<String> selectedCategories;
  final Function (List<String>)? onCategoriesChanged;

  const CategoriesScreen({super.key, required this.selectedCategories, this.onCategoriesChanged});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<String> topics = [
    '#EndSARS', 'Africa', 'Americas', 'Appointments', 'Arts', 'Aviation',
    'Business', 'Cartoons', 'Celebrity', 'Columnists', 'Commentary',
    'Contributors', 'Diet', 'Editorial', 'Education', 'Energy', 'Environment'
  ];

  final List<String> section = [
     'Guardian Life', 'Guardian Woman', 'Guardian Arts', 'Marie Claire'
  ];

  @override
  void initState() {
    // Fetch categories when the screen initializes
    Future.delayed(Duration.zero, () {
      final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      categoryProvider.loadPreferences(); // Load selected categories from SharedPreferences

      // categoryProvider.fetchCategories();
    });    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;


    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Text('Discover',
                style:  GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 25
            ),
            ),
            // const Spacer(),
            // const Icon(Icons.access_time, color: Colors.black,)
          ],
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),

              const SizedBox(height: 15.0,),

              Text("Interested Categories",
                style:  GoogleFonts.montserrat(
                    fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
               ),

              const SizedBox(height: 6.0,),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 9,
                  // mainAxisSpacing: 0,
                  childAspectRatio: 2.2,
                ),
                itemCount: categoryProvider.categories.length,
                itemBuilder: (context, index) {
                  final categoryItem = categoryProvider.categories[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsByCategoryScreen(title: categoryItem.categoryName!),
                          )
                      );
                    },

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 250,
                          decoration: BoxDecoration(
                              color: const Color(0XFFE5E7DC),
                              borderRadius: BorderRadius.circular(13.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(categoryItem.categoryName!, style: const TextStyle(fontSize: 16, color: Color(0XFF373037),
                              ),
                              ),
                              const SizedBox(width: 5.0,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
                                  child: const Icon(Icons.category_rounded, size: 40, color: Colors.grey,))
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                      ],
                    ),
                  );


                },
              ),


              const SizedBox(height: 15.0,),
              Text("Other Categories",
                style:  GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),
              ),

              const SizedBox(height: 5.0,),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 9,
                  // mainAxisSpacing: 0,
                  childAspectRatio: 1.6,
                ),
                itemCount: section.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DummyNewsDetailScreen(
                            imageUrl: 'https://example.com/image.jpg',
                            title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
                            author: 'Andy Corbley',
                            timeAgo: '1hr ago',
                            comments: 8,
                            likes: 34,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          // width: 250,
                          decoration: BoxDecoration(
                              // color: const Color(0XFFECE6F0).withOpacity(0.8),
                              color: const Color(0XFFE1DAE1),
                              borderRadius: BorderRadius.circular(13.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(section[index],
                                 style: const TextStyle(fontSize: 17, color: Color(0XFF373037),
                              ),
                              ),
                              const SizedBox(width: 5.0,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                                  child: const Icon(Icons.category_rounded, size: 35, color: Colors.grey,)
                              )
                            ],
                          ),
                        ),
                        //       Expanded(
                        //         child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(8),
                        //   child: Stack(
                        //     children: [
                        //       Image.network(
                        //         'https://picsum.photos/200/200?random=1',
                        //         fit: BoxFit.cover,
                        //         width: double.infinity,
                        //         height: 200,
                        //       ),
                        //       Positioned.fill(
                        //         child: BackdropFilter(
                        //           filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        //           child: Container(
                        //             color: Colors.black.withOpacity(0.3),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               'Print Edition',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 24,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //         // child: ClipRRect(
                        //         //   borderRadius: BorderRadius.circular(8),
                        //         //   child: Image.network(
                        //         //     'https://picsum.photos/200/200?random=${index + 20}',
                        //         //     fit: BoxFit.cover,
                        //         //     width: double.infinity,
                        //         //   ),
                        //         // ),
                        //       ),
                        const SizedBox(height: 8),

                      ],
                    ),
                  );
                },
              ),


              // Wrap(
              //   spacing: 8,
              //   runSpacing: 8,
              //   children: widget.selectedCategories.map((category) {
              //     return Chip(
              //       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              //       label: Text(category),
              //       backgroundColor: Colors.blue[100],
              //     );
              //   }).toList(),
              // ),

              const SizedBox(height: 10.0,),

              const Divider(color: Color(0XFFCAC4D0),),

              const SizedBox(height: 10.0,),

              const Text("All Categories", style: TextStyle(
                  fontSize: 20,
                  // color: Color(0XFF1D1B20)
              ),),

              const SizedBox(height: 15.0,),


              ListView.builder(
                itemCount: topics.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(topics[index], style: TextStyle(fontSize: 16),),

                      const Divider(color: Color(0XFFCAC4D0),),
                    ],
                  );
                },
              )


              // GridView.builder(
              //   padding: const EdgeInsets.all(16),
              //   shrinkWrap: true,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 16,
              //     mainAxisSpacing: 16,
              //     childAspectRatio: 0.75,
              //   ),
              //   itemCount: 10,
              //   itemBuilder: (context, index) {
              //     return GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => NewsDetailScreen(
              //               imageUrl: 'https://example.com/image.jpg',
              //               title: 'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
              //               author: 'Andy Corbley',
              //               timeAgo: '1hr ago',
              //               comments: 8,
              //               likes: 34,
              //             ),
              //           ),
              //         );
              //       },
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Expanded(
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(8),
              //               child: Image.network(
              //                 'https://picsum.photos/200/200?random=${index + 20}',
              //                 fit: BoxFit.cover,
              //                 width: double.infinity,
              //               ),
              //             ),
              //           ),
              //           const SizedBox(height: 8),
              //           Text(
              //             'Category ${index + 1}',
              //             style: const TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen()));
      },
      child: Row(
        children: [
          Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Search for topics or news',
                hintStyle: GoogleFonts.montserrat(
                  color: Colors.grey[700],
                ),
                // hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100]),
              ),
            ),

          // const SizedBox(width: 16),
          // Container(
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: mainColor,
          //   ),
          //   child: IconButton(
          //     icon: const Icon(Icons.notifications_none, color: Colors.white),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
