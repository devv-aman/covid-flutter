import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/info_scrollview.dart';
import '../widgets/circular_loader.dart';

import '../providers/data.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool _helplineNoFetched = false;

  @override
  void didChangeDependencies() {
    if (!_helplineNoFetched) {
      _helplineNoFetched = true;
      COVIDData _dataProvider = Provider.of<COVIDData>(context);
      _dataProvider.fetchHelplineNumbers();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    COVIDData _dataProvider = Provider.of<COVIDData>(context);
    List<dynamic> _helplineNos = _dataProvider.getHelplineNos;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Symptoms'),
            InfoScrollView(InfoScrollViewType.SYMPTOMS),
            SizedBox(
              height: 12.0,
            ),
            SectionTitle('Prevention'),
            InfoScrollView(InfoScrollViewType.PREVENTIONS),
            SectionTitle('Helpline Number'),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 15.0,
              ),
              child: _helplineNos.length == 0
                  ? CircularLoader(
                      Theme.of(context).primaryColor,
                      Colors.white,
                    )
                  : Column(
                      children: [
                        ..._helplineNos.map(
                          (helpLineMap) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    launch(
                                        "tel://${helpLineMap['state_or_UT']}");
                                  },
                                  child: Text(
                                    helpLineMap['helpline_number'],
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromRGBO(68, 39, 39, 1),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '(${helpLineMap['state_or_UT']})',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String _title;

  SectionTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        top: 24.0,
      ),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
