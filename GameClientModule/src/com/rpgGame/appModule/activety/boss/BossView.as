package com.rpgGame.appModule.activety.boss
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.shijieboss.ShiJieBoss_Skin;
	
	/**
	 *boss标签 
	 * @author dik
	 * 
	 */
	public class BossView extends ViewUI
	{
		private var _skin:ShiJieBoss_Skin;
		private var _activeData:ListCollection;
		private var rewardIcon:Vector.<IconCDFace>;
		
		private var _avatar : InterAvatar3D;
		private var _avatarContainer:Inter3DContainer;
		private var _avatardata:MonsterData;
		private var selectedInfo:BossActInfo;

		private var actList:Vector.<ActivetyInfo>;
		
		public function BossView()
		{
			_skin=new ShiJieBoss_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=BossItemRender;
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			
			_activeData=new ListCollection();
			actList=ActivetyDataManager.getActiveList(ActivityEnum.BOSS_ACT);
			for(var i:int=0;i<actList.length;i++){
				_activeData.addItem(actList[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
			
			_avatarContainer=new Inter3DContainer();
			_avatar = new InterAvatar3D();
			_avatarContainer.addChild3D(_avatar);
			_avatardata=new MonsterData(RoleType.TYPE_MONSTER);
//			_avatarContainer.x=-28;
			_skin.modeCont.addChild(_avatarContainer);
			
			rewardIcon=new Vector.<IconCDFace>();
		}
		
		
		private function updateBoss(bossId:int):void
		{
			var bossCfg:Q_monster=MonsterDataManager.getData(bossId);
			_avatardata.avatarInfo.setBodyResID(bossCfg ? bossCfg.q_body_res : "", null);
			_avatar.setRoleData(this._avatardata);
			this._avatar.curRole.setScale(Number(selectedInfo.worldBossCfg.q_monster_scale));	
		}
		
		override public function show(data:Object=null):void
		{
			var icon:IconCDFace;
			for(var i:int=1;i<5;i++){
				icon=IconCDFace.create(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				icon.x=_skin["icon"+i].x;
				icon.y=_skin["icon"+i].y;
				_skin.container.addChild(icon);
			}
			initEvent();
			updateList();
			if(!data){
				_skin.ListItem.selectedIndex=0;
				_skin.ListItem.dataProvider.updateItemAt(0);
				_skin.ListItem.scrollToDisplayIndex(0);
			}else{
				var dataInfo:ActivetyInfo=data as ActivetyInfo;
				for(i=0;i<_activeData.length;i++){
					var info:ActivetyInfo=_activeData.data[i] as ActivetyInfo;
					if(info.actCfg.q_activity_id==dataInfo.actCfg.q_activity_id){
						_skin.ListItem.selectedIndex=i;
						_skin.ListItem.scrollToDisplayIndex(i);
						_skin.ListItem.dataProvider.updateItemAt(i);
						break;
					}
				}
			}
			onChange(null);
		}
		
		private function initEvent():void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateList);
		}
		
		private function updateList():void
		{
			for(var i:int=0;i<actList.length;i++){
				if(actList[i].info.joinState!=ActivityJoinStateEnum.COMPLETE){
					if(actList[i].actCfg.q_activity_limit_level>MainRoleManager.actorInfo.totalStat.level){
						actList[i].info.joinState=ActivityJoinStateEnum.CLOSE;//未开启
					}else{
						actList[i].info.joinState=ActivityJoinStateEnum.JOINING;//开启
					}
				}
			}
			actList=actList.sort(sortList);
			_activeData.removeAll();
			for(i=0;i<actList.length;i++){
				_activeData.addItem(actList[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
		}
		
		private function sortList(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info.joinState==ActivityJoinStateEnum.JOINING&&infoB.info.joinState!=ActivityJoinStateEnum.JOINING){
				return -1;
			}
			if(infoA.info.joinState!=ActivityJoinStateEnum.JOINING&&infoB.info.joinState==ActivityJoinStateEnum.JOINING){
				return 1;
			}
			return 0;
		}
		
		private function onChange(e:Event):void
		{
			var info:BossActInfo=_skin.ListItem.selectedItem as BossActInfo;
			if(!info){
				return;
			}
			selectedInfo=info;
			
			var arr:Array;
			if(info.actCfg.q_rewards){
				arr=JSONUtil.decode(info.actCfg.q_rewards);
			}else{
				arr=[];
			}
			var num:int=arr.length;
			for(var i:int=0;i<4;i++){
				if(i<num){
					var itemInfo:ClientItemInfo=new ClientItemInfo(arr[0].mod);
					itemInfo.itemInfo=new ItemInfo();
					itemInfo.itemInfo.isbind=arr[0].bind;
					FaceUtil.SetItemGrid(rewardIcon[i],itemInfo);
				}else{
					rewardIcon[i].clear();
				}
			}
			
			updateBoss(selectedInfo.actCfg.q_npc);
			
			_skin.activeName.styleName="ui/app/activety/shijieboss/mingzi/"+selectedInfo.actCfg.q_res_id+".png";
			var timeList:Array=ActivetyDataManager.getTimeList(info.actCfg);
			timeList=timeList[4];//第四个才是刷新段
			_skin.lbTime.htmlText="";
			num=timeList.length;
			for(i=0;i<num;i++){
				if(i%2==0){
					_skin.lbTime.text+=TimeUtil.changeIntHM2Str(timeList[i])+" ";
				}
			}
			if(selectedInfo.killerName&&selectedInfo.killerName.length!=0){
				_skin.lastSkiller.htmlText="最后一击:"+selectedInfo.killerName;
			}else{
				_skin.lastSkiller.htmlText="最后一击:拭目以待";
			}
		}
		
		override public function hide():void
		{
			var icon:IconCDFace;
			while(rewardIcon.length>0){
				icon=rewardIcon.pop();
				icon.destroy();
			}
		}
	}
}