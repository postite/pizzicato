import pizzicato.Sound;
import js.html.MouseEvent;
import pizzicato.Sound.Forme;
import js.Browser.document as doc;
import js.Browser.window as win;
import tink.CoreApi;
class Main {
	var  mousedown:Signal<js.html.MouseEvent>;
	var  mouseup:Signal<js.html.MouseEvent>;
	var  mousemove:Signal<js.html.MouseEvent>;
	var sound:Sound;
	public function new(){

		js.Browser.document.addEventListener("DOMContentLoaded", init);
		 mousedown= makeSignal(doc, 'mousedown');
		 mouseup= makeSignal(doc, 'mouseup');
		 
	}
	static function main() {
		trace("Hello, world!");
		new Main();
		
	}	

	 function init() {
		trace("init");
		// var pizzi = new pizzicato.Pizzicato();

		sound = new pizzicato.Sound({
			source: wave,
			options: {
				type: 'sawtooth'
			}
		});
	var moved:CallbackLink;
		//sawtoothWave.play();
		mousedown.handle(e->{
			sound.play();
			mousemove= makeSignal(doc, 'mousemove');
			moved=mousemove.handle(moove);
			
			trace("down");e;
			});
		mouseup.handle(e->{
			trace("up");
			sound.stop();
			moved.cancel();
			e;
			}
			);
		
	}


	function moove(e:MouseEvent){
			var scale= postite.math.Matools.scale([0,win.innerWidth],[0,1],e.clientX);
			trace( scale);
			sound.volume=scale;
			sound.frequency=Std.int(
				postite.math.Matools.scale([0,win.innerHeight],[0,2000],e.clientY)
			);
	}





	function makeSignal<A:js.html.Event>(dispatcher:js.html.Document, type:String):Signal<A> 
  return Signal.ofClassical(
    dispatcher.addEventListener.bind(type),
    dispatcher.removeEventListener.bind(type)
  );


	


}
