package com.rpgGame.appModule.sevenday
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.SevendayCfgData;
	import com.rpgGame.coreData.clientConfig.Q_sevenday;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.SkinnableContainer;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.sevenday.Day_Item;
	import org.mokylin.skin.app.sevenday.SevenDay_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 七天豪礼面板
	 * @author YT
	 */
	public class SevendayPanel  extends SkinUIPanel
	{
		private var _dataArr:Vector.<Q_sevenday>;
		private var _skin:SevenDay_Skin;
		private var dayitemList:Vector.<Day_Item>;
		private var reward:RewardGroup;
		private var avateUI:UIAvatar3D;
		/**选中天数*/
		private var selectId:int=0;
		/**现在天数*/
		private var nowDay:int=0;
		/**领取奖励的天数*/
		private var receiveDay:Array;
		public function SevendayPanel()
		{
			_skin = new SevenDay_Skin();
			super(_skin);
			init();
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			showInit();
			setIconShow();
			setNowDay(3);
		}
		override public function hide():void
		{
			super.hide();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "btnLingqu":// 领取奖励该奖励暂不可领取
					if(selectId<=nowDay)
					{
						subReward(selectId);
					}
					else
					{
						NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP,"该奖励暂不可领取");
					}
					break;
			}
		}
		private function init():void
		{
			var i:int;
			dayitemList=new Vector.<Day_Item>();
			for(i=0;i<7;i++)
			{
				//_skin["skinDay"+(i+1)].name="day_"+i;
				var dayItem:Day_Item=_skin["skinDay"+(i+1)].skin as Day_Item;
				dayItem.uiDay.styleName="ui/app/sevenday/word/"+(i+1)+"t.png";
				dayitemList.push(dayItem);
				_skin["skinDay"+(i+1)].addEventListener(TouchEvent.TOUCH, onTouch);
			}
			//_skin.uiMsg.styleName="";
			reward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon0,RewardGroup.ALIN_CENTER,6,9,0,true,6);
			avateUI=new UIAvatar3D(_skin.modGrp,2);
			receiveDay=new Array();
			receiveDay.push(1);
			showInit();
		}
		private function showInit():void
		{
			var i:int;
			var dayItem:Day_Item;
			for(i=0;i<dayitemList.length;i++)
			{
				dayItem=dayitemList[i];
				dayItem.dayIcon.styleName="";
				dayItem.uiKeling.visible=false;
				dayItem.uiLingqu.visible=false;
				dayItem.bg2.visible=false;
			}
			_skin.uiMsg.styleName="";
			_skin.uiOk.visible=false;
			_skin.btnLingqu.visible=false;
			reward.visible=false;
			avateUI.visible=false;
			
		}
		/**领取奖励*/
		private function subReward(day:int):void
		{
			receiveDay.push(day);
			changeIconShow();
			_skin.uiOk.visible=true;
			_skin.btnLingqu.isEnabled=false;
			reward.tweeRewardInBag(1);
			
		}
		
		
		
		
		private var isOutTouch:Boolean=true;
		private function onTouch(e : TouchEvent) : void
		{
			var target:SkinnableContainer=e.currentTarget as SkinnableContainer;
			var nameArr:Array=target.name.split("skinDay");
			if(nameArr.length<2)
				return;
			var id:int=int(nameArr[1])
			var touch1 : Touch;
			var touch2 : Touch;
			var ditem:Day_Item;
			touch1 = e.getTouch(target, TouchPhase.HOVER);
			if (touch1 != null&&isOutTouch)
			{
				ditem=target.skin as Day_Item;
				ditem.bg2.visible=true;
				isOutTouch=false;
				return;
			}
			touch1 = e.getTouch(target);
			touch2 = e.getTouch(target, TouchPhase.ENDED);
			if (touch1 == null||touch2 != null)
			{
				if(id!=selectId)
				{
					ditem=target.skin as Day_Item;
					ditem.bg2.visible=false;
				}
				isOutTouch=true;
				return;
			}
			touch2 = e.getTouch(target, TouchPhase.BEGAN);
			if (touch2 != null)
			{
				selectInfo(id);
				return;
			}
			
			
		}
		/**设置图标未选中*/
		private function iconOutShow():void
		{
			var i:int=0;
			for(i=0;i<dayitemList.length;i++)
			{
				if((i+1)!=selectId)
				{
					dayitemList[i].bg2.visible=false;
				}
			}
		}
		
		/**设置图标*/
		private function setIconShow():void
		{
			var i:int=0;
			var dayData:Q_sevenday;
			for(i=0;i<dayitemList.length;i++)
			{
				dayData=SevendayCfgData.getSevenday(i+1);
				if(dayData!=null)
				{
					dayitemList[i].dayIcon.styleName="ui/app/sevenday/"+dayData.q_icon+".png";
				}
			}
		}
		private function changeIconShow():void
		{
			var i:int=0;
			var dm:int;
			var dayItem:Day_Item;
			for(i=0;i<dayitemList.length;i++)
			{
				dayItem=dayitemList[i];
				dm=i+1;
				if(dm<=nowDay&&getIsReceiveDay(dm))
				{
					dayItem.uiLingqu.visible=true;
				}
			}
		}
		
		
		/**设置今天*/
		private function setNowDay(day:int):void
		{
			nowDay=day;
			var i:int,j:int;
			changeIconShow();
			if(nowDay<dayitemList.length)
			{
				dayitemList[nowDay].uiKeling.visible=true;
			}
			
			selectInfo(nowDay);
		}
		/**是否领取奖励*/
		private function getIsReceiveDay(day:int):Boolean
		{
			var i:int;
			for(i=0;i<receiveDay.length;i++)
			{
				if(receiveDay[i]==day)
				{
					return true;
				}
			}
			return false;
		}
		/**设置选中信息*/
		private function selectInfo(id:int):void
		{
			var dayData:Q_sevenday=SevendayCfgData.getSevenday(id);
			var dayItem:Day_Item=dayitemList[id-1];
			if(dayData==null||dayItem==null)
				return;
			selectId=id;
			iconOutShow();
			dayItem.bg2.visible=true;
			_skin.uiMsg.styleName="ui/app/sevenday/"+dayData.q_reward_img+".png";
			
			avateUI.updateBodyWithRes(SevendayCfgData.getSevendayModByJob(dayData.q_mode,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
			avateUI.visible=true;
			reward.setRewardByJsonStr(dayData.q_reward);
			reward.visible=true;
			_skin.btnLingqu.visible=true;
			if(getIsReceiveDay(selectId))
			{
				_skin.uiOk.visible=true;
				_skin.btnLingqu.isEnabled=false;
				reward.gray=true;
			}
			else
			{
				_skin.uiOk.visible=false;
				_skin.btnLingqu.isEnabled=true;
				reward.gray=false;
			}
			if(selectId<=nowDay)
			{
				GrayFilter.unGray(_skin.btnLingqu);
			}
			else
			{
				GrayFilter.gray(_skin.btnLingqu);
			}
			
		}
		
	}
}