import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:pasar_petani/app/shared/widgets/profile_widget.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: secondaryShade3,
      child: Scaffold(
        body: RefreshIndicator(
          backgroundColor: Colors.white,
          color: secondaryColor,
          onRefresh: () async {
            controller.fetchUser();
          },
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: secondaryShade3,
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: ProfileWidget(
                      name: controller.user?.nama ?? "",
                      profile: controller.user?.fotoUrl ?? "",
                      email: controller.user?.email ?? "",
                      onPressed: () => Get.toNamed(Routes.CHANGE_PROFILE),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        ProfileListTile(
                          title: "Nama Lengkap",
                          subtitle: controller.user?.nama ?? "",
                        ),
                        ProfileListTile(
                          title: "Email",
                          subtitle: controller.user?.email ?? "",
                        ),
                        const ProfileListTile(
                          title: "Alamat",
                          // subtitle: controller.user?.alamat ?? "",
                          subtitle: 'Jl.Sukabirus No.3, Bojongsoang',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(),
                        ProfileListTile(
                          title: "Keamanan",
                          subtitle: "Ubah Password",
                          onTap: () => Get.toNamed(
                            Routes.CHANGE_PASSWORD,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 37,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Logout',
                              titlePadding: const EdgeInsets.only(
                                top: 28,
                              ),
                              content: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: whiteColor,
                                ),
                                height: 170, // Set the desired height here
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'Apakah anda yakin untuk logout dari akun ini',
                                        style: buttonLinkXSRegular.copyWith(
                                          color: bottomNavigationBarColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 44,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.logout();
                                        },
                                        child: const Text('Ya'),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 44,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Tidak'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/img/logout.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Logout Akun',
                                    style: body2Regular.copyWith(
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onTap;
  const ProfileListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: body2Regular.copyWith(
            color: bottomNavigationBarColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        onTap == null
            ? Text(
                subtitle,
                style: bodyRegular,
              )
            : GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subtitle,
                      style: bodyRegular,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff3D4754),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}
