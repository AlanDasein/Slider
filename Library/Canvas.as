package {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.*;
	
	public class Canvas extends MovieClip {
		
		private var pointer:MovieClip;
		
		public var line:String;
		public var chars:uint;
		public var sets:uint;
		public var attemps:uint;
		public var timer:Timer;
		public var tiles:Array = new Array();
		public var values:Array = new Array();
		public var move:Boolean = true;
		
		public function Canvas(_pointer:MovieClip) {
			
			var pieces:Array;
			var aux:String;
			var hole:uint, i:uint;
			var wd:Number, hg:Number, posX:Number, posY:Number, incX:Number, incY:Number;
			var counter:uint = 0;
			
			this.x = 10;
			this.y = 10;
			
			this.pointer = _pointer;
			
			this.line = this.pointer.QUESTIONS[this.pointer.theme][this.pointer.level];
			this.chars = this.line.length + 1;
			this.sets = Math.sqrt(chars);
			this.attemps = 0;
			
			pieces = this.pointer.utilities.rearranging(this.line.split(""));
			hole = int(Math.random() * chars);
			
			wd = chars > 20 ? 64.5 : chars > 10 ? 80.5 : 108;
			hg = chars > 20 ? 53 : chars > 10 ? 66.6 : 89.3;
			incX = chars == 16 ? 0.75 : 0.5;
			incY = chars > 10 ? 0.8 : 0.7;
			
			for(i = 0;i < chars;i++) {
				
				posX = i % sets == 0 ? 16 : posX + (wd + incX);
				posY = i < sets ? 16 : i % sets == 0 ? posY + (hg + incY) : posY;
				
				if(i == hole) {tiles[i] = null;}
				else {
					
					this.tiles[i] = new Tile(wd, hg, posX, posY, incX, incY, i);
					this.pointer.utilities.formatting(this.tiles[i].label, pieces[counter++], 0, false);
					if(this.tiles[i].label.text == false) {
						this.tiles[i].cover.visible = true;
						this.tiles[i].cover.mouseEnabled = false;
					}
					this.tiles[i].label.mouseEnabled = false;
					this.tiles[i].addEventListener(MouseEvent.CLICK, onClickTile, false, 0, true);
					
					this.pointer.addChild(tiles[i]);
					
				}
				
			}
			
			this.pointer.sample.gotoAndStop(this.line);
			
			this.pointer.utilities.formatting(this.pointer.command.label, "which " + this.pointer.QUESTIONS[this.pointer.theme].LABELS[sets - 3], 0, false);
			
			this.pointer.tip.getContent(this.pointer.QUESTIONS[this.pointer.theme].TIPS[sets - 3]);
			
			this.timer = new Timer(10);
			
		}
		
		public function onClickTile(evt:MouseEvent):void {
			
			var ind:uint = evt.target.parent.ind;
			var chars:uint = this.pointer.canvas.chars;
			var sets:uint = this.pointer.canvas.sets;
			var mark:Number = 0;
			var dir:String;
			
			if(this.pointer.canvas.move){
				
				if(ind % sets > 0 && ind - 1 >= 0 && this.pointer.canvas.tiles[ind - 1] == null) {
					mark = evt.target.parent.x - (evt.target.parent.width + evt.target.parent.corX);
					dir = "left";
				}
				else{
					if(ind - sets >= 0 && this.pointer.canvas.tiles[ind - sets] == null) {
						mark = evt.target.parent.y - (evt.target.parent.height + evt.target.parent.corY);
						dir = "top";
					}
					else {
						if((ind + 1) % sets > 0 && ind + 1 < chars && this.pointer.canvas.tiles[ind + 1] == null) {
							mark = evt.target.parent.x + (evt.target.parent.width + evt.target.parent.corX);
							dir = "right";
						}
						else {
							if(ind + sets < chars && this.pointer.canvas.tiles[ind + sets] == null) {
								mark = evt.target.parent.y + (evt.target.parent.height + evt.target.parent.corY);
								dir = "bottom";
							}
						}
					}
				}
				
				mark = int((mark)*100)/100;
				
				if(mark > 0){
					
					move = false;
					
					this.pointer.canvas.values = [mark, ind, dir];
					
					this.pointer.canvas.timer.addEventListener(TimerEvent.TIMER, MoveTile, false, 0, true);
					this.pointer.canvas.timer.start();
					
					this.pointer.audio.PlaySound(this.pointer.audio.tileSliding);
					
				}
			
			}
			
		}
		
		public function MoveTile(evt:TimerEvent):void {
			
			var i:uint;
			var aux:MovieClip;
			var serie:String = "";
			
			switch(this.values[2]){
				
				case "left":
					if(this.tiles[this.values[1]].x != this.values[0]) {
						if(this.tiles[this.values[1]].x - 10 > this.values[0]) {this.tiles[this.values[1]].x -= 10;}
						else {
							this.tiles[this.values[1]].x = this.values[0];
							if(this.tiles[this.values[1]].x != this.values[0]) {this.values[0] = this.tiles[this.values[1]].x;}
						}
					}
					else {
						i = this.values[1] - 1;
						this.move = true;
					}
					break;
				
				case "top":
					if(this.tiles[this.values[1]].y != this.values[0]) {
						if(this.tiles[this.values[1]].y - 10 > this.values[0]) {this.tiles[this.values[1]].y -= 10;}
						else {
							this.tiles[this.values[1]].y = this.values[0];
							if(this.tiles[this.values[1]].y != this.values[0]) {this.values[0] = this.tiles[this.values[1]].y;}
						}
					}
					else {
						i = this.values[1] - this.sets;
						this.move = true;
					}
					break;
				
				case "right":
					if(this.tiles[this.values[1]].x != this.values[0]) {
						if(this.tiles[this.values[1]].x + 10 < this.values[0]) {this.tiles[this.values[1]].x += 10;}
						else {
							this.tiles[this.values[1]].x = this.values[0];
							if(this.tiles[this.values[1]].x != this.values[0]) {this.values[0] = this.tiles[this.values[1]].x;}
						}
					}
					else {
						i = this.values[1] + 1;
						this.move = true;
					}
					break;
				
				case "bottom":
					if(this.tiles[this.values[1]].y != this.values[0]) {
						if(this.tiles[this.values[1]].y + 10 < this.values[0]) {this.tiles[this.values[1]].y += 10;}
						else {
							this.tiles[this.values[1]].y = this.values[0];
							if(this.tiles[this.values[1]].y != this.values[0]) {this.values[0] = this.tiles[this.values[1]].y;}
						}
					}
					else {
						i = this.values[1] + this.sets;
						this.move = true;
					}
					break;
				
			}
			
			if(this.move) {
				
				this.timer.removeEventListener(TimerEvent.TIMER, MoveTile);
				
				this.tiles[this.values[1]].ind = i;
				aux = this.tiles[this.values[1]];
				this.tiles[this.values[1]] = null;
				this.tiles[i] = aux;
				aux = null;
				
				for(i = 0;i < this.chars;i++) {
					if(this.tiles[i] == null) {break;}
					else{serie += this.tiles[i].label.text == "" ? " " : this.tiles[i].label.text;}
				}
				
				if(this.attemps < 999) {this.attemps++;}
				
				if(serie == this.line.replace("&", "?")){
					for(i = 0;i < this.chars - 1;i++) {this.pointer.utilities.formatting(this.tiles[i].label, this.tiles[i].label.text, 0x130B75, false);}
					i = this.pointer.level == "EASY" ? 0 : this.pointer.level == "MEDIUM" ? 1 : 2;
					this.pointer.result = new Result();
					this.pointer.addChild(this.pointer.result);
					this.pointer.audio.PlaySound(this.pointer.audio.puzzleCompleted);
					if(this.pointer.QUESTIONS[this.pointer.theme].STATUS[i] == 0 || this.pointer.QUESTIONS[this.pointer.theme].STATUS[i] > this.attemps) {
						this.pointer.QUESTIONS[this.pointer.theme].STATUS[i] = this.attemps;
						this.pointer.sharer.SetValues(this.pointer.THEMES, this.pointer.QUESTIONS);
					}
					this.move = false;
				}
				
			}
			
		}
		
	}
	
}