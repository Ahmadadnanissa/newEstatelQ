import 'package:estatelqapp/features/virtual_tour_feature/presentation/pages/virtual_tour_viewer_screen.dart';
import 'package:estatelqapp/features/virtual_tour_feature/presentation/providers/virtual_tour_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VirtualTourTestButton extends StatelessWidget {
  const VirtualTourTestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VirtualTourViewProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: provider.isLoading
                ? null
                : () async {
                    await provider.loadLatestTour();

                    if (!context.mounted) return;

                    if (provider.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Virtual Tour Error: ${provider.error}',
                          ),
                        ),
                      );
                      return;
                    }

                    final tour = provider.latestTour;

                    if (tour == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No Virtual Tour found.')),
                      );
                      return;
                    }

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => VirtualTourViewerScreen(
                          repository: provider.repository,
                          tourId: tour.id,
                        ),
                      ),
                    );
                  },
            icon: provider.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.threed_rotation),
            label: Text(
              provider.isLoading
                  ? 'Loading Virtual Tour...'
                  : 'View Virtual Tour',
            ),
          ),
        );
      },
    );
  }
}
