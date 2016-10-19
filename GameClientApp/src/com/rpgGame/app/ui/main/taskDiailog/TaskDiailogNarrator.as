package com.rpgGame.app.ui.main.taskDiailog
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.taskDiailog.TaskDiailogNarratorSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;

	/**
	 * 条形旁白
	 * @author luguozheng
	 * 
	 */	
	public class TaskDiailogNarrator extends SkinUI
	{
		private var _skinNarrator:TaskDiailogNarratorSkin;
		
		private var _leftIco:UIAsset;
		private var _rightIco:UIAsset;
		
		private var _index:int;
		private var _dialogVect:Vector.<String>;
		
		private var _count:int;
		
		private var _npcId:int;
		private var _dialog:String;
		
		private var _curEndTime:Number;
		
		private var gTime:GameTimer;
		
		public function TaskDiailogNarrator()
		{
			_skinNarrator = new TaskDiailogNarratorSkin();
			super(_skinNarrator);
		}
		
		private static var _instance:TaskDiailogNarrator;
		public static function getInstance():TaskDiailogNarrator
		{
			if( _instance == null )
			{
				_instance = new TaskDiailogNarrator();
			}
			return _instance;
		}
		
		public function show( dialogVect:Vector.<String> ):void
		{
			if( dialogVect == null )
				return;
			
			_dialogVect = dialogVect;
			_index = 0;
			
			_count = _dialogVect.length;
			
			if( _count <= 0 )
				return;
			
			addStage();
			
			
			startTime();
			showDialog();
		}
		
		private function addStage():void
		{
			updateEndTime();
			
			Starling.current.stage.addChild( this );
			
			onStageResize( Starling.current.stage.stageWidth, Starling.current.stage.stageHeight );
			//Starling.current.nativeStage.addEventListener( Event.RESIZE, onStageResize );
		}
		
		override protected function onStageResize(sw:int, sh:int):void
		{
			x = ( sw - _skinNarrator.width ) *0.5;
			y = sh - _skinNarrator.height - 100;
		}
		
		private function showDialog():void
		{
			if( _index >= _count )
			{
				clear();
				return;
			}
			
			var config:Array = _dialogVect[_index].split("_");
			if( config.length < 2 )
			{
				_index ++;
				showDialog();
				return;
			}
			
			var diailogName:String;
			var isMe:Boolean = ( config[0] == "m" );
			if( isMe )
				diailogName = MainRoleManager.actorInfo.name;
			else
				diailogName = NpcCfgData.getNpcName( config[0] );
			
			var diailog:String = config[1];
			
			if( isMe )
			{
				_skinNarrator.labRightName.text = diailogName;
				_skinNarrator.labLeftame.text = "";
			}
			else
			{
				_skinNarrator.labRightName.text = "";
				_skinNarrator.labLeftame.text = diailogName;
			}
			
			_skinNarrator.labDiailog.text = diailog;
			
			_index ++;
		}
		
		private function clear():void
		{
			stopTime();
			
			if( parent != null )
				parent.removeChild( this );
			
			_dialogVect = null;
		}		
		
		private function startTime():void
		{
			if( gTime == null )
			{
				gTime = new GameTimer( "TASK_DIAILOG_NARRATOR", 1000 );
				gTime.onUpdate = updateTime;
			}
			
			gTime.reset();
			gTime.start();
		}		
		
		private function updateTime():void
		{
			var lastTime:int = (_curEndTime - SystemTimeManager.curtTm) / 1000 ;
			
			if(lastTime < 0)
			{
				updateEndTime();
				showDialog();
				return;
			}
			
			_skinNarrator.labTime.text = int( _curEndTime - SystemTimeManager.curtTm ) + "秒..";
		}
		
		private function updateEndTime():void
		{
			_curEndTime = SystemTimeManager.curtTm + 5 * 1000;
		}
		
		private function stopTime():void
		{
			if( gTime == null )
				return;
			
			gTime.stop();	
		}		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			showDialog();
		}
	}
}