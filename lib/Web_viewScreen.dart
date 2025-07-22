import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  String? link;
  bool isLoading = true;
  bool hasError = false;
  bool noInternet = false;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    checkConnectivityAndFetchLink();
  }

  Future<void> checkConnectivityAndFetchLink() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        noInternet = true;
        isLoading = false;
      });
    } else {
      await fetchLink();
    }
  }

  Future<void> fetchLink() async {
    setState(() {
      isLoading = true;
      hasError = false;
      noInternet = false;
    });

    try {
      final response = await http
          .get(Uri.parse('http://10.121.94.232:3001/link'))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final url = data['url'] ?? 'https://meracredit.in';
        setState(() {
          link = url;
          isLoading = false;
        });
        _controller.loadRequest(Uri.parse(url));
      } else {
        throw Exception("Invalid status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Fetch error: $e");
      setState(() {
        link = 'https://meracredit.in';
        hasError = true;
        isLoading = false;
      });
      _controller.loadRequest(Uri.parse(link!));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF077367),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (noInternet) {
      return Scaffold(
        body: _buildErrorScreen("No Internet Connection"),
      );
    }

    if (link == null) {
      return Scaffold(
        body: _buildErrorScreen("Failed to load link"),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (hasError)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.red.withOpacity(0.8),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Fallback to default link',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: checkConnectivityAndFetchLink,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
