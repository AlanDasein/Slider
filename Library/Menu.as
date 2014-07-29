package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Menu extends MovieClip {
		
		private var pointer:MovieClip;
		
		public var items:Array = new Array();
		
		public function Menu(_pointer:MovieClip, _x:Number, _y:Number, _text:String, _items:Array) {
			
			var pos:Number = _items.length == 3 ? 39.2 : 142.45;
			
			this.x = _x;
			this.y = _y;
			
			this.pointer = _pointer;
			
			this.pointer.utilities.formatting(this.label, _text, 0, false);
			
			for(var i:uint = 0;i < _items.length;i++) {
				
				items[i] = new Item(388, pos);
				
				this.pointer.utilities.formatting(this.items[i].label, _items[i], (_items[i] == this.pointer.level || _items[i] == this.pointer.theme) ? 0x00f6ff : 0, false);
				this.items[i].label.mouseEnabled = false;
				this.items[i].button.addEventListener(MouseEvent.CLICK, onClickButton, false, 0, true);
				this.items[i].addEventListener(MouseEvent.MOUSE_OVER, onOverItem, false, 0, true);
				this.pointer.addChild(items[i]);
				
				if(_items[i] == this.pointer.level || _items[i] == this.pointer.theme) {this.items[i].gotoAndStop(2);}
				
				pos += 21;
				
			}
			
		}
		
		private function onClickButton(evt:MouseEvent):void {
			
			for(var i:uint = 0;i < this.items.length;i++) {
				this.pointer.utilities.formatting(this.items[i].label, this.items[i].label.text, 0xffffff, false);
				this.items[i].gotoAndStop(1);
			}
			
			this.pointer.utilities.formatting(evt.target.parent.label, evt.target.parent.label.text, 0x00f6ff, false);
			evt.target.parent.gotoAndStop(2);
			
			if(this.items.length == 3) {this.pointer.level = evt.target.parent.label.text;}
			else {this.pointer.theme = evt.target.parent.label.text;}
			
		}
		
		private function onOverItem(evt:MouseEvent):void {this.pointer.audio.PlaySound(this.pointer.audio.itemOver);}
		
	}
	
}