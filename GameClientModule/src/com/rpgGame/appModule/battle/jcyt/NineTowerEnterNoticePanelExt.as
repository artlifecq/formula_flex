package com.rpgGame.appModule.battle.jcyt
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import org.mokylin.skin.app.zhanchang.jiucengyaota.LevelTips_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class NineTowerEnterNoticePanelExt extends SkinUIPanel
	{
		private var _skin:LevelTips_Skin;
		private var _timeId:int;
		public function NineTowerEnterNoticePanelExt()
		{
			_skin=new LevelTips_Skin();
			super(_skin);
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			_skin.numLevel.label=int(data)+"";
			if (_timeId!=0) 
			{
				clearTimeout(_timeId);
			}
			_timeId=setTimeout(hideMe,3000);
		}
		private function hideMe():void
		{
			_timeId=0;
			hide();
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)/2;
			this.y=sh-400;
		}
	}
}