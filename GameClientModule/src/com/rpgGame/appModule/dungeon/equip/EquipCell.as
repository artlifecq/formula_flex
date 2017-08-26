package com.rpgGame.appModule.dungeon.equip
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.ButtonState;
	import feathers.controls.Label;
	import feathers.controls.UIMovieClip;
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBenItem_Zhenqi;
	import org.mokylin.skin.app.fuben.mc.UIMovieClipTiaozhan_dao;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class EquipCell extends DefaultListItemRenderer
	{
		private var _skin:FuBenItem_Zhenqi;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var _data:Q_daily_zone;
		
		private var _groupList1:RewardGroup;
		private var _groupList2:RewardGroup;
		
		public function EquipCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new FuBenItem_Zhenqi();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
			
			_groupList1=new RewardGroup(IcoSizeEnum.ICON_48,_skin.iconFirst,RewardGroup.ALIN_CENTER,1,2,2,true,1,false,false);
			_groupList2=new RewardGroup(IcoSizeEnum.ICON_42,_skin.icon_2,RewardGroup.ALIN_CENTER,3,13,13,true,6,false,false);
			_skin.btnEnter.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btnReset.addEventListener(Event.TRIGGERED,resetHandler);
			//
			EventManager.addEvent(DungeonEvent.EQUIP_ITEM_INTO,itemInto);
			EventManager.addEvent(DungeonEvent.EQUIP_ITEM_OVER,itemOver);
			_skin.resetgroup.visible = false;
			_skin.combatgroup.visible = false;
			_skin.uiOver.visible=false;
			MCUtil.removeSelf(_skin.lbshenyuName);
			MCUtil.removeSelf(_skin.lbNum);
			
		}
		
		override protected function draw():void
		{
			var stateInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STATE);
			if(stateInvalid)
			{
				refeashState();
				monseHandler();
			}
			super.draw();
		}
		private function refeashState():void
		{
			
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount<=0)
				return ;
			if(_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level)
				return;
			var display:DisplayObject = _effect;
			if(this._currentState== ButtonState.HOVER)
			{
				_skin.combatgroup.visible = true;
				if(_dailyZoneInfo.todayPassed>0)
					_skin.uiTishi.visible=false;
				if(display)
					display.visible = false;
			}else if(this._currentState == ButtonState.UP){
				_skin.combatgroup.visible = false;
				if(_dailyZoneInfo.todayPassed>0)
					_skin.uiTishi.visible=true;
				if(display){
					display.visible = true;
					if(_effect!=null)
						_effect.play();
				}
			}
		}
		
		private function resetHandler(e:Event):void
		{
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount==0)
			{
				DailyZoneDataManager.instance().buyCount(_dailyZoneInfo);
			}
		}
		private function triggeredHandler(e:Event):void
		{
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount>0)
			{
				var q_data:Q_daily_zone = DailyZoneCfgData.getZoneCfg(_dailyZoneInfo.dailyzoneId);
				DungeonSender.reqCombat(q_data.q_zone_id,q_data.q_id);
			}
		}
		override protected function commitData():void
		{
			_data = this.data as Q_daily_zone;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(_data.q_id);
			_skin.uiName.styleName = "ui/app/fuben/mc/zhuangbei/"+_data.q_limit_level+".png";
			_skin.uiBg.styleName = "ui/big_bg/fuben/zhuangbei/"+_data.q_bgicon+".jpg";
			_skin.numZhanli.number = _data.q_combat;
			_skin.numZhanli.bounds.width=_skin.numZhanli.width;
			_skin.uiTishi.visible=_dailyZoneInfo.todayPassed>0;
			_groupList1.setRewardByJsonStr(_data.q_special_rewards_show);
			_groupList2.setRewardByJsonStr(_data.q_rewards_client);
			
			_skin.grpFirst.visible =_dailyZoneInfo.havePassed==0;
			
			_skin.lxin1.visible = (1<=_dailyZoneInfo.star);
			_skin.lxin2.visible = (2<=_dailyZoneInfo.star);
			_skin.lxin3.visible = (3<=_dailyZoneInfo.star);			
			updatabuttonState();
			refeashOpenState();
			refeashCombatState();
			refeashBuyState();
			itemInto();
		}
		private var _effect:UIMovieClip;
		private function updatabuttonState():void
		{
			if(_dailyZoneInfo.remainCount==0)
			{				
				if(_effect!=null)
				{
					this.removeChild(_effect,true);
					_effect = null;
				}
			}
			else{
				if(_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level||_dailyZoneInfo.havePassed>0||_dailyZoneInfo.remainCount<=0)
				{
					if(_effect!=null)
					{
						this.removeChild(_effect,true);
						_effect = null;
					}
				}
				else if(_effect==null)
				{
					_effect = new UIMovieClip();
					_effect.autoPlay = true;
					_effect.styleClass = UIMovieClipTiaozhan_dao;
					_effect.x = 0;
					_effect.y = 300;
					this.addChild(_effect);
				}
			}		
		}
		
		private function refeashBuyState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount>0)
			{
				_skin.resetgroup.visible = false;
			}else if(_data.q_limit_level<=MainRoleManager.actorInfo.totalStat.level){
				_skin.resetgroup.visible = true;
				_skin.lbYuanbao.text = _dailyZoneInfo.price.toString();
			}
			else{
				_skin.resetgroup.visible = false;
			}
		}
		private function refeashCombatState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount==0)
			{
				_skin.combatgroup.visible = false;
			}
		}
		
		private function refeashOpenState():void
		{
			if(_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level)
			{
				_skin.uiLevel.visible = true;
				_skin.grpXin.visible=false;
				_skin.grpXinL.visible=false;
				_skin.uiLevel.styleName = "ui/app/fuben/mc/kaiqidengji/kaiqi_"+_data.q_limit_level+".png";
				_skin.grp_Tuijian.visible=false;
			}else{
				if(_dailyZoneInfo.havePassed==0)
					_skin.grp_Tuijian.visible=true;
				else
					_skin.grp_Tuijian.visible=false;
				_skin.uiLevel.visible = false;
				_skin.grpXin.visible=true;
				_skin.grpXinL.visible=true;
			}
		}
		override public function dispose():void
		{
			super.dispose();
			if(_effect!=null)
			{
				_effect.stop();
				this.removeChild(_effect,true);
				_effect = null;
			}
			//EventManager.removeEvent(DungeonEvent.EQUIP_UPDATE_DAILYZONE_INFO,commitData);
			EventManager.removeEvent(DungeonEvent.EQUIP_ITEM_INTO,itemInto);
			EventManager.removeEvent(DungeonEvent.EQUIP_ITEM_OVER,itemOver);
		}
		private function monseHandler():void
		{
			if(this._currentState== ButtonState.HOVER)
			{
				EventManager.dispatchEvent(DungeonEvent.EQUIP_ITEM_OVER);
				_skin.uiOver.visible=true;
			}else if(this._currentState == ButtonState.UP){
				_skin.uiOver.visible=false;
			}
		}
		private function itemInto():void
		{
			var levelid:int=DailyZoneDataManager.instance().getFitLevelIdbyType(2,MainRoleManager.actorInfo.totalStat.level);
			_skin.uiOver.visible=(levelid==_data.q_id);
			
		}
		private function itemOver():void
		{
			_skin.uiOver.visible=false;
		}
		
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}