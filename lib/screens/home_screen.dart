import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Resposive(
          mobile: _HomeScreenMobile(
              trackingScrollController: _trackingScrollController),
          desktop: _HomeScreenDesktop(
              trackingScrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({super.key, required this.trackingScrollController});
  final TrackingScrollController trackingScrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Row(
        children: [
          Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
          const Spacer(),
          Container(
            width: 600,
            child: CustomScrollView(
              controller: trackingScrollController,
              slivers: [
                /*
    
                ========>  creating Story list
    
                */

                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 10.0),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      color: Resposive.isDesktop(context)
                          ? Colors.transparent
                          : Colors.white,
                      child: ListView.builder(
                        // padding: EdgeInsets.symmetric(horizontal: 8.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: stories.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _StoryCard(
                              isHasStory: false,
                              isAddStory: true,
                              currentUser: currentUser,
                            );
                          }
                          final Story story = stories[index - 1];
                          final user = onlineUsers[index - 1];
                          final isHasStoryInListView =
                              index % 2 == 0 ? true : false;
                          return _StoryCard(
                            isHasStory: isHasStoryInListView,
                            isAddStory: false,
                            currentUser: user,
                            story: story,
                          );
                        },
                      ),
                    ),
                  ),
                ),

                /*
    
                ========>  creating Post Section
    
                */
                SliverToBoxAdapter(
                  child: CreatPostContainer(
                    currentUser: currentUser,
                  ),
                ),
                /*
    
                ========>  creating active friends list 
    
                */
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Room(onlineUsers: onlineUsers),
                  ),
                ),

                /*
    
                ========>  creating Posts
    
                */
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: posts.length,
                    (context, index) {
                      return PostContainer(post: posts[index]);
                    },
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ContactsList(users:onlineUsers),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  _HomeScreenMobile({super.key, required this.trackingScrollController});
  final TrackingScrollController trackingScrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
      slivers: [
        //
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: false,
          actions: [
            CircleButton(
              icon: Icons.search,
              size: 30.0,
              onPreesed: () => print('circle button'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              size: 30.0,
              onPreesed: () => print('messenger'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatPostContainer(
            currentUser: currentUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Room(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 200,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 8.0),
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _StoryCard(
                      isHasStory: false,
                      isAddStory: true,
                      currentUser: currentUser,
                    );
                  }
                  final Story story = stories[index - 1];
                  final user = onlineUsers[index - 1];
                  final isHasStoryInListView = index % 2 == 0 ? true : false;
                  return _StoryCard(
                    isHasStory: isHasStoryInListView,
                    isAddStory: false,
                    currentUser: user,
                    story: story,
                  );
                },
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: posts.length,
            (context, index) {
              return PostContainer(post: posts[index]);
            },
          ),
        )
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final bool isHasStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard({
    super.key,
    required this.isAddStory,
    this.currentUser,
    this.story,
    required this.isHasStory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
              width: 110,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: CircleAvatar(
              backgroundColor:
                  isHasStory ? Palette.facebookBlue : Colors.transparent,
              radius: 23,
              child: isAddStory
                  ? Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      height: 40,
                      width: 40,
                      child: const Icon(Icons.add),
                    )
                  : ProfileAvatar(
                      imageUrl: currentUser!.imageUrl, isAcrive: false),
            ),
          ),
          Container(
            height: double.infinity,
            width: 110.0,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: Resposive.isDesktop(context)
                  ? const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0,
                      )
                    ]
                  : null,
            ), // BoxDecoration
          ), // Container
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              isAddStory ? 'Add Story' : currentUser!.name,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
