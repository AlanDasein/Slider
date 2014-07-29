package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	public class Panel extends MovieClip {
		
		private var pointer:MovieClip;
		
		public var record:Array = new Array();
		
		public function Panel(_pointer:MovieClip, _screen) {
			
			var format:TextFormat = new TextFormat();
			
			var output:String;
			
			var posX:Number = 97;
			var posY:Number = 112.5;
			var incX:Number = 62.15;
			var incY:Number = 42;
			var counter:uint = 0;
			
			this.x = 0;
			this.y = 0;
			
			this.pointer = _pointer;
			
			this.gotoAndStop(_screen);
			
			if(_screen == "stats") {
				
				format.font = "Verdana";
				format.size = 11;
				
				for(var i:uint = 0;i < this.pointer.THEMES.length;i++) {
					
					for(var j:uint = 0;j < 3;j++) {
						
						output = this.pointer.QUESTIONS[this.pointer.THEMES[i]].STATUS[j].toString();
						
						format.color = output == "0" ? 0xFF0000 : 0;
						
						record[counter] = new TextField();
						record[counter].width = 60;
						record[counter].x = posX;
						record[counter].y = posY + (incY * j);
						record[counter].autoSize = TextFieldAutoSize.CENTER;
						record[counter].defaultTextFormat = format;
						record[counter].text = output == "0" ? "X" : output;
						
						this.pointer.addChild(record[counter]);
						
						counter++;
						
					}
					
					posX += incX;
					
				}
				
			}
			
			this.back.addEventListener(MouseEvent.MOUSE_OVER, onOverButton, false, 0, true);
			this.back.addEventListener(MouseEvent.CLICK, onClickButton, false, 0, true);
			
		}
		
		private function onOverButton(evt:MouseEvent):void {this.pointer.audio.PlaySound(this.pointer.audio.itemOver);}
		private function onClickButton(evt:MouseEvent):void {this.pointer.MenuScreen();}
		
	}
	
}