import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plutofirstmusic/BLOC/bloc/trackbloc_bloc.dart';
import 'package:plutofirstmusic/screens/trackDetail.dart';

class HomeTracks extends StatefulWidget {
  const HomeTracks({super.key});

  @override
  State<HomeTracks> createState() => _HomeTracksState();
}

class _HomeTracksState extends State<HomeTracks> {
  final TrackblocBloc trackbloc = TrackblocBloc();
  @override
  void initState() {
    trackbloc.add(TrackInitialfetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracks"),
      ),
      body: BlocConsumer<TrackblocBloc, TrackblocState>(
        bloc: trackbloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case TrackFetchLoad:
              return const Center(child: CircularProgressIndicator());
            case TrackFetch:
              final successState = state as TrackFetch;
              return ListView.builder(
                  itemCount: successState.tracks.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue)),
                        child: Card(
                          shadowColor: Colors.black,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      successState.tracks[index].albumName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text(successState
                                          .tracks[index].artistName),
                                    ],
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => trackDetail(
                                                  trackid: successState
                                                      .tracks[index].trackId
                                                      .toString(),
                                                )));
                                  },
                                  child: const Text("Tap to see Lyrics "))
                              // Add other children to the Column as needed
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
// Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(successState.tracks[index].artistName),
//                           ],
//                         )