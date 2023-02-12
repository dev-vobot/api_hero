import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sample_bloc.dart';
import 'sample_item_model.dart';
import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  const SampleItemListView({super.key});

  static const routeName = '/';

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  @override
  void initState() {
    context.read<SampleBloc>().add(FetchSample());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: SafeArea(
        child: BlocBuilder<SampleBloc, SampleState>(
          builder: (context, state) {
            return state is SampleProgress
                ? const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state is SampleSuccess
                    ? ListView.builder(
                        // Providing a restorationId allows the ListView to restore the
                        // scroll position when a user leaves and returns to the app after it
                        // has been killed while running in the background.
                        restorationId: 'sampleItemListView',
                        itemCount: state.samples.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Datum item = state.samples[index];
                          return ListTile(
                              title: Text('${item.id} . ${item.firstName.toUpperCase()} ${item.lastName.toUpperCase()}'),
                              subtitle: Text(item.email),
                              leading: CircleAvatar(
                                // Display the network image.
                                foregroundImage: NetworkImage(item.avatar),
                              ),
                              onTap: () {});
                        },
                      )
                    : state is SampleInitial
                        ? const Center(child: Text("Initializing"))
                        : const Center(child: Text("Failed to get data from api"));
          },
        ),
      ),
    );
  }
}
