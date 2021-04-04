import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.MAIN_COLOR,
        title: Text(
          TranslatorUtil.text('about'),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/1-1-2.png'),),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Joonaak Driver App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Version 0.1.0',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'About Joonaak',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.MAIN_COLOR),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  //color: Colors.green.withOpacity(),
                    color: AppColor.MAIN_COLOR.withAlpha(400),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text(
                      'At Joonaak, We aim to offer last-mile',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text('connectivity between people and business while',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('continually integrate technology and develop',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('effective solutions of superior quality and value',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('to help your business grow and expand.',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.MAIN_COLOR),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  //color: Colors.green.withOpacity(),
                    color: AppColor.MAIN_COLOR.withAlpha(400),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '(+855)-11 984 988',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text('(+855)-10 984 988',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('info@joonaak.com',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/icons/facebook-app-logo.png')),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child:
                            Image.asset('assets/icons/instagram.png')),
                      ],
                    ),
                    Text('Joonaak',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Acknowledgement',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.MAIN_COLOR),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  //color: Colors.green.withOpacity(),
                    color: AppColor.MAIN_COLOR.withAlpha(400),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Joonaak Tech Team',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Mr. LeangSeng Youra',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('Mr. Sok Channy',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('Ms. Chhay Chanrithiya',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('Mr. Lor Meanhuot',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text('\@ 2020 Joonaak Enterprise Solutions Co. LTD \| All rights reserved.',style: TextStyle(fontSize: 12),),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
