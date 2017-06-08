package com.rpgGame.appModule.battle.dfdj
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.netData.pvp.message.SCRaceResultMessage;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import org.mokylin.skin.app.zhanchang.DuiJueJieSuan_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class D1v1FightResultPanelExt extends SkinUIPanel
	{
		private var _skin:DuiJueJieSuan_Skin;
		private var _timer:GameTimer;
		private var _endTime:int;
		private var _initStr:String;
		private var _dic:Dictionary;
		public function D1v1FightResultPanelExt()
		{
			_skin=new DuiJueJieSuan_Skin();
			super(_skin);
			this.dragAble=false;
			_initStr=_skin.lbTime.text;
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			var msg:SCRaceResultMessage=data;
			//win
			if (msg.result==1) 
			{
				_skin.imgWin.styleName="ui/app/zhanchang/jiesuan/tianzhanshengli.png";
				_skin.imgLabWin.styleName="ui/app/zhanchang/jiesuan/gongxinin.png";
			}
			else
			{
				_skin.imgWin.styleName="ui/app/zhanchang/jiesuan/tiaozhanshibai.png";
				_skin.imgLabWin.styleName="ui/app/zhanchang/jiesuan/henyihan.png";
			}
			
			if (!_timer) 
			{
				_timer=new GameTimer("D1v1FightResultPanelExt");
				_timer.onUpdate=onTimer;
			}
			_endTime=getTimer()+20*1000;
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
				case _skin.lbDuihuan:
				{
					AppManager.showApp(AppConstant.BATTLE_SHOP_PANEL);
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_timer) 
			{
				_timer.destroy();
				_timer=null;
			}
		}
	}
}