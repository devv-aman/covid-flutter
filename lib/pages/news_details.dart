import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  static String routeName = '/news-details';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> newsDetails =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                children: [
                  Hero(
                    tag: newsDetails['id'],
                    child: Image.network(
                      newsDetails['image'],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.only(
                        bottom: 21.0,
                        left: 32.0,
                        right: 12.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        newsDetails['headline'],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              collapseMode: CollapseMode.parallax,
              stretchModes: [StretchMode.zoomBackground],
            ),
            // collapsedHeight: 120,
            titleSpacing: 10.0,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    newsDetails['summary'],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 800,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
