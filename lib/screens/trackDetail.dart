import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLOC/bloc/trackbloc_bloc.dart';

class trackDetail extends StatefulWidget {
  trackDetail({required this.trackid, super.key});
  String trackid;

  @override
  State<trackDetail> createState() => _trackDetailState();
}

class _trackDetailState extends State<trackDetail> {
  final TrackblocBloc trackbloc = TrackblocBloc();
  @override
  void initState() {
    // trackbloc.add(Trackdetailfetch(trackid: widget.trackid));
    trackbloc.add(TrackLyricsfetch(trackid: widget.trackid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TrackDetails"),
      ),
      body: BlocConsumer<TrackblocBloc, TrackblocState>(
        bloc: trackbloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case TrackLyricsload:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Tracklyricsfetch:
              final successtate = state as Tracklyricsfetch;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Lyrics")],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(successtate.lyrics),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
