import 'package:final_sorawit/models/Wold_item.dart';
import 'package:final_sorawit/models/api.dart';
import 'package:flutter/material.dart';

class WoldClubList extends StatefulWidget {
  const WoldClubList({Key? key}) : super(key: key);

  @override
  State<WoldClubList> createState() => _WoldClubListState();
}

class _WoldClubListState extends State<WoldClubList> {

  List<WoldItem>? _woldListt;
  var _isLoading = false;
  String? _errMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/bg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            /*
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleClickButton,
              child: const Text('GET FOOD DATA'),
            ),
          ),
           */
            SizedBox(height: 5,),
            Expanded(
              child: Container(
                child: Image.asset("assets/image/logo.png", width: 500,height: 200,),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  if (_woldListt != null)
                    ListView.builder(
                      itemBuilder: _buildListItem,
                      itemCount: _woldListt!.length,
                    ),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator()),
                  if(_errMessage != null && !_isLoading)
                    Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(24.0),
                          child: Text(_errMessage!),),
                        ElevatedButton(
                          onPressed: () {
                            _fetchFoodData();
                          },
                          child: Text("RETRY"),),
                      ],
                    )),
                ],
              ),
            ),
            Container(
              width: 1500,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: _fetchFoodData,
                child: const Text('VIEW RESULT' , style: TextStyle(color: Colors.red , fontSize: 28)),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),

    );
  }

  void _fetchFoodData() async {
    setState(() {
      //_foodList = null;
      _isLoading = true;
    });
    try{
      var data = await Api().fetch('');
      setState(() {
        _woldListt = data.map<WoldItem>((item) => WoldItem.fromJson(item)).toList();
        _isLoading = false;
      });
    }
    catch(e){
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildListItem(BuildContext context, int index) {
    var foodItem = _woldListt![index];

    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(
              foodItem.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0),
            Text(foodItem.team),
          ],
        ),
      ),
    );
  }
}
/*
Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/bg.png"),
                  fit: BoxFit.cover),
            ),
            child: const Text(
              'Image in fullscreen',
              style: TextStyle(fontSize: 34, color: Colors.red),
            ),
          ),
 */
/*
Column(
        children: [
          /*
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleClickButton,
              child: const Text('GET FOOD DATA'),
            ),
          ),
           */

          Expanded(
            child: Stack(
              children: [
                if (_woldListt != null)
                  ListView.builder(
                    itemBuilder: _buildListItem,
                    itemCount: _woldListt!.length,
                  ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
                if(_errMessage != null && !_isLoading)
                  Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(24.0),
                        child: Text(_errMessage!),),
                      ElevatedButton(
                        onPressed: () {
                          _fetchFoodData();
                        },
                        child: Text("RETRY"),),
                    ],
                  )),
              ],
            ),
          ),
        ],
      ),
 */