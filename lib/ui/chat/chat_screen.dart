import 'package:flutter/cupertino.dart';
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
  final TextEditingController _textEditingController = TextEditingController();








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
          if (state is PostCreateSuccess) {
            showErrorBanner(state.message);
          }
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
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
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
                            itemCount: 15)),
                  )
                } else if (state is ChatSuccess) ...{
                  Expanded(
                    child: getChatItems(state.allPosts),
                  ),
                  TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        suffix: IconButton(
                            onPressed: () {
                              if (_textEditingController.text
                                  .trim()
                                  .isNotEmpty) {
                                context.read<ChatBloc>().add(CreatePost(
                                    _textEditingController.text.trim()));
                              }
                            },
                            icon:
                                Icon(CupertinoIcons.arrowtriangle_right_fill))),
                  )
                } else if (state is ChatFailure) ...{
                  showErrorBanner(state.errorMsg)
                }
              ],
            ),
          );
        },
      ),
    );
  }

  showErrorBanner(String message) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            message,
            style: TextStyle(fontSize: 25),
          ),
        ),
      );
}

getChatItems(GetAllPostsResponse allPosts) {
  List<PostResponse?>? posts =
      allPosts.order?.map((e) => allPosts.posts![e]).toList();

  return Container(
    alignment: AlignmentDirectional.topCenter,
    child: ListView.builder(
      itemCount: posts?.length ?? 0,
      reverse: true,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          mainAxisAlignment:
              posts![index]!.userId == '5ak9ej4hu7fcp8t91ef13h6mhw'
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  color: posts[index]!.userId == '5ak9ej4hu7fcp8t91ef13h6mhw'
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                posts[index]!.message!,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
