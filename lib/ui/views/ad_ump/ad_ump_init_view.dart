import 'package:flutter/material.dart';
import 'package:get_games/services/ad_ump_service/ad_ump_service.dart';
import 'package:get_games/ui/widgets/common/load_progress_indicator.dart';

class InitializeScreen extends StatefulWidget {
  final Widget targetWidget;

  const InitializeScreen({super.key, required this.targetWidget});

  @override
  State<InitializeScreen> createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeScreen> {
  final _initializationHelper = AdUmpService();

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: LoadProgressIndicator(),
      );

  Future<void> _initialize() async {
    final navigator = Navigator.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializationHelper.initialize();
      navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => widget.targetWidget),
      );
    });
  }
}
