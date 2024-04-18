import 'package:flutter/material.dart';

class CustomeGrid extends StatefulWidget {
  const CustomeGrid({super.key});

  @override
  State<CustomeGrid> createState() => _CustomeGridState();
}

class _CustomeGridState extends State<CustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "Ciao Alberto",
      "gambar": "ciaoalberto.jpg",
      "harga": 45000
    },
    {
      "judul": "The Simpson",
      "gambar": "thesimpson.jpg",
      "harga": 35000
    },
    {
      "judul": "Jungle Cruise",
      "gambar": "jungle_crulse.jpg",
      "harga": 50000
    },
    {
      "judul": "Home Alone",
      "gambar": "jungle.jpg",
      "harga": 45000
    },
    {
      "judul": "Kore Action",
      "gambar": "korea_action.jpg",
      "harga": 35000
    },
    {
      "judul": "A Monster Calls",
      "gambar": "a_monster_calls.jpg",
      "harga": 45000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custome Grid"),
        backgroundColor: Colors.green,
      ),

      body: GridView.builder(
          itemCount: listMovie.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_)=> DetailGrid(listMovie[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  footer: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${listMovie[index] ["judul"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text("Rp. ${listMovie[index]["harga"]}")
                      ],
                    ),
                  ),
                  child: Image.asset("gambar/${listMovie[index]["gambar"]}"),
                ),
              ),
            );
          }),
    );
  }
}

class DetailGrid extends StatelessWidget {
  final Map<String, dynamic> movieDetails;

  const DetailGrid(this.movieDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(movieDetails["judul"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "gambar/${movieDetails["gambar"]}",
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Judul: ${movieDetails["judul"]}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Harga: Rp. ${movieDetails["harga"]}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}