package {
	
	import flash.display.MovieClip;
	
	public class Tile extends MovieClip {
		
		public var corX:Number;
		public var corY:Number;
		public var ind:uint;
		
		public function Tile(_width, _height, _x:Number, _y:Number, _corX, _corY, _ind) {
			
			this.width = _width;
			this.height = _height;
			
			this.x = _x;
			this.y = _y;
			
			this.corX = _corX;
			this.corY = _corY;
			
			this.ind = _ind;
			
		}
		
	}
	
}