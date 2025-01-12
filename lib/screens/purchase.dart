import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/services/data_transport.dart' as data_transport;
import '../common/services/utils.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  bool isLoading = true;
  List<dynamic> creditPackages = [];
  Map<int, bool> loadingButtons = {};

  @override
  void initState() {
    super.initState();
    getCreditWalletData();
  }

  Future<void> getCreditWalletData() async {
    setState(() {
      isLoading = true;
    });
    await data_transport.get(
      'credit-wallet/credit-wallet-data',
      context: context,
      onSuccess: (responseData) {
        setState(() {
          creditPackages = getItemValue(
              responseData, 'data.creditWalletData.creditPackages');
          isLoading = false;
        });
      },
      onError: (error) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading packages')),
        );
      },
    );
  }

  void initiatePayment({
    required String value,
    required String credits,
    required BuildContext context,
    required int index,
  }) async {
    setState(() {
      loadingButtons[index] = true;
    });

    try {
      await data_transport.post(
        'https://bedaya.com.tr/public/api/credit-wallet/order-credit',
        inputData: {
          'value': value,
          'credits': credits,
        },
        onFailed: (responseData) async {
          final url = responseData!['url'];

          if (url != null && url.isNotEmpty) {
            final shouldProceed = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Payment Confirmation'),
                  content:
                  const Text('You will be redirected to the payment page. Do you want to proceed?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Proceed'),
                    ),
                  ],
                );
              },
            );

            if (shouldProceed == true) {
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to open the URL')),
                );
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to retrieve URL from the server')),
            );
          }
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error occurred during the operation')),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unexpected error occurred')),
      );
    } finally {
      setState(() {
        loadingButtons[index] = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Packages'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : creditPackages.isEmpty
          ? const Center(child: Text('No packages available'))
          : ListView.builder(
        itemCount: creditPackages.length,
        itemBuilder: (context, index) {
          final package = creditPackages[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                package['packageImageUrl'],
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
              ),
              title: Text(package['package_name'] ?? 'Unnamed'),
              subtitle: Text(
                'Price: ${package['price']}\nCredits: ${package['credit']}',
              ),
              trailing: loadingButtons[index] == true
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  initiatePayment(
                    value: package['price'].toString(),
                    credits: package['credit'].toString(),
                    context: context,
                    index: index,
                  );
                },
                child: const Text('Buy Now'),
              ),
            ),
          );
        },
      ),
    );
  }
}
