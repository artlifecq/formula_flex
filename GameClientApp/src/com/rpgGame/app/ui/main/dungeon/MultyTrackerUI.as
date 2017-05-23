package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskSubRateInfo;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.fubenzhuizong.FuBen_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;

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
		private var killButList:Vector.<SkinnableContainer>;
		private var zoneId:int=0;
		private var remainTime:int;
		public function MultyTrackerUI()
		{
			_skin=new FuBen_Skin();
			super(_skin);
			init();
		}
		override protected function onShow() : void
		{
			var zid:int=7001;
			if(zoneId!=zid)
			{
				zoneId=zid;
				setTitle()
				setReword();
				setUisite();
				setTime();
			}
			
			
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
			skinList.push(_skin.killbut_0);
			skinList.push(_skin.killbut_1);
			skinList.push(_skin.killbut_2);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.sec_ico1_0);
			skinList.push(_skin.sec_ico1_4);
			skinList.push(_skin.sec_navi3);
			skinList.push(_skin.sec_ico2_0);
			skinList.push(_skin.sec_ico2_4);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_subbut1);
			var i:int;
			killButList=new Vector.<SkinnableContainer>();
			for(i=0;i<3;i++)
			{
				killButList.push(_skin["killbut_"+i]);
			}

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
			
			killButList[1].visible=false;
			killButList[2].visible=false;
		}
		private function setTitle():void
		{
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zoneId);
			if(zoneData==null)return;
			_skin.lbHeadName.text=zoneData.q_name;
			_skin.sec_navi1.htmlText="[阶段1]";
			_skin.lbMiaoshu.htmlText="此处为当前阶段的剧情描述文字此处为当前阶段的剧情描述文字";
			
			_skin.head_left.x=(_skin.lbHeadName.x+_skin.lbHeadName.width/2-_skin.lbHeadName.textWidth/2-_skin.head_left.width-7);
			_skin.head_right.x=(_skin.lbHeadName.x+_skin.lbHeadName.width/2+_skin.lbHeadName.textWidth/2+_skin.head_left.width+7);
		}
		
		/**设置任务目标内容*/
		public function setGoalInfo(type:int,describe:String,finisstr:String,subList:Vector.<TaskSubRateInfo>,txtButList:Vector.<SkinnableContainer>):void
		{
			var finiStr:Array;
			var informationList:Array=finisstr.split(";");
			var i:int,j:int,length:int;
			length=informationList.length;
			for(i=0;i<length;i++)
			{
				if(informationList[i]&&informationList[i]!="")
				{
					var text:String="";
					var modeid:int=0;
					var count:int=0,finish:int;
					var modeArr:Array=informationList[i].split(",");
					if(modeArr.length==2)
					{
						modeid=int(modeArr[0]);
						finish=int(modeArr[1]);
					}
					if(subList[i]!=null)
					{
						modeid=subList[i].modelId;
						count=subList[i].num;
					}
					if(modeid!=0)
					{
						text=TaskMissionCfgData.getTaskDescribe(type,describe,modeid);
					}
					if(type!=TaskType.SUB_CONVERSATION)
					{
						text+="<font color='#cfc6ae'>("+count+"/"+finish+")</font>";
					}
					
					setGotargetLabelText(txtButList[i],text);
					
				}
				
			}
			
			
		}
		public function setGotargetLabelText(but:SkinnableContainer,t:String):void
		{
			
			var rItme:Renwu_Item2;
			if(but!=null&&but.skin!=null)
			{
				rItme=but.skin as Renwu_Item2;
			}
			if(rItme!=null)
			{
				rItme.labelDisplay.htmlText=t;
				but.visible=true;
			}
		}
		/**设置奖励物品*/
		private function setReword():void
		{
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zoneId);
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(zoneId);
			if(zoneData==null||multyData==null)return;
			var passReward:Array=JSONUtil.decode(multyData.q_all_reward);
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
		
		private function setTime():void
		{
			var rTime:int=1600000;
			if(remainTime<0){
				_skin.sec_info.text="未开始挑战!";
			}else{
				remainTime=rTime/1000;
				_skin.sec_info.text="副本剩余时间："+TimeUtil.format3TimeType(remainTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.sec_info.text=TimeUtil.format3TimeType(remainTime);
			if(remainTime==0){
				TimerServer.remove(updateTime);
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
			
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			
			
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