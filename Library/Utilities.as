package {
	
	import flash.text.*;
	
	public class Utilities {
		
		private var format:TextFormat;
		
		public function Utilities() {}
		
		public function formatting(_field:TextField, _text:String, _newcolor:int, _html):void {
			
			this.format = _field.getTextFormat(0, 1);
			
			if(_newcolor > 0) {this.format.color = _newcolor;}
			
			if(_html) {_field.htmlText = _text;}
			else {_field.text = _text.replace("&", "?");}
			
			_field.setTextFormat(this.format);
			
		}
		
		public function rearranging(_pieces:Array):Array {
		
			var rand:uint, i:uint, j:uint;
			var sume:uint = 0;
			var total:uint = _pieces.length;
			var aux:Object = new Object();
			
			for(i = 0;i < total;i++) {_pieces[i] += i.toString();}
			
			while(sume % 2 == 0) {
				
				sume = 0;
				
				for(i = 0;i < total;i++) {
					rand = int(Math.random() * total);
					aux = _pieces[i];
					_pieces[i] = _pieces[rand]; 
					_pieces[rand] = aux;
				}
				
				for(i = 0;i < total - 1;i++) {
					
					aux = parseInt(_pieces[i]);
					
					for(j = i;j < total;j++) {
						if(_pieces[i] < _pieces[j]) {sume++;}
					}
					
				}
				
			}
			
			for(i = 0;i < total;i++) {_pieces[i] = _pieces[i].substring(0,1);}
			
			return _pieces;
			
		}
		
	}
	
}