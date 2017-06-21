package  com.rpgGame.appModule.battle.jcyt
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.netData.yaota.message.SCYaoTaAwardMessage;
	
	import flash.utils.getTimer;
	
	import org.mokylin.skin.app.zhanchang.JiuCengYaoTaJieSuan;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class NineTowerFightResultPanelExt extends SkinUIPanel
	{
		private var _skin:JiuCengYaoTaJieSuan;
		private var _timer:GameTimer;
		private var _endTime:int;
		private var _initStr:String;

		private var _gReward:RewardGroup;
		public function NineTowerFightResultPanelExt()
		{
			_skin=new JiuCengYaoTaJieSuan();
			super(_skin);
			this.dragAble=false;
			_initStr="$s后自动关闭";
			_gReward=new RewardGroup(_skin.icon1,1);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			var msg:SCYaoTaAwardMessage=data;
			var score:int=msg.myYaoTaInfo.integral;
			var rank:int=msg.myYaoTaInfo.rank;
			_skin.lbZhanli.text=score+"";
			_skin.lbPaiming.text=""+rank;
			_gReward.setRewardByTeamItemInfo(msg.tempItems);
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
				default:
				{
					break;
				}
			}
		}
		override public function hide():void
		{
			super.hide();
			_gReward.clear();
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