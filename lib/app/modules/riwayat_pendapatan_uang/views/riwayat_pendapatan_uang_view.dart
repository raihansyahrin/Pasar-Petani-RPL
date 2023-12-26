import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_pendapatan_uang_controller.dart';

class RiwayatPendapatanUangView
    extends GetView<RiwayatPendapatanUangController> {
  const RiwayatPendapatanUangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiwayatPendapatanUangView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiwayatPendapatanUangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
