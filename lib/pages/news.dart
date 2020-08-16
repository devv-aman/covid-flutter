import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/news_details.dart';

import '../widgets/circular_loader.dart';
import '../widgets/headline_card.dart';

import '../providers/data.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _headlinesFetched = false;

  @override
  void didChangeDependencies() {
    if (!_headlinesFetched) {
      _headlinesFetched = true;
      COVIDData _dataProvider = Provider.of<COVIDData>(context);
      _dataProvider.fetchHeadlines();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    COVIDData _dataProvider = Provider.of<COVIDData>(context);
    List headlines = _dataProvider.getHeadlines;

    return headlines.length > 0
        ? SafeArea(
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today\'s headlines',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: ListView.builder(
                  itemBuilder: (ctx, ix) => InkWell(
                    child: HeadlineCard(headlines: headlines, index: ix),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        NewsDetails.routeName,
                        arguments: {
                          'id': headlines[ix]['id'],
                          'headline': headlines[ix]['headline'],
                          'image': headlines[ix]['image'],
                          'summary': headlines[ix]['summary'],
                        },
                      );
                    },
                  ),
                  itemCount: headlines.length,
                ),
              ),
            ]),
          )
        : Center(
            child: CircularLoader(
              Theme.of(context).primaryColor,
              Colors.white,
            ),
          );
  }
}
