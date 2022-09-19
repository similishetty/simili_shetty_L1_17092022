import 'package:flutter/material.dart';
import 'package:simili_shetty_l1_17092022/screens/movie_details_screen.dart';
import 'package:simili_shetty_l1_17092022/utils/app_colors.dart';
import 'package:simili_shetty_l1_17092022/utils/custom_app_data.dart';

class ChooseMovieScreen extends StatefulWidget {
  const ChooseMovieScreen({Key? key}) : super(key: key);

  @override
  _ChooseMovieScreenState createState() => _ChooseMovieScreenState();
}

class _ChooseMovieScreenState extends State<ChooseMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("Choose Movie"),
        centerTitle: true,

      ),
      body: SingleChildScrollView(

        child: Column(
         children: [

           Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextFormField(
               style: const TextStyle(color: AppColors.white),
               decoration: InputDecoration(
                   isDense: true,
                   contentPadding: const EdgeInsets.fromLTRB(15, 15, 10, 0),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     borderSide: const BorderSide(
                       width: 0,
                       style: BorderStyle.none,
                     ),
                   ),
                    filled: true,
                   hintStyle: TextStyle(color: AppColors.white.withOpacity(0.6)),
                   hintText: "Search",
                   prefixIcon: Icon(Icons.search,color:AppColors.white.withOpacity(0.6) ,),
                   suffixIcon: Icon(Icons.mic,color:AppColors.white.withOpacity(0.6) ,),
                   fillColor: AppColors.iconBgColor),
             ),
           ),
           movieList(tite: "Now Playing",movieData: AppData.nowPlaying),
           movieList(tite: "Coming Soon",movieData: AppData.comingSoon),
           movieList(tite: "Top Movies",movieData: AppData.topMovies)
           ,movieList(tite: "Coming Soon",movieData: AppData.comingSoon),
           movieList(tite: "Drama Picks",movieData: AppData.topMovies),
           movieList(tite: "Fan Favorites",movieData: AppData.nowPlaying),
         ],
        ),
      ) ,
    );
  }

  Widget movieList({required String tite, required List<String> movieData}){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tite,style: const TextStyle(color: AppColors.white,fontSize: 17,fontWeight: FontWeight.w700),),
          const SizedBox(height:20,),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: movieData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context , int index) =>
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const MovieDetailsScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(movieData[index],fit: BoxFit.fill,),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
