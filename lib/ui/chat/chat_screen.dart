import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';
import 'package:matter_most_app/ui/chat/chat_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ChatBloc(
            localRepository: localRepository,
            remoteRepository: remoteRepository);
        bloc.add(ChatStart());
        return bloc;
      },
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                if (state is ChatLoading) ...{
                  Expanded(
                    child: Shimmer.fromColors(
                        enabled: true,
                        child: ListView.separated(
                            itemBuilder: (context, index) => Row(
                                  mainAxisAlignment: index.isOdd
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          8, index == 0 ? 12 : 0, 8, 8),
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: 15),
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!),
                  )
                } else if (state is ChatSuccess) ...{
                  Expanded(
                    child: getChatItems(state.allPosts),
                  )
                }
              ],
            ),
          );
        },
      ),
    );
  }
}

getChatItems(GetAllPostsResponse allPosts) {
  List<PostResponse?>? posts =
      allPosts.order?.map((e) => allPosts.posts![e]).toList();

  return ListView.builder(
    itemCount: posts?.length ?? 0,
    itemBuilder: (context, index) => Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: posts![index]!.userId == 'wjjagne6ei8r7gaftq6z5ri8me'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              posts[index]!.message!,
            ),
          )
        ],
      ),
    ),
  );
}
