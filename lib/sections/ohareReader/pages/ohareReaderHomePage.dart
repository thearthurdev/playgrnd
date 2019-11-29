import 'package:flutter/material.dart';
import 'package:playgrnd/sections/ohareReader/utils/selectTextFile.dart';
import 'package:playgrnd/utils/constants.dart';

class OhareReader extends StatefulWidget {
  @override
  _OhareReaderState createState() => _OhareReaderState();
}

class _OhareReaderState extends State<OhareReader> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = kThemeBrightness(context);
    Color accentColor = Theme.of(context).accentColor;

    String desc =
        'Read large paragraphs, memorize lines and amaze your friends with Oharé Reader. Select any text file and transform it into a carousel of fast moving text and be surprised at your ability to read along! You can rewind, forward, replay and adjust the reading speed to your specification. There\'s also a shuffle mode which literally makes no sense. So what are you waiting for?';

    return Scaffold(
      appBar: AppBar(
        // title: Text('Oharé Reader'),
        // centerTitle: true,
        backgroundColor:
            brightness == Brightness.light ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
          color: brightness == Brightness.light ? Colors.black : Colors.white,
        ),
        brightness:
            brightness == Brightness.light ? Brightness.light : Brightness.dark,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30.0),
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    color: accentColor,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Oharé Reader',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Righteous',
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: AnimatedCrossFade(
                    firstChild: Text(
                      desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    secondChild: Text(
                      desc,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: kThemeAnimationDuration,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    isExpanded ? 'less' : 'more',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Quicksand',
                      color: accentColor,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 8.0),
                    child: Text(
                      'Select Text File...',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Quicksand',
                        color: accentColor,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    SelectTextFile().openFileExplorer(context);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: -25,
            // alignment: Alignment(0.5, 0.5),
            child: Container(
              width: kScreenAwareSize(250.0, context),
              height: kScreenAwareSize(250.0, context),
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius:
                    BorderRadius.circular(kScreenAwareSize(50.0, context)),
                image: DecorationImage(
                  image: AssetImage('assets/images/ohare.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}