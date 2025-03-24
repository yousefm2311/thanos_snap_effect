import 'package:flutter/material.dart';
import 'package:thanos_snap_effect/thanos_snap_effect.dart';
import 'package:thanos_snap_effectt/home_page_view.dart';

class DeleteAnimationScreen extends StatefulWidget {
  const DeleteAnimationScreen({super.key});

  @override
  State<DeleteAnimationScreen> createState() => _DeleteAnimationScreenState();
}

class _DeleteAnimationScreenState extends State<DeleteAnimationScreen> {
  final List<int> _item = List.generate(20, (index) => index);
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _removeItem(int index) {
    final removedItem = _item.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Snappable(
          animation: Animation.fromValueListenable(
            animation,
            transformer: (value) => 1 - value,
          ),
          child: HomePageView(index: removedItem, onDelete: () {}),
        ),
      ),
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Animation')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _item.length,
        itemBuilder: (context, index, animation) {
          return HomePageView(
            index: _item[index],
            onDelete: () => _removeItem(index),
          );
        },
      ),
    );
  }
}
