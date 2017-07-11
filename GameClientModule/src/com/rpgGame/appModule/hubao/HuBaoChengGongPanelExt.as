package com.rpgGame.appModule.hubao
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.HuBaoEvent;
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
		
		private var _beijingkuangList:Vector.<UIAsset>;
		private var _icoList:Vector.<IconCDFace>;
		private var _labList:Vector.<Label>;
		
		private var _towPrizePoint:Array;
		private var _threePrizePoint:Array;
		
		private var _time:int=7;
		private var _timer:GameTimer;
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
			
			_beijingkuangList=new Vector.<UIAsset>();
			_beijingkuangList.push(_skin.icon1);
			_beijingkuangList.push(_skin.icon2);
			_beijingkuangList.push(_skin.icon3);
			
			_icoList=new Vector.<IconCDFace>();
			for(var i:int=0;i<_beijingkuangList.length;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_64);		
				ico.selectImgVisible=false;	
				//				_beijingkuangList[i].addChild(ico);
				_skin.container.addChild(ico);
				ico.bindBg(_beijingkuangList[i]);
				//				ico.y=_beijingkuangList[i].y;
				_icoList.push(ico);
			}
			
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
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show();
			EventManager.addEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,setDate);
		}
		
		private function setDate(msg:SCSuccessInfoMessage):void
		{
			_skin.bg_shuangbei.visible=msg.isdouble==2;
			var len:int=msg.reward.length;
			//			updatePoint(len);
			for(var i:int=0;i<_beijingkuangList.length;i++)
			{
				if(i<len)
				{
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(msg.reward[i].itemModelId,1,msg.reward[i].isbind);
					FaceUtil.SetItemGrid(_icoList[i],itemInfo);
					_labList[i].htmlText=itemInfo.qItem.q_name+"×"+msg.reward[i].num*msg.isdouble;
					
					_beijingkuangList[i].visible=true;		
					_labList[i].visible=true;
					_icoList[i].visible=true;
				}
				else
				{
					_beijingkuangList[i].visible=false;	
					_labList[i].visible=false;
					_icoList[i].visible=false;
				}
			}
			_skin.lbTiShi.htmlText="您还剩"+msg.remainNum.toString()+"次护送机会，是否继续?";
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
		
		private function updatePoint(prizeNum:int):void
		{
			for(var i:int=0;i<_beijingkuangList.length;i++)
			{
				if(prizeNum==2)
				{
					_beijingkuangList[i].x=_labList[i].x=_towPrizePoint[i];
				}
				else
				{
					_beijingkuangList[i].x=_labList[i].x=_threePrizePoint[i];
				}
				_icoList[i].x=_beijingkuangList[i].x-4;
			}
		}
		
		override public function hide() : void
		{
			super.hide();
			TimerServer.remove(onTimer);
			EventManager.removeEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,setDate);
		}
	}
}