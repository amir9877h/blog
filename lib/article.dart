import 'package:blog/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 111,
        height: 48,
        child: FloatingActionButton(
          onPressed: () {
            showSnackBar(context, 'Like Button Pressed!');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 4,
              ),
              const Text('2.1K'),
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
          SliverAppBar(
            // pinned: true,
            // floating: true,
            title: const Text('Article'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
              const SizedBox(
                width: 16,
              )
            ],
          ),
          SliverList(
            // crossAxisAlignment: CrossAxisAlignment.start,
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Text(
                    'Article title here!',
                    style: themeData.textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Assets.img.stories.story9
                            .image(width: 48, height: 48, fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Author Name',
                              style: themeData.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text('2m ago',
                                style: themeData.textTheme.bodySmall),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showSnackBar(context, 'Share Button Pressed!');
                          },
                          icon: Icon(
                            Icons.share,
                            color: themeData.colorScheme.primary,
                          )),
                      IconButton(
                          onPressed: () {
                            showSnackBar(context, 'Bookmark Button Pressed!');
                          },
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            color: themeData.colorScheme.primary,
                          ))
                    ],
                  ),
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    child: Assets.img.background.singlePost.image()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                  child: Text(
                    'main title of your Article...',
                    style: themeData.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque id nibh tortor id. Nunc consequat interdum varius sit amet mattis vulputate enim. Vestibulum mattis ullamcorper velit sed ullamcorper. Orci eu lobortis elementum nibh tellus molestie nunc non. Sagittis id consectetur purus ut faucibus pulvinar elementum integer enim. Tellus in hac habitasse platea. Odio aenean sed adipiscing diam donec adipiscing tristique. In vitae turpis massa sed elementum tempus egestas sed sed. Congue eu consequat ac felis donec et odio.\nPharetra pharetra massa massa ultricies mi quis hendrerit dolor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Quam vulputate dignissim suspendisse in est ante in nibh. Lobortis mattis aliquam faucibus purus in massa tempor. Lectus sit amet est placerat. Nulla facilisi cras fermentum odio eu feugiat pretium. Dictum varius duis at consectetur lorem donec massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Consequat ac felis donec et odio pellentesque. Vitae semper quis lectus nulla at volutpat. Eget nulla facilisi etiam dignissim diam quis enim. Feugiat nisl pretium fusce id velit ut. Odio morbi quis commodo odio. Diam maecenas ultricies mi eget. Nec dui nunc mattis enim ut tellus elementum sagittis. Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant.\nCras semper auctor neque vitae tempus quam. Neque vitae tempus quam pellentesque nec nam. Eget mauris pharetra et ultrices neque ornare aenean. Semper viverra nam libero justo laoreet sit amet. Nibh venenatis cras sed felis eget velit aliquet sagittis id. Ut venenatis tellus in metus vulputate eu scelerisque. Ultricies lacus sed turpis tincidunt. Tincidunt id aliquet risus feugiat in ante metus dictum at. Lectus proin nibh nisl condimentum id. Condimentum lacinia quis vel eros donec ac odio. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Libero id faucibus nisl tincidunt eget nullam non nisi est. Turpis egestas maecenas pharetra convallis posuere. Egestas egestas fringilla phasellus faucibus scelerisque eleifend. Diam volutpat commodo sed egestas egestas fringilla. Dictum non consectetur a erat nam at lectus urna.',
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ]),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 116,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  themeData.colorScheme.surface,
                  // Colors.transparent
                  themeData.colorScheme.surface.withOpacity(0)
                ])),
          ),
        )
      ]),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
