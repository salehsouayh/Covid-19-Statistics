Widget _list() {
    return
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 7),
              padding: EdgeInsets.all(10.0),
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(30.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Colors.black12,
                      blurRadius: 6
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.build, color: Colors.white,),),
                  SizedBox(width: 8),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                 child:  Text(
                    'Flutter Lesson',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15),
                 ),
                  ),
                  Spacer(),
                  GestureDetector(
                  child: IconButton(icon: Icon(Icons.info_outline, color: Colors.white,), onPressed: () {
                    print('détails clicked');
                  } ,)
                  ),
                ],
              ),
            );

  }