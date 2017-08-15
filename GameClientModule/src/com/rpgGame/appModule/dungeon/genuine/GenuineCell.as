package com.rpgGame.appModule.dungeon.genuine
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBenItem_Zhenqi;
	
	public class GenuineCell extends DefaultListItemRenderer
	{
		private var _skin:FuBenItem_Zhenqi;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var _fistIcon:IconCDFace;
		private var _rewardIcons:Vector.<IconCDFace>;
		private var _data:Q_daily_zone;
		public function GenuineCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new FuBenItem_Zhenqi();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
			_fistIcon = FaceUtil.creatIconCDFaceByUIAsset(_skin.iconFirst,IcoSizeEnum.ICON_64,1,5,5);
			_rewardIcons = new Vector.<IconCDFace>();
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_1,IcoSizeEnum.ICON_42,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_2,IcoSizeEnum.ICON_42,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_3,IcoSizeEnum.ICON_42,1,5,5));
			_skin.btnEnter.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btnReset.addEventListener(Event.TRIGGERED,triggeredHandler);
			EventManager.addEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,commitData);
			MCUtil.removeSelf(_skin.uiOk);
		}
		private function triggeredHandler(e:Event):void
		{
			if(_dailyZoneInfo==null)
				return ;
			if(_dailyZoneInfo.remainCount>0)
			{
				DailyZoneDataManager.instance().requestCombat(_dailyZoneInfo);
			}else{
				DailyZoneDataManager.instance().buyCount(_dailyZoneInfo);
			}
		}
		override protected function commitData():void
		{
			_data = this.data as Q_daily_zone;
			if(!_data){
				return;
			}
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(_data.q_id);
			_skin.uiName.styleName = "ui/app/fuben/mc/zhenqi/"+_data.q_limit_level+".png";
			_skin.uiBg.styleName = "ui/big_bg/fuben/zhenqi/"+_data.q_bgicon+".jpg";
			_skin.numZhanli.number = _data.q_combat;
			_skin.grpFirst.visible=_dailyZoneInfo.havePassed==0;
			var itemInfos:Array = ItemUtil.jsonParseItemClientList(_data.q_special_rewards_show);
			FaceUtil.SetItemGrid(_fistIcon,itemInfos[0], true);
			
			itemInfos = ItemUtil.jsonParseItemClientList(_data.q_rewards_client);
			for(var i:int = 0;i<_rewardIcons.length;i++)
			{
				ClientItemInfo(itemInfos[i]).count = 0;
				FaceUtil.SetItemGrid(_rewardIcons[i],itemInfos[i], true);
			}
			_skin.resetgroup.visible = false;
			_skin.combatgroup.visible = false;
			_skin.uiTishi.visible = false;
			if(_dailyZoneInfo==null)
			{
				_skin.grpXinL.visible = false;
				_skin.btnEnter.visible = false;
			}else{
				_skin.grpXinL.visible = true;
				_skin.lxin1.visible = (1<=_dailyZoneInfo.star);
				_skin.lxin2.visible = (2<=_dailyZoneInfo.star);
				_skin.lxin3.visible = (3<=_dailyZoneInfo.star);
			}
			refeashOpenState();
			refeashCombatState();
			refeashBuyState();
			
			//			_skin.numZhanli.number=data.q_id;
		}
		
		private function refeashBuyState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount>0)
			{
				_skin.resetgroup.visible = false;
			}else{
				_skin.resetgroup.visible = true;
				_skin.lbYuanbao.text = _dailyZoneInfo.price.toString();
			}
			
		}
		private function refeashCombatState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount==0)
			{
				_skin.btnEnter.visible = false;
				_skin.combatgroup.visible = false;
			}else{
				_skin.combatgroup.visible = true;
				_skin.btnEnter.visible = (_dailyZoneInfo.remainCount>0);
				_skin.lbNum.text = _dailyZoneInfo.remainCount.toString();
			}
		}
		
		private function refeashOpenState():void
		{
			if(_dailyZoneInfo==null||_data.q_limit_level>MainRoleManager.actorInfo.totalStat.level)
			{
				_skin.uiLevel.visible = true;
				_skin.uiLevel.styleName = "ui/app/fuben/mc/kaiqidengji/kaiqi_"+_data.q_limit_level+".png";
				_skin.ui_tuijianZhanliName.visible=_skin.numZhanli.visible=false;
			}else{
				if(_dailyZoneInfo.todayPassed>0)
					_skin.ui_tuijianZhanliName.visible=_skin.numZhanli.visible=false;
				else
					_skin.ui_tuijianZhanliName.visible=_skin.numZhanli.visible=true;
				_skin.uiLevel.visible = false;
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			EventManager.removeEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,commitData);
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}