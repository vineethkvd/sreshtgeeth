import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreshtgeeth/common/base_colors.dart';

import 'controller/music_controller.dart';

class SeekBarData {
  late final Duration position;
  late final Duration duration;
  //final String songtile;

  SeekBarData(
    this.position,
    this.duration,
  );
}

class SeekBar extends StatefulWidget {
  final songid;
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;
  const SeekBar(
      {super.key,
      this.songid,
      required this.position,
      required this.duration,
      this.onChanged,
      this.onChangedEnd});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

MusicCon musiccon = Get.put(MusicCon());

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  String _formatDuration(Duration? duration) {
    String minutes = duration!.inMinutes.toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    // print(
    //     "${duration!.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds.toString().padLeft(2, '0')}");
    if (widget.position == widget.duration && minutes != '00') {
      //  musiccon.updatetimeapi(songid, artistid, albumid, )
      musiccon.updatetimeapi(
          widget.songid,
          musiccon.albumdetaildata?.album[0].albumId ?? "",
          "$minutes:$seconds");
    }
    if (duration == null) {
      return '--:--';
    } else {
      return '$minutes:$seconds';
    }
  }

  String _formatsDuration(Duration? duration) {
    String minutes = duration!.inMinutes.toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (widget.position == widget.duration) {
      //  musiccon.updatetimeapi(songid, artistid, albumid, )
    }
    if (duration == null) {
      return '--:--';
    } else {
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            _formatDuration(widget.position),
            style: TextStyle(color: whiteColor),
          ),
          Expanded(
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    trackHeight: 6,
                    thumbShape: const RoundSliderThumbShape(
                      disabledThumbRadius: 7,
                      enabledThumbRadius: 7,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 10,
                    ),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white.withOpacity(0.2),
                    thumbColor: Colors.white,
                    overlayColor: Colors.amber),
                child: Slider(
                  min: 0.0,
                  max: widget.duration.inMilliseconds.toDouble(),
                  value: min(
                     max(0.0,_dragValue ?? widget.position.inMilliseconds.toDouble()),
                      widget.position.inMilliseconds.toDouble()),
                  onChanged: (value) {
                    _dragValue = value;
                    setState(() {
                      if (widget.onChanged != null) {
                        widget
                            .onChanged!(Duration(milliseconds: value.round()));
                      }
                    });
                  },
                  onChangeEnd: (value) {
                    if (widget.onChangedEnd != null) {
                      widget.onChangedEnd!(
                        Duration(milliseconds: value.round()),
                      );
                    }
                    _dragValue = null;
                  },
                )),
          ),
          Text(
            _formatsDuration(widget.duration),
            style: TextStyle(color: whiteColor),
          ),
        ],
      ),
    );
  }
}
