package com.rpgGame.appModule.hunyin
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hunyin.FuQiFuBen;
	
	public class FuQiFuBenPanelExt extends SkinUIPanel
	{
		private var _skin:FuQiFuBen;
		
		private var _zoneList:Vector.<Q_zone>;
		private var _fubenItemList:Vector.<FuQiFuBenItem>;
		private var _items:Vector.<IconCDFace>;
		public function FuQiFuBenPanelExt()
		{
			_skin=new FuQiFuBen();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_fubenItemList=new Vector.<FuQiFuBenItem>();
			_items=new Vector.<IconCDFace>();
			for(var i:int=1;i<=2;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_48);
				var uiasset:UIAsset=_skin.grpIcon.getChildByName("icon"+i) as UIAsset;
				ico.selectImgVisible=false;	
				_skin.grpIcon.addChild(ico);		
				ico.x=uiasset.x;
				ico.y=uiasset.y;
				_items.push(ico);
			}
			_zoneList=ZoneCfgData.getZoneListByType(19);
			if(_zoneList==null||_zoneList.length==0)
			{
				trace("【夫妻副本】：没有副本数据");
				return;
			}
			var len:int=_zoneList.length;
			var initX:int=26;
			for(i=0;i<len;i++)
			{
				var panel:FuQiFuBenItem=new FuQiFuBenItem(i);
				panel.setdata(_zoneList[i]);
				_fubenItemList.push(panel);
				_skin.container.addChild(panel);
				panel.x=initX;
				panel.y=89;
				initX+=panel.width+7;
			}
			var info:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(_zoneList[0].q_id);
			var prize:Array=JSONUtil.decode(info.q_pass_reward);
			for(i=0;i<_items.length;i++)
			{
				if(i<prize.length)
				{
					var itemInfo:ClientItemInfo=new ClientItemInfo(prize[i].mod);
					itemInfo.count=prize[i].num;
					FaceUtil.SetItemGrid(_items[i],itemInfo);
				}
				else
				{
					_items[i].clear();
				}
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(HunYinEvent.HUNYIN_FUBENCISHU,updateNum);
			updateNum();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(HunYinEvent.HUNYIN_FUBENCISHU,updateNum);
		}	
		
		private function updateNum():void
		{
			_skin.numCishu.label=Mgr.hunyinMgr.marriageInfos.zoneSubNum.toString();
		}
	}
}