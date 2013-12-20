package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class Main extends Sprite 
	{
		public var scoreText:TextField = new TextField();
		public var score:int = 0;
		private var board:Vector.<Tile> = new Vector.<Tile>();
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(scoreText);
			scoreText.text = "score = 0";
			
				for (var i:int = 0; i < 10; i++) 
			{
				for (var j:int = 0; j < 10; j++) 
				{	
					var t:Tile = new Tile();
					
					t.x = 100 + j * (Tile.TILE_SIDE + 1);
					t.y = 100 + i * (Tile.TILE_SIDE + 1);
					this.addChild(t);
					
					t.addEventListener(MouseEvent.CLICK, clickTile);
					board.push(t);
					
					
				}
			}
			
		}		
		
			private function clickTile(e:MouseEvent):void 
		{
			Tile(e.target).clicked();
			
			score++;
			scoreText.text = "Score: " + score.toString();
		
		}
	}
}
