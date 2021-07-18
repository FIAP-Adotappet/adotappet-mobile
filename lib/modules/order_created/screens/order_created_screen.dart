import 'package:adotappet/constants/app_constants.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:flutter/material.dart';

class OrderCreatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leftSlide = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SideMenuBar(),

          // Content page
          Transform(
            transform: Matrix4.identity()..translate(-leftSlide),
            alignment: Alignment.center,
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.grey.shade200, Colors.white]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Scaffold(
                  appBar: CustomAppBar(isHome: true),
                  extendBody: true,
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 100.0, horizontal: 60.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/sucesso.png')),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Obrigado!',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget mollis mauris, quis eleifend erat. Aliquam accumsan condimentum lorem, vel malesuada libero porttitor eget. Sed lorem velit, accumsan eget massa ut, elementum aliquam odio. Nulla lobortis varius enim congue volutpat. Curabitur egestas vestibulum porta. Quisque elementum nibh risus, nec vehicula purus lobortis ut. Nunc condimentum interdum sapien, sed commodo nunc scelerisque et. Nullam dui dui, aliquet non eleifend sed, rutrum nec lacus. Pellentesque commodo lacus et sapien mollis euismod. Cras porttitor justo et finibus viverra. Suspendisse potenti. Duis blandit augue eget dui mattis, vel imperdiet ante molestie.',
                            maxLines: 6,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
