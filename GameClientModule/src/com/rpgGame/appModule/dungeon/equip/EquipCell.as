package com.rpgGame.appModule.dungeon.equip
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.fuben.FuBenItem_Zhenqi;
	
	import starling.events.Event;
	
	public class EquipCell extends DefaultListItemRenderer
	{
		private var _skin:FuBenItem_Zhenqi;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var _fistIcon:IconCDFace;
		private var _rewardIcons:Vector.<IconCDFace>;
		public function EquipCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new FuBenItem_Zhenqi();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
			_skin.uiJiangli.styleName = "ui/app/fuben/gailvdiaoluo.png"
			_fistIcon = FaceUtil.creatIconCDFaceByUIAsset(_skin.iconFirst,IcoSizeEnum.ICON_64,1,5,5);
			_rewardIcons = new Vector.<IconCDFace>();
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_1,IcoSizeEnum.ICON_42,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_2,IcoSizeEnum.ICON_42,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_3,IcoSizeEnum.ICON_42,1,5,5));
			_skin.btnEnter.addEventListener(Event.TRIGGERED,triggeredHandler);
			_skin.btnReset.addEventListener(Event.TRIGGERED,resetHandler);
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
				DailyZoneDataManager.instance().requestCombat(_dailyZoneInfo);
			}
		}
		override protected function commitData():void
		{
			var data:Q_daily_zone = this.data as Q_daily_zone;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(data.q_id);
			_skin.uiName.styleName = "ui/app/fuben/mc/zhuangbei/"+data.q_limit_level+".png";
			_skin.uiBg.styleName = "ui/big_bg/fuben/zhenqi/"+data.q_bgicon+".jpg";
			_skin.numZhanli.number = data.q_combat;
			
			var itemInfos:Array = ItemUtil.jsonParseItemClientList(data.q_special_rewards_show);
			FaceUtil.SetItemGrid(_fistIcon,itemInfos[0], true);
			
			itemInfos = ItemUtil.jsonParseItemClientList(data.q_rewards_show);
			for(var i:int = 0;i<_rewardIcons.length;i++)
			{
				FaceUtil.SetItemGrid(_rewardIcons[i],itemInfos[i], true);
			}
			_skin.lastCombatCount.visible = false;
			if(_dailyZoneInfo==null)
			{
				_skin.grpXinL.visible = false;
				_skin.uiOk.visible = false;
				_skin.btnEnter.visible = false;
			}else{
				_skin.grpXinL.visible = true;
				_skin.uiOk.visible = _dailyZoneInfo.havePassed!=0;
				_skin.lxin1.visible = (1<=_dailyZoneInfo.star);
				_skin.lxin2.visible = (2<=_dailyZoneInfo.star);
				_skin.lxin3.visible = (3<=_dailyZoneInfo.star);
			}
			refeashOpenState();
			refeashCombatState();
			refeashBuyState();
		}
		
		private function refeashBuyState():void
		{
			if(_dailyZoneInfo==null||_dailyZoneInfo.remainCount>0)
			{
				_skin.btnReset.visible = false;
				_skin.coustgroup.visible = false;
			}else{
				_skin.btnReset.visible = true;
				_skin.coustgroup.visible = true;
				_skin.lbYuanbao.text = _dailyZoneInfo.price.toString();
			}
			
		}
		private function refeashCombatState():void
		{
			if(_dailyZoneInfo==null)
			{
				_skin.btnEnter.visible = false;
				_skin.lastCombatCount.visible = false;
			}else{
				_skin.lastCombatCount.visible = true;
				_skin.btnEnter.visible = (_dailyZoneInfo.remainCount>0);
				_skin.lbNum.text = _dailyZoneInfo.remainCount.toString();
			}
		}
		
		private function refeashOpenState():void
		{
			if(_dailyZoneInfo==null)
			{
				_skin.uiLevel.visible = true;
				_skin.uiLevel.styleName = "ui/app/fuben/mc/kaiqidengji/kaiqi_"+data.q_limit_level+".png";
			}else{
				_skin.uiLevel.visible = false;
			}
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}