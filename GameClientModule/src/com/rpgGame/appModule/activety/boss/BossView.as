package com.rpgGame.appModule.activety.boss
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.AvatarMaskType;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
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
			var list:Vector.<ActivetyInfo>=ActivetyDataManager.getActiveList(ActivityEnum.BOSS_ACT);
			if(!list){
				list=new Vector.<ActivetyInfo>();
			}
			for(var i:int=0;i<list.length;i++){
				_activeData.addItem(list[i]);
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
			_avatar.scale=1;
		}
		
		override public function show(data:Object=null):void
		{
			var icon:IconCDFace;
			for(var i:int=1;i<5;i++){
				icon=IconCDFace.getIcoFace(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				icon.x=_skin["icon"+i].x;
				icon.y=_skin["icon"+i].y;
				_skin.container.addChild(icon);
			}
		}
		
		override public function hide():void
		{
			var icon:IconCDFace;
			while(rewardIcon.length>0){
				icon=rewardIcon.pop();
				IconCDFace.releaseIcoFace(icon);
			}
		}
	}
}