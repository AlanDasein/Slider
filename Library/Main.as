package {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Main extends MovieClip {
		
		private var preloader:Preloader;
		
		public var LEVELS:Array = new Array("EASY", "MEDIUM", "HARD");
		public var THEMES:Array = new Array("CARTOON", "MOVIE", "MUSIC", "COUNTRY", "PLACE", "NATURE", "PAINTING");
		
		public var QUESTIONS:Object = {
			CARTOON: {
				EASY: "GARFIELD", MEDIUM: "TIMON AND PUMBA", HARD: "COURAGE THE COWARDLY DOG", 
				LABELS: ["character", "characters", "character"], 
				TIPS:["Created<br />by Jim Davis", "Appeared in<br />The Lion King", "Created by<br />John R. Dilworth"],
				STATUS:[0, 0, 0]
			},
			MOVIE: {
				EASY: "SCARFACE", MEDIUM: "THELMA & LOUISE", HARD: "THE SILENCE OF THE LAMBS", 
				LABELS: ["movie", "movie", "movie"],
				TIPS:["Main Character:<br />Tony Montana", "Geena Davis<br />and Susan Sarandon", "Jodie Foster<br />and Anthony Hopkins"],
				STATUS:[0, 0, 0]
			},
			MUSIC: {
				EASY: "COLDPLAY", MEDIUM: "MICHAEL JACKSON", HARD: "KC AND THE SUNSHINE BAND", 
				LABELS: ["band", "singer", "band"],
				TIPS:["Lead vocalist:<br />Chris Martin", "The Inmortal King<br />of Pop", "That's the Way<br />I Like It"],
				STATUS:[0, 0, 0]
			},
			COUNTRY: {
				EASY: "PORTUGAL", MEDIUM: "SOLOMON ISLANDS", HARD: "CENTRAL AFRICAN REPUBLIC", 
				LABELS: ["country", "country", "country"],
				TIPS:["Location:<br />Iberian Peninsula", "Pacific<br />Ocean Islands", "In the middle of<br />Africa"],
				STATUS:[0, 0, 0]
			},
			PLACE: {
				EASY: "CN TOWER", MEDIUM: "ARC DE TRIOMPHE", HARD: "THE PALACE OF VERSAILLES", 
				LABELS: ["place", "place", "place"],
				TIPS:["Location:<br />Toronto, Canada", "Location:<br />Paris, France", "Royal chateau in<br />France"],
				STATUS:[0, 0, 0]
			},
			NATURE: {
				EASY: "ANTELOPE", MEDIUM: "URINARY BLADDER", HARD: "ALUMINIUM CHLORIDE OXIDE", 
				LABELS: ["animal", "organ", "compound"],
				TIPS:["Cousin of<br />sheep and goats", "Organ that collects<br />urine", "Aluminium<br />and chlorine"],
				STATUS:[0, 0, 0]
			},
			PAINTING: {
				EASY: "GIOCONDA", MEDIUM: "THE NIGHT WATCH", HARD: "THE FIRST DAYS OF SPRING", 
				LABELS: ["painting", "painting", "painting"],
				TIPS:["Author:<br />Leonardo Da Vinci", "Author:<br />Rembrandt van Rijn", "Author:<br />Salvador Dali"],
				STATUS:[0, 0, 0]
			}
		};
		
		public var sharer:Sharer = new Sharer();
		public var utilities:Utilities = new Utilities();
		public var audio:Audio = new Audio();
		public var logo:Logo;
		public var menuLevel:Menu;
		public var menuTheme:Menu;
		public var sample:Sample;
		public var command:Command;
		public var tip:Tip;
		public var result:Result;
		public var canvas:Canvas;
		public var panel:Panel;
		public var level:String = LEVELS[0];
		public var theme:String = THEMES[0];
		
		public function Main() {
			
			if(this.sharer.GetValues(0) != null) {
				for(var i:uint = 0;i < THEMES.length;i++) {
					this.QUESTIONS[THEMES[i]].STATUS = this.sharer.GetValues(i).split(",");
				}
			}
			
			this.preloader = new Preloader();
			addChild(this.preloader);
			
			loaderInfo.addEventListener(Event.COMPLETE, onDownloadCompleted, false, 0, true);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onDownloadProgress, false, 0, true);
			
		}
		
		private function onDownloadProgress(progressEvent:ProgressEvent):void {
			this.preloader.progressBar.width = Math.floor(100 * loaderInfo.bytesLoaded / loaderInfo.bytesTotal) * 3;
		}
		
		private function onDownloadCompleted(event:Event):void {
			gotoAndStop(3);
			MenuScreen();
		}
		
		private function reset():void {
			
			this.logo = null;
			this.menuLevel = null;
			this.menuTheme = null;
			this.sample = null;
			this.command = null;
			this.tip = null;
			this.result = null;
			this.canvas = null;
			this.panel = null;
			
			while(this.numChildren > 0){this.removeChildAt(0);}
			
		}
		
		public function MenuScreen():void {
			
			reset();
			
			this.logo = new Logo(this);
			this.menuLevel = new Menu(this, 375.3, 13.7, "LEVEL", LEVELS);
			this.menuTheme = new Menu(this, 375.3, 117.05, "THEME", THEMES);
			
			addChild(this.logo);
			addChild(this.menuLevel);
			addChild(this.menuTheme);
			
		}
		
		public function ViewScreen():void {
			
			reset();
			
			this.sample = new Sample();
			this.command = new Command(this);
			this.tip = new Tip(this);
			this.canvas = new Canvas(this);
			
			addChild(this.sample);
			addChild(this.command);
			addChild(this.tip);
			addChild(this.canvas);
			
		}
		
		public function PanelScreen(_screen):void {
			
			reset();
			
			this.panel = new Panel(this, _screen);
			addChild(this.panel);
			
		}
		
	}
	
}