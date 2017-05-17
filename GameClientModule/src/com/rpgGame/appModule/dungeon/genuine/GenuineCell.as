package com.rpgGame.appModule.dungeon.genuine
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
	
	public class GenuineCell extends DefaultListItemRenderer
	{
		private var _skin:FuBenItem_Zhenqi;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var _fistIcon:IconCDFace;
		private var _rewardIcons:Vector.<IconCDFace>;
		public function GenuineCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new FuBenItem_Zhenqi();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
			_fistIcon = FaceUtil.creatIconCDFaceByUIAsset(_skin.iconFirst,IcoSizeEnum.SIZE_60,1,5,5);
			_rewardIcons = new Vector.<IconCDFace>();
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_1,IcoSizeEnum.SIZE_40,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_2,IcoSizeEnum.SIZE_40,1,5,5));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.icon_3,IcoSizeEnum.SIZE_40,1,5,5));
			_skin.btnEnter.addEventListener(Event.TRIGGERED,triggeredHandler);
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
			var data:Q_daily_zone = this.data as Q_daily_zone;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(data.q_id);
			_skin.uiName.styleName = "ui/app/fuben/mc/zhenqi/"+data.q_limit_level+".png";
			_skin.uiBg.styleName = "ui/big_bg/fuben/zhenqi/"+data.q_bgicon+".jpg";
			_skin.numZhanli.number = data.q_combat;
			
			var itemInfos:Object = JSONUtil.decode( data.q_special_rewards_show);
			var item:ItemInfo = new ItemInfo();
			item.itemModelId = itemInfos[0]["mod"];
			item.num = itemInfos[0]["num"];
			FaceUtil.SetItemGrid(_fistIcon,ItemUtil.convertClientItemInfo(item), true);
			
			itemInfos = JSONUtil.decode( data.q_rewards_show);
			for(var i:int = 0;i<_rewardIcons.length;i++)
			{
				if(!itemInfos.hasOwnProperty(i))
					break;
				item = new ItemInfo();
				item.itemModelId = itemInfos[i]["mod"];
				item.num = itemInfos[i]["num"];
				FaceUtil.SetItemGrid(_rewardIcons[i],ItemUtil.convertClientItemInfo(item), true);
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
				_skin.btnEnter.visible = (_dailyZoneInfo.remainCount==0);
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