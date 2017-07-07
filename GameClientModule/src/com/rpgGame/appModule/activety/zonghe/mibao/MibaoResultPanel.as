package com.rpgGame.appModule.activety.zonghe.mibao
{
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.mibao.message.SCMiBaoRewardInfoMessage;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.activety.Active_LiJin_JieSuan;
	import org.mokylin.skin.app.activety.zonghe.TiaoZhanChengGong;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;

	/**
	 * 天降礼金结算面板
	 * @author YT
	 * 
	 */	
	public class MibaoResultPanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanChengGong;
		private var icoBgList:Vector.<UIAsset>;
		private var icoList:Vector.<IconCDFace>;
		public function MibaoResultPanel()
		{
			_skin = new TiaoZhanChengGong();
			super(_skin);
			init();
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			var msg:SCMiBaoRewardInfoMessage=data as SCMiBaoRewardInfoMessage;
			if(!msg)
				return;
			super.show(data,openTable,parentContiner);
			setTime(10);
			setInfo(msg);
			setReword(msg.reward);
			/*var dataInfo:Vector.<ItemInfo>;
			hideItem();
			if(data)
			{
				dataInfo= data as Vector.<ItemInfo>;
			}
			if(dataInfo)
			{
				setReword(dataInfo);
			}*/
			//setReword2();
			//TweenLite.delayedCall(6, hide);
		}
		override public function hide():void
		{
			super.hide();
			//TweenLite.killDelayedCallsTo(hide);
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			switch(target.name){
				case _skin.btnOk.name:// 领取奖励
					hide();
					subReword();
					break;
			}
		}
		private function init():void
		{
			var i:int;
			icoBgList=new Vector.<UIAsset>();
			for(i=0;i<6;i++)
			{
				icoBgList.push(_skin["icon"+i]);
			}
			icoList=new Vector.<IconCDFace>();
			var ico:IconCDFace;
			//var spr:Sprite=_skin.toSprite();
			for(i=0;i<icoBgList.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBgList[i].x;
				ico.y=icoBgList[i].y;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				_skin.grpIcon.addChild(ico);
				//spr.addChild(ico);
			}
			
			//icoBgList[0].visible=true;
			//icoList[0].visible=true;
			
		}
		private function setInfo(msg:SCMiBaoRewardInfoMessage):void
		{
			_skin.numShengwang.label=""+msg.rank;
			_skin.numLingqi.label=""+msg.jifenNum;
			_skin.numYuanbao.label=""+msg.zhenqiNum;
			_skin.numExp.label=""+msg.exp;
			_skin.imgWin.visible=msg.type==0;
			_skin.imLose.visible=!_skin.imgWin.visible;
		}
		/**设置奖励物品*/
		private function setReword(dataInfo:Vector.<ItemInfo>):void
		{
			var i:int;
			var lenght:int=dataInfo.length<icoList.length?dataInfo.length:icoList.length;
			for(i=0;i<lenght;i++)
			{
				setIcon(icoList[i],dataInfo[i].itemModelId,dataInfo[i].num,icoBgList[i]);
				icoList[i].x=icoBgList[i].x=i*56;
			}
			_skin.grpIcon.x=(469-56*lenght)*0.5;
		}
		private function setReword2():void
		{
			var i:int;
			for(i=0;i<5;i++)
			{
				setIcon(icoList[i],201,10,icoBgList[i]);
				icoList[i].x=icoBgList[i].x=i*56;
			}
			_skin.grpIcon.x=(469-56*5)*0.5;
		}
		private function setIcon(icon:IconCDFace,tiemId:int,num:int,bg:UIAsset=null):void
		{
			var item:Q_item=ItemConfig.getQItemByID(tiemId);
			if(item!=null&&icon!=null)
			{
				icon.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
				icon.visible=true;
				if(bg)
				{
					bg.visible=true;
				}
				TaskUtil.setItemTips(icon,item,num);
			}
			
		}
		private function hideItem():void
		{
			var i:int;
			for(i=0;i<icoBgList.length;i++)
			{
				icoBgList[i].visible=false;
				icoList[i].visible=false;
			}
		}
		private function subReword():void
		{
			for(var i:int=0;i<icoList.length;i++)
			{
				if(icoList[i].visible)
				{
					GrayFilter.gray(icoList[i]);
					ItemActionManager.tweenItemInBag(icoList[i]);
				}
				
			}
			
		}
		
		private var remainTime:int;
		private function setTime(time:int):void
		{
			var rTime:int=time;
			remainTime=rTime;
			_skin.btnOk.label="确认("+remainTime.toString()+")";
			TimerServer.remove(updateTime);
			TimerServer.addLoop(updateTime,1000);
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.btnOk.label="确认("+remainTime.toString()+")";
			if(remainTime==0){
				hide();
				subReword();
				TimerServer.remove(updateTime);
			}
		}
		
		
	}
}