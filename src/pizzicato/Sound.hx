package pizzicato;
typedef SoundParam={
source:Forme,   
options:SoundOpts
}
typedef SoundOpts={
    type:String,
}
enum abstract Forme(String) from String to String{
   var wave;
}
@:native("Pizzicato.Sound")
extern class Sound{
public function new(params:SoundParam);
public function play(?when:Int,?offset:Int):Void;
public function stop():Void;
public var volume:Float; //(0->1)
public var frequency:Int;// = 880
}
