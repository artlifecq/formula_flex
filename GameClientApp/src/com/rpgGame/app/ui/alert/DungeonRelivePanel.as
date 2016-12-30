package com.rpgGame.app.ui.alert
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.UIModel;
	import com.rpgGame.app.utils.TimeUtil;
	
	import org.mokylin.skin.app.relive.DungeonRelivePanelSkin;
	
	import utils.TimerServer;
	
	public class DungeonRelivePanel extends SkinUIPanel
	{
		private var skin : Object;//DungeonRelivePanelSkin;
		public function DungeonRelivePanel()
		{
			//skin = new DungeonRelivePanelSkin();
			model = true;
			super(skin);
		}
		
		public var reliveTime : Number;
		public var dieTime : Number;
		public var showCompleteFun:Function;
		
		public function starttime():void
		{
			TimerServer.addLoop(updateReliveLabel,10);
		}
		
		private function updateReliveLabel():void
		{
			var time : Number = reliveTime - SystemTimeManager.curtTm;
			if(time <=0)
			{
				skin.reliveLabel.text = "0";
				hide();
				showCompleteFun && showCompleteFun();
			}else
			{
				skin.reliveLabel.text = TimeUtil.timeFormatCH(time *  0.001) + "后可复活";
				skin.bar.value = 100-time / dieTime * 100;
			}
		}
		
		override protected function onHide():void
		{
			UIModel.instence.hideModel(_ins);
			TimerServer.remove(updateReliveLabel);
		}
		
		private static var _ins : DungeonRelivePanel;
		public static function showRelivePanel(time:Number,showComplete:Function=null):void
		{
			if(!_ins)
				_ins = new DungeonRelivePanel();
			_ins.reliveTime = time;
			_ins.dieTime = time - SystemTimeManager.curtTm;
			Stage3DLayerManager.starlingLayer.getLayer("alert").addChild(_ins);
			_ins.showCompleteFun = showComplete;
			_ins.starttime();
			UIModel.instence.showModel(_ins);
		}
		
		override protected function onStageResize(sw:int, sh:int):void
		{
			super.onStageResize(sw,sh);
		}
		
		public static function hideRelivePanel():void
		{
			if(_ins)_ins.hide();
		}
	}
}