package {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Tip extends MovieClip {
		
		private var pointer:MovieClip;
		private var content:String;
		private var revealed:Boolean = false;
		
		public function Tip(_pointer:MovieClip) {
			
			this.x = 365;
			this.y = 218;
			
			this.pointer = _pointer;
			
			this.button.addEventListener(MouseEvent.CLICK, onOverButton, false, 0, true);
			this.button.addEventListener(MouseEvent.MOUSE_OUT, onOutButton, false, 0, true);
			
			this.addEventListener(Event.ENTER_FRAME, onPlay, false, 0, true);
			
		}
		
		public function getContent(_content:String):void {this.content = _content;}
		
		private function onOverButton(evt:MouseEvent):void {
			if(!this.revealed && this.pointer.canvas.move) {
				this.pointer.audio.PlaySound(this.pointer.audio.tipOver);
				this.gotoAndPlay("show");
				this.revealed = true;
			}
		}
		private function onOutButton(evt:MouseEvent):void {
			if(this.revealed && this.pointer.canvas.move) {
				this.gotoAndPlay("hide");
				this.revealed = false;
			}
		}
		
		private function onPlay(evt:Event):void {this.pointer.utilities.formatting(this.label, this.content, 0, true);}
		
	}
	
}