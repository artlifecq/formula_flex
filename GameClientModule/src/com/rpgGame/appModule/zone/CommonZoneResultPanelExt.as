package com.rpgGame.appModule.zone
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.ExitScenePanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.zone.message.SCZoneCommonResultMessage;
	
	import flash.utils.getTimer;
	
	import org.mokylin.skin.app.hunyin.HunYinFuBenJieSuanSkin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class CommonZoneResultPanelExt extends ExitScenePanel
	{
		private var _skin:HunYinFuBenJieSuanSkin;
		private var _timer:GameTimer;
		private var _endTime:int;
		private var _initStr:String;
		
		private var _gReward:RewardGroup;
		public function CommonZoneResultPanelExt()
		{
			_skin=new HunYinFuBenJieSuanSkin();
			super(_skin);
			this.dragAble=false;
			_initStr="$s后自动关闭";
			_gReward=new RewardGroup(IcoSizeEnum.ICON_64,_skin.icon1,RewardGroup.ALIN_CENTER);
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			var msg:SCZoneCommonResultMessage=data;
			var url:String;
			if (msg.result==1) 
			{
				url="ui/big_bg/activety/tianzhanshengli.png";
			}
			else
			{
				url="ui/big_bg/activety/tiaozhanshibai.png";
			}
			if(_skin.imgWin.styleName!=url)
			{
				_skin.imgWin.styleName=url;
			}
			_gReward.setRewardByItemInfo(msg.itemInfoList);
			if (!_timer) 
			{
				_timer=new GameTimer("CommonZoneResultPanelExt");
				_timer.onUpdate=onTimer;
			}
			_endTime=getTimer()+msg.subTime*1000;
			_timer.start();
			onTimer();
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>=0) 
			{
				
				_skin.lbTime.text=LanguageConfig.replaceStr(_initStr,[left]);
			}
			else
			{
				hide();
				_timer.stop();
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnOk:
				{
					hide();
					break;
				}
				default:
				{
					break;
				}
			}
		}
		override public function hide():void
		{
			super.hide();
			DungeonSender.reqQuitDungeon(sceneId);
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_timer) 
			{
				_timer.destroy();
				_timer=null;
			}
			_gReward.clear();
		}
	}
}