// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/home_view_body.dart';
import 'package:weather_app/widgets/weather_info.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.white,
      appBar:AppBar(
        // backgroundColor:Colors.white,
        elevation:0.0,
        // centerTitle:true,
        title:Text('Weather App',
          style:TextStyle(fontSize:22.0,fontWeight:FontWeight.bold,color:Colors.white),
        ),
        actions:
        [
          IconButton(onPressed:()
          {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>SearchView()));
          },icon:Icon(Icons.search_outlined,color:Colors.white,)),
        ],
      ),
      body:BlocBuilder<GetWeatherCubit,WeatherState>(builder:(context,state)
      {
        if(state is WeatherInitialState)
        {
          return homeViewBody();
        } else if (state is WeatherLoadedState)
        {
          return WeatherInfo(weather:state.weatherModel,);
        } else
        {
          return Text('Ops!, There is an Error , Please Try Later');
        }
      }),
    );
  }
}