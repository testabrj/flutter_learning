import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(),
       body: DraggableCard(
         child: FlutterLogo(size: 128),

       ),
       );

  }



}

class DraggableCard extends StatefulWidget {

  final Widget child;

  const DraggableCard({Key key, this.child}) : super(key: key);

  @override
  DraggableCardState createState() => DraggableCardState();
}

class DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;

  void runAnimation(Offset pixelsPerSecond, Size size){



    _animation = _animationController.drive(
                  AlignmentTween(begin:_dragAlignment ,end: Alignment.center ));

    final unitsPerSecondX = pixelsPerSecond.dx/size.width;
    final unitsPerSecondY = pixelsPerSecond.dy/ size.height;
    final unitOffset = Offset(unitsPerSecondX,unitsPerSecondY);
    final unitVelocity = unitOffset.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness:1 ,
      damping: 1
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _animationController.animateWith(simulation);

//    _animationController.reset();
//    _animationController.forward();

  }


  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: new Duration(seconds: 1));
    _animationController.addListener((){
        setState(() {
          _dragAlignment = _animation.value;
        });

    });
    super.initState();

  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return GestureDetector(
      onPanDown: (details){
        _animationController.stop();
      },
      onPanEnd: (details){
        runAnimation(details.velocity.pixelsPerSecond,size);
      },
       onPanUpdate: (details) {
         setState(() {
           _dragAlignment += Alignment(
             details.delta.dx/(size.width/2),
             details.delta.dy/(size.height/2)
           );
         });

       },
       child:Align(
        alignment: _dragAlignment,
        child: Card(
            child: widget.child,
          ),
    ),);
  }

}