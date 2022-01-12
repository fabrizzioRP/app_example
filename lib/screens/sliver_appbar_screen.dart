// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatefulWidget {
  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  late ScrollController _scrollController;
  bool showLead = false;
  double top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 194.0) {
        showLead = true;
      } else {
        showLead = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                expandedHeight: 250,
                pinned: true,
                stretch: true,
                automaticallyImplyLeading: showLead,
                flexibleSpace: LayoutBuilder(
                  builder: (ctx, cons) {
                    // valor del height del expanded:
                    top = cons.biggest.height;
                    //debugPrint('$top');
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 300),
                        opacity: top <= 130 ? 1.0 : 0.0,
                        child: Row(
                          children: const [
                            SizedBox(width: 12),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
                            ),
                            SizedBox(width: 12),
                            Text('Guest'),
                          ],
                        ),
                      ),
                      background: Image.network(
                        'https://miro.medium.com/max/3200/0*NCBwYFewFf602uvF',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  primary: false,
                  shrinkWrap:
                      true, // Importante esto para que funcione el listview!!
                  itemCount: 12,
                  itemBuilder: (_, i) => Card(
                    child: ListTile(
                      trailing:
                          const Icon(Icons.delete, color: Colors.red, size: 28),
                      title: const Text('title'),
                      subtitle: const Text('subtitle'),
                      leading: Icon(Icons.edit,
                          color: Colors.yellow.shade900, size: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    // posicion donde comienza el Widget
    const double defaultMargin = 260;
    // posicion del Widget donde comienza a desparecer
    const double defaultStart = 240;
    // posicion del Widget donde se desvanecera
    const double defaultEnd = defaultStart / 2;

    // posicion del Widget
    double top = defaultMargin;

    // tamaño del Widget
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;

      if (offset < defaultMargin - defaultStart) {
        scale = 1.3;
      } else if (offset < defaultStart - defaultEnd) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 20,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale),
        child: FloatingActionButton(
          elevation: 0,
          tooltip: 'Picture',
          heroTag: 'scroll-floating',
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onPressed: () {},
          child: CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 25.0,
            backgroundImage: const NetworkImage(
                'https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
          ),
        ),
      ),
    );
  }
}
