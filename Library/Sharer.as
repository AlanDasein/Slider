package {
	
	import flash.net.SharedObject;
	
	public class Sharer {
		
		public var sharedObject:SharedObject;
		
		public function Sharer() {this.sharedObject = SharedObject.getLocal("sliderPuzzle");}
		
		public function GetValues(_index):String {
			
			var themes:Array;
			
			if(this.sharedObject.data.values) {themes = this.sharedObject.data.values.split("*theme*");}
			
			if(themes) {return themes[_index];}
			else {return null;}
			
		}
		
		public function SetValues(_themes:Array, _questions:Object):void {
			
			var values:String = "";
			
			try {
				
				for(var i:uint = 0;i < _themes.length;i++){values += (_questions[_themes[i]].STATUS + "*theme*");}
				
				this.sharedObject.data.values = values;
				this.sharedObject.flush();
				
			}
			catch(sharedObjectError:Error) {trace("Caught this error:", sharedObjectError.name, sharedObjectError.message);}
			
		}
		
	}
	
}