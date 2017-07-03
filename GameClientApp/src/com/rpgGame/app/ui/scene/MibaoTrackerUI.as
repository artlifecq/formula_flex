package com.rpgGame.app.ui.scene
{
	import com.gameClient.log.Lyt;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.activety.zonghe.qinlinmibao.Act_MiBao_ZhuiZong;
	import org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	/**
	 * 秦陵秘宝追踪
	 * @author YT
	 * 
	 */	
	public class MibaoTrackerUI extends SceneTrackerUI
	{
		private var _skin:Act_MiBao_ZhuiZong;
		private var skinList:Array;
		private var killButList:Vector.<Label>;
		private var killOkList:Vector.<UIAsset>;
		private var ico1List:Vector.<IconCDFace>;
		private var icoBg1List:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		private var icoBg2List:Vector.<UIAsset>;
		private var hitList:Vector.<PaiMing_Item>;
		public function MibaoTrackerUI()
		{
			_skin=new Act_MiBao_ZhuiZong();
			super(_skin);
			initUI();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.name){
				case _skin.sec_subbut1.name:
					Lyt.a("退出");
					AppManager.showApp(AppConstant.ACTIVETY_MIBAO_RESULT);
					break;
			}
		}
		override protected function onShow() : void
		{
			super.onShow();
			addEvent();
			setUiRefresh();
			setStep(2);
			setJifenReword();
			setShanghaiReword();
			setShanghaiRank();
			setTime(500);
			setUisite();
		}
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
			var icon:IconCDFace;
			while(ico1List.length>0){
				icon=ico1List.pop();
				icon.destroy();
			}
			while(ico2List.length>0){
				icon=ico2List.pop();
				icon.destroy();
			}
			icon=null;
		}
		private function addEvent():void
		{
			
			
		}
		private function removeEvent():void
		{
			
			
		}
		/**设置步骤面板显示*/
		private function setStep(step:int):void
		{
			if(step==1)
			{
				_skin.sec_navi0.visible=true;
				_skin.sec_navi2.visible=false;
				_skin.shanghai_List.visible=false;
				
			}
			else if(step==2)
			{
				_skin.sec_navi0.visible=true;
				_skin.sec_navi2.visible=true;
				_skin.shanghai_List.visible=true;
				
			}
		}
		/**设置击杀目标*/
		private function setKillInfo():void
		{
			var i:int=0;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			var killList:Array;
			//var killList:Vector.<KillMonsterInfo>=DungeonManager.killInfos;
			//var rItme:Renwu_Item2;
			//var qzm:Q_dailyzone_monster;
			if(killList&&killList.length>0)
			{
				for(i=0;i<killList.length;i++)
				{
					//qzm=DailyZoneMonsterCfgData.getZoneCfg(killList[i].monsterModelId);
					if(i<killButList.length)
					{
						//rItme=killButList[i].skin as Renwu_Item2;
						//killButList[i].htmlText="击杀：<u>"+MonsterDataManager.getMonsterName(qzm.q_monsterId)+"</u><font color='#cfc6ae'>("+killList[i].count+"/"+qzm.q_monsterNum+")</font>";
						killButList[i].visible=true;
					}
					
				}
			}
			
			setUisite();
		}
		/**设置积分奖励物品*/
		private function setJifenReword():void
		{
			_skin.lbJifen.text="5864";
			_skin.lbZhenqi.text="20156";
			var passReward:Array=JSONUtil.decode('[{"mod":802,"num":1,"show":1},{"mod":803,"num":1,"show":1},{"mod":804,"num":1,"show":1}]'/*multyData.q_all_reward*/);
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
			
		}
		/**设置伤害奖励物品*/
		private function setShanghaiReword():void
		{
			
			var passReward:Array=JSONUtil.decode('[{"mod":802,"num":1,"show":1},{"mod":803,"num":1,"show":1},{"mod":804,"num":1,"show":1}]'/*multyData.q_all_reward*/);
			var i:int;
			var ico:IconCDFace; 
			var item:Q_item;
			if(passReward&&passReward.length>0)
			{
				for(i=0;i<passReward.length;i++)
				{
					if(i<ico2List.length&&passReward[i]!=null)
					{
						item=ItemConfig.getQItemByID(passReward[i].mod);
						ico=ico2List[i];
						if(item!=null&&ico!=null)
						{
							ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
							ico.visible=true;
							icoBg2List[i].visible=true;
							TaskUtil.setItemTips(ico,item,passReward[i].num);
						}
					}
				}
			}
			
		}
		/**设置伤害排行*/
		private function setShanghaiRank():void
		{
			var i:int;
			for(i=0;i<3;i++)
			{
				hitList[i].lbName.text="玩家名称"+i;
				hitList[i].lbNum.text=""+(i*100);
			}
			hitList[3].lbNo.text="33";
			hitList[3].lbName.text="我的名称";
			hitList[3].lbNum.text="500";
		}
		
		private var remainTime:int;
		private function setTime(time:int):void
		{
			var rTime:int=time;
			if(rTime<0){
				_skin.sec_info.text="00:00:00";
			}else{
				remainTime=rTime;
				_skin.sec_info.text=TimeUtil.format3TimeType(remainTime);
				TimerServer.remove(updateTime);
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
		private function initUI():void
		{
			skinList=new Array();
			skinList.push(_skin.lbHeadName);
			skinList.push(_skin.sec_navi0);
			skinList.push(_skin.lbItem0);
			skinList.push(_skin.lbItem1);
			skinList.push(_skin.lbItem2);
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.lbJifen);
			skinList.push(_skin.lbZhenqi);
			skinList.push(_skin.ico1_0);
			skinList.push(_skin.ico1_4);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.shanghai_List);
			skinList.push(_skin.ico2_0);
			skinList.push(_skin.ico2_4);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_subbut1);
			var i:int;
			killButList=new Vector.<Label>();
			killOkList=new Vector.<UIAsset>();
			for(i=0;i<3;i++)
			{
				killButList.push(_skin["lbItem"+i]);
				killOkList.push(_skin["jisha"+i]);
			}
			var ico:IconCDFace;
			icoBg1List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg1List.push(_skin["ico1_"+i]);
			}
			ico1List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg1List.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg1List[i].x-6;
				ico.y=icoBg1List[i].y-6;
				ico.visible=false;
				ico1List.push(ico);
				_skin.task_box.addChild(ico);
			}
			icoBg2List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg2List.push(_skin["ico2_"+i]);
			}
			ico2List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg2List.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg2List[i].x-6;
				ico.y=icoBg2List[i].y-6;
				ico.visible=false;
				ico2List.push(ico);
				_skin.task_box.addChild(ico);
			}
			hitList=new Vector.<PaiMing_Item>();
			for(i=0;i<4;i++)
			{
				hitList.push(_skin["pmItem"+i].skin as PaiMing_Item);
			}
			
		}
		
		/**UI刷新*/
		private function setUiRefresh():void
		{
			var i:int;
			_skin.sec_navi0.visible=false;
			_skin.jf_num.text="";
			_skin.zq_num.text="";
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
				killOkList[i].visible=false;
			}
			for(i=0;i<icoBg1List.length;i++)
			{
				icoBg1List[i].visible=false;
				ico1List[i].visible=false;
				icoBg2List[i].visible=false;
				ico2List[i].visible=false;
			}
			_skin.sec_navi2.visible=false;
			_skin.shanghai_List.visible=false;
			for(i=0;i<hitList.length;i++)
			{
				hitList[i].lbNo.text=(i+1).toString();
				hitList[i].lbName.text="";
				hitList[i].lbNum.text="0";
			}
			_skin.sec_info.text="00:00:00";
			
		}
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			
			_skin.jf_num.y=_skin.lbJifen.y;
			_skin.zq_num.y=_skin.lbZhenqi.y;
			for(i=0;i<killButList.length;i++)
			{
				killOkList[i].y=killButList[i].y-26;
			}
			var id:int;
			for(i=0;i<icoBg1List.length;i++)
			{
				id=int(i/4)*4;
				if(icoBg1List[i].visible)
				{
					icoBg1List[i].y=icoBg1List[id].y;
					ico1List[i].y=icoBg1List[id].y-6;
				}
				if(icoBg2List[i].visible)
				{
					icoBg2List[i].y=icoBg2List[id].y;
					ico2List[i].y=icoBg2List[id].y-6;
				}
			}
		}
		
		
	}
	
}