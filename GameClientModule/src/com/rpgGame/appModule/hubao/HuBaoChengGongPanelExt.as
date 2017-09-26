package com.rpgGame.appModule.hubao
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.HuBaoEvent;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.convoy.message.SCSuccessInfoMessage;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hubao.HuBaoChengGong_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	public class HuBaoChengGongPanelExt extends SkinUIPanel
	{
		private var _skin:HuBaoChengGong_Skin;
		

		private var _labList:Vector.<Label>;
		
		private var _towPrizePoint:Array;
		private var _threePrizePoint:Array;
		
		private var _time:int=10;
		private var _timer:GameTimer;
		private var _rewardG:RewardGroup;
		private var _useList:Vector.<Label>=new Vector.<Label>();
		public function HuBaoChengGongPanelExt()
		{
			_skin=new HuBaoChengGong_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_towPrizePoint=[212,335,0];
			_threePrizePoint=[169,292,415];
			
			_rewardG=new RewardGroup(IcoSizeEnum.ICON_64,_skin.icon2,1,10,50);
			
			MCUtil.removeSelf(_skin.icon1);
			MCUtil.removeSelf(_skin.icon3);
			
			MCUtil.removeSelf(_skin.lbCaiLiao);
			MCUtil.removeSelf(_skin.lbjingyan);
			MCUtil.removeSelf(_skin.lbjiangli);
			_labList=new Vector.<Label>();
			_labList.push(_skin.lbCaiLiao);
			_labList.push(_skin.lbjingyan);
			_labList.push(_skin.lbjiangli);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnCancel:
					hide();
					break;
				case _skin.btnOk:
					HuBaoSender.upCSGoConvoyMessage();		
					hide();
					break;
			}			
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show();
			EventManager.addEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,setDate);
		}
		private function getlab():Label
		{
			if (_labList.length>0) 
			{
				return _labList.pop();
			}
			return MCUtil.clonelab(_skin.lbCaiLiao);
		}
		private function setDate(msg:SCSuccessInfoMessage):void
		{
			_skin.bg_shuangbei.visible=msg.isdouble==2;
			for each (var lab:Label in _useList) 
			{
				MCUtil.removeSelf(lab);
			}
			_labList=_labList.concat(_useList);
			_useList.length=0;
			_rewardG.setRewardByItemInfo(msg.reward);
			var len:int=msg.reward.length;
			//			updatePoint(len);
			var tlab:Label;
			var rewards:Vector.<IconCDFace>=_rewardG.getIoncs();
			for(var i:int=0;i<len;i++)
			{
				tlab=getlab();
				tlab.x=rewards[i].x;
				tlab.y=rewards[i].y+74;
				var itemInfo:ClientItemInfo=rewards[i].faceInfo as ClientItemInfo;
				tlab.htmlText=itemInfo.qItem.q_name+"×"+msg.reward[i].num;
				_rewardG.addChild(tlab);
				_useList.push(tlab);
			}
			_skin.lbTiShi.htmlText="您还剩"+msg.remainNum.toString()+"次护送机会，是否继续?";
			_time=10;
			TimerServer.addLoop(onTimer,1000);
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			if(_time>0) 
			{
				_skin.lbTime.text=_time.toString()+"秒后自动关闭";
				_time--;
			}
			else{
				TimerServer.remove(onTimer);
				hide();
			}
		}
		
	
		
		override public function hide() : void
		{
			super.hide();
			_rewardG.tweeRewardInBag();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			TimerServer.remove(onTimer);
			EventManager.removeEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,setDate);
			_rewardG.clear();
		}
	}
}