// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.white,
      appBar:AppBar(
        centerTitle:true,
        // backgroundColor:Colors.white,
        elevation:0.0,
        // leading:IconButton(onPressed:()
        // {
        //   Navigator.pop(context);
        // },
        //     icon:Icon(Icons.arrow_back_ios,color:Colors.blue,)),
        title:Text('Search a City',
           style:TextStyle(color:Colors.white),
         ),
      ),
      body:Form(
          key:formKey,
          child:Column(
          children:
           [
              SizedBox(height:20.0,),
              Padding(padding:EdgeInsets.all(16.0),child:TextFormField(
                onFieldSubmitted:(cityName)
                async {
                  if(formKey.currentState!.validate())
                  {
                    print(controller.text);
                    var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(cityName:cityName);
                    Navigator.pop(context);
                  }
                },
                validator:(value)
                {
                  if(value!.isEmpty)
                  {
                    return 'This Field Must Not Be Empty , Search for a City';
                  }
                  return null;
                },
                controller:controller,
                decoration:InputDecoration(
                  hintText:'Enter City Name',
                  labelText:'Search',
                  suffixIcon:IconButton(onPressed:(){},icon:Icon(Icons.search_outlined)),
                  border:OutlineInputBorder(),
                ),
              ),),
           ],
      )),
    );
  }
}