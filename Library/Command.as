package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Command extends MovieClip {
		
		private var pointer:MovieClip;
		
		public function Command(_pointer:MovieClip) {
			
			this.x = 365;
			this.y = 188;
			
			this.pointer = _pointer;
			
			this.back.addEventListener(MouseEvent.CLICK, onClickBack, false, 0, true);
			this.back.addEventListener(MouseEvent.MOUSE_OVER, onOverButton, false, 0, true);
			
		}
		
		private function onClickBack(evt:MouseEvent):void {this.pointer.MenuScreen();}
		private function onOverButton(evt:MouseEvent):void {this.pointer.audio.PlaySound(this.pointer.audio.itemOver);}
		
	}
	
}