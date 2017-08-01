package com.rpgGame.app.manager.fight
{
	import com.game.engine3D.scene.display.BindableSprite;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	import starling.core.Starling;
	
	public class FightFaceLayer extends BindableSprite
	{
		private var viewRect:Rectangle;
		public function FightFaceLayer()
		{
			super();
			Starling.current.nativeStage.addEventListener(Event.RESIZE,onStageResize);
			this.touchable=false;
			viewRect=new Rectangle();
			onStageResize(null);
		}
		
		protected function onStageResize(event:Event):void
		{
			// TODO Auto-generated method stub
			var stg:Stage=Starling.current.nativeStage;
			viewRect.width=stg.stageWidth;
			viewRect.height=stg.stageHeight;
			updateTranform();
		}
		override public function bind(bindTarget:ObjectContainer3D, syncTarget:Object=null):void
		{
			this.x=0;
			this.y=0;
			super.bind(bindTarget,syncTarget);
		}
		override public function updateTranform():void
		{
			if (_bindTarget && _view&&MapDataManager.currentScene)
			{
				var pos:Vector3D=_bindTarget.position;
				var getData:Q_map = MapDataManager.currentScene.getData();
				
				var tx:int=viewRect.width/2-pos.x;
				var ty:int=viewRect.height/2-(-pos.y);
				var minX:int=viewRect.width-getData.q_map_width;
				var minY:int=viewRect.height-getData.q_map_height;
				if (tx>0) 
				{
					tx=0;
				}
				else if (tx<minX) 
				{
					tx=minX;
				}
				if (ty>0) 
				{
					ty=0;
				}
				else if (ty<minY) 
				{
					ty=minY;
				}
				if (this.x!=tx) 
				{
					this.x=tx;
				}
				if (this.y!=ty) 
				{
					this.y=ty;
				}
			}
			
		}
	}
}