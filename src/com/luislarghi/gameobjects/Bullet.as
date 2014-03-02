package com.luislarghi.gameobjects
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Bullet extends Sprite
	{
		private var speed:Number = 20;
		private var dead:Boolean = false;
		private var damage:int = 1;
		
		function Bullet(posX:int, posY:int, rot:Number)
		{
			this.x = posX;
			this.y = posY;
			this.rotation = rot;
			
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
			this.addEventListener(Event.REMOVED_FROM_STAGE, Clear);
		}
		
		private function Init(e:Event):void { }
		
		private function Clear(e:Event):void { }
		
		public function Draw():void
		{
			this.graphics.clear();
			this.graphics.beginFill(0xDA32D2);
			this.graphics.drawRect(0, 0, 10, 10);
			this.graphics.endFill();
		}
		
		public function Logic():void
		{
			if(!dead)
			{
				this.x += speed * Math.cos(this.rotation * (Math.PI / 180));
				this.y += speed * Math.sin(this.rotation * (Math.PI / 180));
			}
			
			if(this.x < 0 || this.x > Main.mainStage.stageWidth ||
				this.y < 0 || this.y > Main.mainStage.stageHeight)
				dead = true;
		}

		public function get Dead():Boolean { return dead; }
		public function get Damage():int { return damage; }
	}
}