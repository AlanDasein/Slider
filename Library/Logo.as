package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	public class Logo extends MovieClip {
		
		private var pointer:MovieClip;
		
		public function Logo(_pointer:MovieClip) {
			
			this.x = 10;
			this.y = 10;
			
			this.pointer = _pointer;
			
			this.contact.addEventListener(MouseEvent.CLICK, onClickContact, false, 0, true);
			this.stats.addEventListener(MouseEvent.CLICK, onClickStats, false, 0, true);
			this.help.addEventListener(MouseEvent.CLICK, onClickHelp, false, 0, true);
			this.view.addEventListener(MouseEvent.CLICK, onClickView, false, 0, true);
			
			this.contact.addEventListener(MouseEvent.MOUSE_OVER, onOverButton, false, 0, true);
			this.stats.addEventListener(MouseEvent.MOUSE_OVER, onOverButton, false, 0, true);
			this.help.addEventListener(MouseEvent.MOUSE_OVER, onOverButton, false, 0, true);
			this.view.addEventListener(MouseEvent.MOUSE_OVER, onOverButton, false, 0, true);
			
		}
		
		private function onClickContact(evt:MouseEvent):void {flash.net.navigateToURL(new URLRequest("http://www.linkedin.com/in/alanlara/"), "_blank");}
		private function onClickStats(evt:MouseEvent):void {this.pointer.PanelScreen("stats");}
		private function onClickHelp(evt:MouseEvent):void {this.pointer.PanelScreen("help");}
		private function onClickView(evt:MouseEvent):void {this.pointer.ViewScreen();}
		
		private function onOverButton(evt:MouseEvent):void {this.pointer.audio.PlaySound(this.pointer.audio.buttonOver);}
		
	}
	
}