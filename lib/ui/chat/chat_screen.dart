import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';
import 'package:matter_most_app/data/utils/utils.dart';
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
        bloc.add(ChatStartEvent());
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
                    child: buildShimmerChat(),
                  )
                } else if (state is ChatSuccess) ...{
                  Expanded(
                    child:
                        getChatItems(posts: state.posts, orders: state.orders),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          onSubmitted: (value) {
                            context
                                .read<ChatBloc>()
                                .add(CreatePostEvent(value));
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => showFilePicker(),
                            );
                          },
                          icon: Icon(
                            CupertinoIcons.paperclip,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {
                            if (_textEditingController.text.trim().isNotEmpty) {
                              context.read<ChatBloc>().add(CreatePostEvent(
                                  _textEditingController.text.trim()));

                              _textEditingController.text = '';
                            }
                          },
                          icon: Icon(
                            CupertinoIcons.arrowtriangle_right_fill,
                            color: Colors.grey,
                          ))
                    ],
                  )
                } else if (state is ChatFailure) ...{
                  showErrorBanner(state.errorMsg)
                } else if (state is ChatIsEmpty) ...{
                  Center(
                    child: Text('empty chat'),
                  )
                },
              ],
            ),
          );
        },
      ),
    );
  }

  Shimmer buildShimmerChat() {
    return Shimmer.fromColors(
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
                      margin: EdgeInsets.fromLTRB(8, index == 0 ? 12 : 0, 8, 8),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ],
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
            itemCount: 15));
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

  Widget showFilePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        spacing: 20,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runSpacing: 20,
        children: [
          filePickerItem(Icons.image, 'Image', () async {
            'On Tap image'.toErrorPrint();
            FilePickerResult? result = await FilePicker.platform
                .pickFiles(type: FileType.image, allowMultiple: true);
            if (result != null) {
              result.paths.forEach((element) {
                element.toString().toSuccessPrint();
              });
            }
          }),
          filePickerItem(CupertinoIcons.video_camera, 'video', () async {
            'On Tap video'.toErrorPrint();
            FilePickerResult? result = await FilePicker.platform
                .pickFiles(type: FileType.video, allowMultiple: true);
            if (result != null) {
              result.paths.forEach((element) {
                element.toString().toSuccessPrint();
              });
            }
          }),
          filePickerItem(CupertinoIcons.music_note, 'music', () async {
            'On Tap music'.toErrorPrint();
            FilePickerResult? result = await FilePicker.platform
                .pickFiles(type: FileType.audio, allowMultiple: true);
            if (result != null) {
              result.paths.forEach((element) {
                element.toString().toSuccessPrint();
              });
            }
          }),
          filePickerItem(CupertinoIcons.archivebox, 'File', () async {
            'On Tap File'.toErrorPrint();
            FilePickerResult? result = await FilePicker.platform
                .pickFiles(type: FileType.any, allowMultiple: true);
            if (result != null) {
              result.paths.forEach((element) {
                element.toString().toSuccessPrint();
              });
            }
          }),
          filePickerItem(CupertinoIcons.doc, 'Documents', () async {
            'On Tap Documents'.toErrorPrint();
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowMultiple: true,
                allowedExtensions: [
                  'pdf',
                  'txt',
                  'dox',
                ]);
            if (result != null) {
              result.paths.forEach((element) {
                element.toString().toSuccessPrint();
              });
            }
          }),
        ],
      ),
    );
  }
}

getChatItems(
    {required List<String> orders, required Map<String, PostResponse> posts}) {
  List<PostResponse?> allPosts = orders.map((e) => posts[e]).toList();

  return Container(
    alignment: AlignmentDirectional.topCenter,
    child: ListView.builder(
      reverse: true,
      itemCount: posts.length ?? 0,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          mainAxisAlignment:
              allPosts[index]!.userId == '5ak9ej4hu7fcp8t91ef13h6mhw'
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  color: allPosts[index]!.userId == '5ak9ej4hu7fcp8t91ef13h6mhw'
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                allPosts[index]!.message!,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget filePickerItem(IconData icon, String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150), color: Colors.blue),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(title)
      ],
    ),
  );
}
