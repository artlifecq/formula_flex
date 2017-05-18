package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.fubenzhuizong.FuBen_Skin;
	
	import starling.display.DisplayObject;

	/**
	 *多人副本追踪 
	 * @author YT
	 * 
	 */	
	public class MultyTrackerUI extends DungeonTrackerUI
	{
		private var _skin:FuBen_Skin;
		private var skinList:Array;
		private var icoBg1List:Vector.<UIAsset>;
		private var ico1List:Vector.<IconCDFace>;
		private var icoBg2List:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		
		private var zoneId:int=0;
		public function MultyTrackerUI()
		{
			_skin=new FuBen_Skin();
			super(_skin);
			init();
			setReword();
			setUisite();
		}
		override protected function onShow() : void
		{
			
		}
		override protected function onHide():void
		{
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			
		}
		private function init():void
		{
			
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.lbMiaoshu);
			skinList.push(_skin.sec_killbut1_1);
			skinList.push(_skin.sec_killbut1_2);
			skinList.push(_skin.sec_killbut1_3);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.sec_ico1_0);
			skinList.push(_skin.sec_ico1_4);
			skinList.push(_skin.sec_navi3);
			skinList.push(_skin.sec_ico2_0);
			skinList.push(_skin.sec_ico2_4);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_subbut1);
			var i:int;
			var ico:IconCDFace;
			icoBg1List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg1List.push(_skin["sec_ico1_"+i]);
			}
			ico1List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg1List.length;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg1List[i].x-6;
				ico.y=icoBg1List[i].y-6;
				ico.visible=false;
				icoBg1List[i].visible=false;
				ico1List.push(ico);
				_skin.task_box.addChild(ico);
			}
			icoBg2List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg2List.push(_skin["sec_ico2_"+i]);
			}
			ico2List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg2List.length;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg2List[i].x-6;
				ico.y=icoBg2List[i].y-6;
				ico.visible=false;
				icoBg2List[i].visible=false;
				ico2List.push(ico);
				_skin.task_box.addChild(ico);
			}
			
			
			
		}
		
		private function setReword():void
		{
			var zid:int=7001;
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zid);
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(zid);
			if(zoneData==null||multyData==null)return;
			var passReward:Array=JSONUtil.decode(multyData.q_prob_reward);
			var i:int;
			var ico:IconCDFace; 
			var item:Q_item;
			if(passReward&&passReward.length>0)
			{
				for(i=0;i<passReward.length;i++)
				{
					if(i<ico1List.length&&passReward[i]!=null)
					{
						item=ItemConfig.getQItemByID(passReward[i].mod);
						ico=ico1List[i];
						if(item!=null&&ico!=null)
						{
							ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
							ico.visible=true;
							icoBg1List[i].visible=true;
							TaskUtil.setItemTips(ico,item,passReward[i].num);
						}
					}
				}
			}
			
			
			var reward:Array=JSONUtil.decode(multyData.q_prob_reward);
			if(reward==null||reward.length==0)return;
			for(i=0;i<reward.length;i++)
			{
				if(i<ico2List.length&&reward[i]!=null)
				{
					item=ItemConfig.getQItemByID(reward[i].mod);
					ico=ico2List[i];
					if(item!=null&&ico!=null)
					{
						ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
						ico.visible=true;
						icoBg2List[i].visible=true;
						TaskUtil.setItemTips(ico,item,reward[i].num);
					}
				}
			}
			
		}
		
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible==true)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}
			
		//	_skin.ui_bg.height=skinList[count].y+skinList[count].height+3;
			
			
			for(i=0;i<4;i++)
			{
				if(icoBg1List[i].visible==true)
				{
					icoBg1List[i].y=icoBg1List[0].y;
					ico1List[i].y=icoBg1List[0].y-6;
				}
			}
			for(i=4;i<icoBg1List.length;i++)
			{
				if(icoBg1List[i].visible==true)
				{
					icoBg1List[i].y=icoBg1List[4].y;
					ico1List[i].y=icoBg1List[4].y-6;
				}
			}
			for(i=0;i<4;i++)
			{
				if(icoBg2List[i].visible==true)
				{
					icoBg2List[i].y=icoBg2List[0].y;
					ico2List[i].y=icoBg2List[0].y-6;
				}
			}
			for(i=4;i<icoBg2List.length;i++)
			{
				if(icoBg2List[i].visible==true)
				{
					icoBg2List[i].y=icoBg2List[4].y;
					ico2List[i].y=icoBg2List[4].y-6;
				}
			}
			
			
		}
		
	}
}