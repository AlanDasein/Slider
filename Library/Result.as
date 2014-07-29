package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Result extends MovieClip {
		
		public function Result() {
			
			this.x = 0;
			this.y = 83;
			
			this.addEventListener(Event.ENTER_FRAME, onShow, false, 0, true);
			
		}
		
		private function onShow(evt:Event):void {
			
			if(this.currentFrame == this.totalFrames) {
				stop();
				this.visible = false;
				this.removeEventListener(Event.ENTER_FRAME , onShow);
			}
			
		}
		
	}
	
}