package {
	
	import flash.media.*;
	
	public class Audio {
		
		public var buttonOver:Sound = new ButtonOver();
		public var itemOver:Sound = new ItemOver();
		public var puzzleCompleted:Sound = new PuzzleCompleted();
		public var tileSliding:Sound = new TileSliding();
		public var tipOver:Sound = new TipOver();
		
		public function Audio() {}
		
		public function PlaySound(_track:Sound) {_track.play();}
		
		public function StopSound() {SoundMixer.stopAll();}
		
	}
	
}