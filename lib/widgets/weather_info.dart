// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key,required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration:BoxDecoration(
        gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter, colors:
        [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!,
        ])
      ),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:
        [
          Center(child:Text(weatherModel.cityName,style:TextStyle(fontSize:32.0,fontWeight:FontWeight.bold),),),
          SizedBox(height:5.0,),
          Center(child:Text('updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',style:TextStyle(fontSize:22.0,),),),
          SizedBox(height:10.0,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:
            [
              Image(image:NetworkImage('https:${weatherModel.image}')),
              SizedBox(width:10.0,),
              Text('${weatherModel.temp.round()}',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold),),
              SizedBox(width:10.0,),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:
                [
                  Text('maxTemp : ${weatherModel.maxTemp.round()}',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold),),
                  Text('minTemp : ${weatherModel.minTemp.round()}',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold),),
                ],
              )
            ],
          ),
          SizedBox(height:10.0,),
          Center(child:Text(weatherModel.weatherCondition,style:TextStyle(fontSize:32.0,fontWeight:FontWeight.bold),),),
        ],
      ),
    );
  }
}
