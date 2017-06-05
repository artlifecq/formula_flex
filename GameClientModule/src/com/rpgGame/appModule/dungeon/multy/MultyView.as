package com.rpgGame.appModule.dungeon.multy
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIModePanel;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.zone.bean.MultiZonePanelInfo;
	
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.events.FeathersEventType;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.fuben.FuBen_DuoRen_Item;
	import org.mokylin.skin.app.fuben.FuBen_DuoRen_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.display.Sprite;

	public class MultyView extends SkinUIModePanel
	{
		private var _skin:FuBen_DuoRen_Skin;
		private var scroll_Bar :ScrollContainer;
		private var scrollBox:Sprite;
		private var scrollBack : Shape;
		private var skinList:Vector.<SkinnableContainer>;
		private var itemList:Vector.<FuBen_DuoRen_Item>;
		private var selectId:int=-1;
		private var passRewardIcon:Vector.<IconCDFace>;
		private var passRewardList:Dictionary;
		private var allRewardIcon:Vector.<IconCDFace>;
		//private var currCount:int=3;
		public function MultyView():void
		{
			super(FuBen_DuoRen_Skin,"多人副本",1);
		}
		private var key:Boolean=false;//临时加的key
		override protected function initialize():void
		{
			if(key)return;
			key=true;
			_skin = _uiskin as FuBen_DuoRen_Skin;
			initScroll();
			creatDungeonItem();
			creatGlobalReward();
		}
		
		private function initScroll():void
		{
			scroll_Bar=_skin.scroll_Bar;
			scroll_Bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scroll_Bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			scroll_Bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			scrollBack = new Shape();
			scrollBack.graphics.beginFill(0x00FF00);
			scrollBack.graphics.drawRoundRect(0, 0, 10, scroll_Bar.height+0.1);
			scrollBack.graphics.endFill();
			scrollBack.visible=false;
			scrollBox=new Sprite();
			scrollBox.addChild(scrollBack);
			scroll_Bar.addChild(scrollBox);
			
		}
		override public function onTouchTarget(target:DisplayObject):void
		{
			switch (target) {
				case _skin.btnEnter:
					butEnter();
					break;
				case _skin.btnExit:
					
					break;
			}
			
		}
		private function butEnter():void
		{
			var zid:int=ZoneMultyCfgData.getZoneIdByID(selectId);
			if(zid<0)return;
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zid);
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(zid);
			if(zoneData==null||multyData==null)return;
			if(MainRoleManager.actorInfo.totalStat.level>=zoneData.q_level)
			{
				//AppManager.showApp(AppConstant.MULTY_ENTERTIME_PANL);
				DungeonSender.reqEnterDungeon(zoneData.q_id);
			}
			
			
		}
		
		public function upView():void
		{
			
		}
		override public function showView():void
		{
			setGray();
			setPassRewardText();
			selectItemInfo();
			gainReward();
		}
		override public function hide():void
		{
			TweenLite.killDelayedCallsTo(tweeReward);
		}
		
		/**创建列表*/
		private function creatDungeonItem():void
		{
			
			var panelInfos: Vector.<MultiZonePanelInfo>=DungeonManager.panelInfos;
			if(panelInfos==null||panelInfos.length==0)return;
			
			/*var relist:Array=ZoneMultyCfgData.getMultyIdList();
			if(relist==null)return;*/
			skinList=new Vector.<SkinnableContainer>();
			itemList=new Vector.<FuBen_DuoRen_Item>();
			passRewardIcon=new Vector.<IconCDFace>();
			passRewardList=new Dictionary();
			var skin:SkinnableContainer;
			var item:FuBen_DuoRen_Item;
			var i:int;
			for(i=0;i<panelInfos.length;i++)
			{
				skin=getItemSkin(i,panelInfos[i]);
				if(skin!=null)
				{
					item=skin.skin as FuBen_DuoRen_Item
					skinList.push(skin);
					itemList.push(item);
					scrollBox.addChild(skin);
					cloSelectItem(item);
					item.btnSelect.addEventListener(FeathersEventType.STATE_CHANGE,buttonTouchHandler);
				}
			}
			
			
		}
		private function buttonTouchHandler(event:Event):void
		{
			var id:int=-1;
			var name:Array
			var state:String;
			var but:Button=Button(event.target);
			
			if(but!=null)
			{
				state=Button(event.target).currentState;
			}
			if(state=="down")
			{
				name=but.name.split("_");
				id=int(name[1]);
				changeItem(id);
				
			}
		}
		/**改变选择元素*/
		private function changeItem(id:int):void
		{
			if(id<0||id>=itemList.length)return;
			if(selectId==id)return;
			if(selectId>=0)
			{
				cloSelectItem(itemList[selectId]);
			}
			unSelectItem(itemList[id]);
			selectId=id;
			setSite();
			selectItemInfo();
		}
		/**设置右边信息*/
		private function selectItemInfo():void
		{
			var zid:int=ZoneMultyCfgData.getZoneIdByID(selectId);
			if(zid<=0)return;
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zid);
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(zid);
			var info:MultiZonePanelInfo=DungeonManager.getPanelInfo(zid);
			if(zoneData==null||multyData==null||info==null)return;
			//
			_skin.uiName.styleName="ui/app/fuben/duorenfuben/fuben_name/"+multyData.q_resurl+"/name.png";
			_skin._info_text.htmlText=zoneData.q_desc;
			_skin.lbRenshu.htmlText=zoneData.q_min_num+"-"+zoneData.q_max_num;
			_skin.lbDengji.htmlText=MainRoleManager.actorInfo.totalStat.level>=zoneData.q_level?zoneData.q_level.toString():"<font color='#e1201c'>"+zoneData.q_level+"</font>";
			_skin.lbZhanli.htmlText=MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.FIGHTING)>=multyData.q_power?multyData.q_power.toString():"<font color='#e1201c'>"+multyData.q_power+"</font>";
			_skin.lbCishu.htmlText=(multyData.q_count-info.count)>0?(multyData.q_count-info.count).toString():"<font color='#e1201c'>"+(multyData.q_count-info.count)+"</font>";
		}
		/**执灰列表*/
		private function setGray():void
		{
			if(itemList==null)return;
			var name:Array;
			var zid:int,selectlevel:int,selectid:int;
			var zoneData:Q_zone,multyData:Q_zone_multy;
			var item:FuBen_DuoRen_Item,skin:SkinnableContainer;
			var info:MultiZonePanelInfo;
			var i:int;
			selectlevel=int.MAX_VALUE;
			selectid=0;
			for(i=0;i<itemList.length;i++)
			{
				item=itemList[i];
				skin=skinList[i];
				name=item.btnSelect.name.split("_");
				if(name!=null&&name.length>1)
				{
					//leve=int(name[1]);
					//zid=ZoneMultyCfgData.getZoneIdByID(i);
					zid=int(name[2]);
					if(zid<=0)break;
					zoneData=ZoneCfgData.getZoneCfg(zid);
					multyData=ZoneMultyCfgData.getZoneMultyByID(zid);
					info=DungeonManager.getPanelInfo(zid);
					if(zoneData==null||multyData==null||info==null)break;
					GrayFilter.unGray(passRewardList[zid]);
					if(MainRoleManager.actorInfo.totalStat.level>=zoneData.q_level)
					{
						if(zoneData.q_level<selectlevel&&info.count<multyData.q_count)
						{
							selectlevel=zoneData.q_level;
							selectid=i;
						}
						GrayFilter.unGray(skin);
					}
					else
					{
						GrayFilter.gray(skin);
					}
				}
			}
			
			changeItem(selectid);
			
		}
		/**设置通关奖励文字*/
		private function setPassRewardText():void
		{
			var zid:int;
			var multyData:Q_zone_multy;
			var item:FuBen_DuoRen_Item;
			var info:MultiZonePanelInfo;
			var i:int;
			for(i=0;i<itemList.length;i++)
			{
				item=itemList[i];
				zid=ZoneMultyCfgData.getZoneIdByID(i);
				if(zid<=0)break;
				multyData=ZoneMultyCfgData.getZoneMultyByID(zid);
				info=DungeonManager.getPanelInfo(zid);
				if(multyData==null||info==null)break;
				item.lbNum.text=info.rewardCount+"/"+multyData.q_front+"通关奖励：";
			}
			
			var allpass:int=GlobalSheetData.getSettingInfo(515).q_int_value;
			_skin.lbTiaozhan.text="每日挑战"+allpass+"次可领取（"+DungeonManager.challengeCount+"/"+allpass+"）：";
			
		}
		
		/**设置全局奖励文字*/
		private function creatGlobalReward():void
		{
			if(GlobalSheetData.getSettingInfo(515)==null||GlobalSheetData.getSettingInfo(516)==null) return;
			var reward:Array=JSONUtil.decode(GlobalSheetData.getSettingInfo(516).q_string_value);
			if(reward==null||reward.length==0)return;
			var i:int;
			for(i=0;i<8;i++)
			{
				_skin["reward_ico_"+i].visible=false;
			}
			allRewardIcon=new Vector.<IconCDFace>();
			var item:Q_item;
			var ico:IconCDFace; 
			for(i=0;i<reward.length;i++)
			{
				if(i<8&&reward[i]!=null)
				{
					item=ItemConfig.getQItemByID(reward[i].mod);
					if(item!=null)
					{
						ico=new IconCDFace(IcoSizeEnum.ICON_36);
						ico.showCD=false;
						ico.x=_skin["reward_ico_"+i].x+6;
						ico.y=_skin["reward_ico_"+i].y+6;
						ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_36));
						TaskUtil.setItemTips(ico,item,reward[i].num);
						allRewardIcon.push(ico);
						_skin["reward_ico_"+i].visible=true;
						_skin.reward_ico_list.addChild(ico);
						
					}
				}
			}
			
			
		}
		
		
		
		
		/**展开元素*/
		private function unSelectItem(item:FuBen_DuoRen_Item):void
		{
			if(item==null)return;
			item.btnSelect.height=125;
			item.uiName1.visible=false;
			item.uiName2.visible=true;
			item.imgBg_out.visible=false;
			item.imgBg_select.visible=true;
			item.grpIcon.visible=true;
		}
		/**收缩元素*/
		private function cloSelectItem(item:FuBen_DuoRen_Item):void
		{
			if(item==null)return;
			item.btnSelect.height=91;
			item.uiName1.visible=true;
			item.uiName2.visible=false;
			item.imgBg_out.visible=true;
			item.imgBg_select.visible=false;
			item.grpIcon.visible=false;
		}
		/**重置坐标*/
		private function setSite():void
		{
			var i:int;
			for(i=0;i<skinList.length;i++)
			{
				skinList[i].y=i*95;
				if(i>selectId)
				{
					skinList[i].y+=34;
				}
			}
			scrollBack.height=skinList.length*95+34;
			scrollBox.addChild(scrollBack);
		}
		/**创建单个元素*/
		private function getItemSkin(id:int,info:MultiZonePanelInfo):SkinnableContainer
		{
			var zid:int=info.zoneId;
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zid);
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(zid);
			if(zoneData==null||multyData==null)return null;
			var skin:SkinnableContainer;
			var temp:FuBen_DuoRen_Item;
			var icoGroup:Group;
			var i:int,add:int;
			skin= new SkinnableContainer();
			temp =new FuBen_DuoRen_Item();
			skin.skin=temp;
			temp.btnSelect.name="select_"+id+"_"+zid;
			temp.btnSelect.visible=true;
			temp.grpIcon.visible=false;
			temp.uiName1.styleName="ui/app/fuben/duorenfuben/fuben_name/"+multyData.q_resurl+"/up.png";
			temp.uiName2.styleName="ui/app/fuben/duorenfuben/fuben_name/"+multyData.q_resurl+"/select.png";
			temp.imgBg_out.styleName="ui/big_bg/fuben/duorenfuben/fuben_bg/"+multyData.q_resurl+"/up.jpg";
			temp.imgBg_select.styleName="ui/big_bg/fuben/duorenfuben/fuben_bg/"+multyData.q_resurl+"/select.jpg";
			temp.lbNum.text="";
			var ico:IconCDFace; 
			var item:Q_item;
			
			var reward:Object=JSONUtil.decode(multyData.q_pass_reward);
			if(reward!=null)
			{
				item=ItemConfig.getQItemByID(reward.mod);
				if(item!=null)
				{
					ico=new IconCDFace(IcoSizeEnum.ICON_48);
					ico.showCD=false;
					ico.x=temp.pass_ico.x;
					ico.y=temp.pass_ico.y;
					ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
					TaskUtil.setItemTips(ico,item,reward.num);
					passRewardIcon.push(ico);
					passRewardList[multyData.q_zone_id]=ico;
					temp.pass_group.addChild(ico);
					
				}
			}
			var passReward:Array=JSONUtil.decode(multyData.q_prob_reward);
			for(i=0;i<8;i++)
			{
				temp["prob_ioc_"+i].visible=false;
			}
			if(passReward&&passReward.length>0)
			{
				add=0;
				for(i=0;i<passReward.length;i++)
				{
					if(i<8&&passReward[i]!=null)
					{
						item=ItemConfig.getQItemByID(passReward[i].mod);
						if(item!=null)
						{
							ico=new IconCDFace(IcoSizeEnum.ICON_36);
							ico.showCD=false;
							ico.x=temp["prob_ioc_"+add].x+6;
							ico.y=temp["prob_ioc_"+add].y+6;
							ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_36));
							TaskUtil.setItemTips(ico,item,passReward[i].num);
							temp["prob_ioc_"+add].visible=true;
							temp.grpIcon.addChild(ico);
							add++;
						}
					}
				}
			}
			
			return skin;
		}
		
		private function tweeReward():void
		{
			if (!AppManager.isAppInScene(AppConstant.MULTY_PANL))
			{
				AppManager.showApp(AppConstant.MULTY_PANL);
			}
			var i:int;
			if(DungeonManager.passReward==1)
			{
				DungeonManager.passReward=0;
				var zid:int=DungeonManager.curryZoneId;
				var paioc:IconCDFace=passRewardList[zid];
				if(paioc&&paioc.visible)
				{
					GrayFilter.gray(paioc);
					ItemActionManager.tweenItemInBag(paioc);
				}
				//passRewardList[multyData.q_zone_id]
				
			}
			if(DungeonManager.extraReward==1)
			{
				DungeonManager.extraReward=0;
				for(i=0;i<allRewardIcon.length;i++)
				{
					if(allRewardIcon[i].visible)
					{
						GrayFilter.gray(allRewardIcon[i]);
						ItemActionManager.tweenItemInBag(allRewardIcon[i]);
						//allRewardIcon[i].visible=false;
					}
					
				}
			}
			
			
			
		}
		/**获取通关奖励*/
		private function gainReward():void
		{
			var i:int;
			for(i=0;i<allRewardIcon.length;i++)
			{
				GrayFilter.unGray(allRewardIcon[i]);
			}
			for(i=0;i<allRewardIcon.length;i++)
			{
				GrayFilter.unGray(allRewardIcon[i]);
			}
			if(DungeonManager.isReward)
			{
				DungeonManager.isReward=false;
				TweenLite.killDelayedCallsTo(tweeReward);
				TweenLite.delayedCall(3, tweeReward);
			}
		}
		
		
		
		
	}
}