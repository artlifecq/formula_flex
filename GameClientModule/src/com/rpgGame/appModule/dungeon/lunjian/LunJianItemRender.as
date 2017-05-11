package com.rpgGame.appModule.dungeon.lunjian
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.common.DefaultPageItemRender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.AvatarMaskType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_Nandu;
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_TiaoZhanItem;
	
	import starling.display.DisplayObject;
	
	/**
	 *论剑元素渲染器
	 *@author dik
	 *2017-5-2下午7:36:11
	 */
	public class LunJianItemRender extends DefaultPageItemRender
	{
		private var _skin:LunJian_TiaoZhanItem;
		private var rewardList:Vector.<LunJian_Nandu>;
		private var rewardIcon:Vector.<IconCDFace>;
		private var _avatar : InterAvatar3D;
		private var _avatarContainer:Inter3DContainer;
		private var _avatardata:MonsterData;
		
		public function LunJianItemRender()
		{
			_skin=new LunJian_TiaoZhanItem();
			super(_skin);
			rewardList=new Vector.<LunJian_Nandu>();
			rewardList.push(_skin.sk_jiandan.skin);
			rewardList.push(_skin.sk_kunnan.skin);
			rewardList.push(_skin.sk_emeng.skin);
			rewardIcon=new Vector.<IconCDFace>();
			var icon:IconCDFace;
			for(var i:int=0;i<3;i++){
				icon=new IconCDFace(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				rewardList[i].mc_nandu.gotoAndStop((i+1).toString());
				rewardList[i].uiBg.visible=false;
				rewardList[i].container.addChild(icon);
				icon.x=9;
				icon.y=1;
			}
			
			_avatarContainer=new Inter3DContainer();
			_avatar = new InterAvatar3D();
			_avatarContainer.addChild3D(_avatar);
			_avatardata=new MonsterData(RoleType.TYPE_MONSTER);
			
			_skin.modeCont.addChild(_avatarContainer);
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btnTiaozhan){
				var itemData:LunJianItemData=_data as LunJianItemData;
				if(itemData.diff==3){
					NoticeManager.showNotifyById(1207);
					return;
				}
				
				AppManager.closeAllApp();
				DungeonSender.reqEnterDungeon(itemData.cfg.q_zone_id,itemData.cfg.q_id);
			}
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function commitData():void
		{
			if(_skin){
				var itemData:LunJianItemData=_data as LunJianItemData;
				var npcCfg:Q_monster=MonsterDataManager.getData(itemData.cfg.q_npc);
				var mapId:int=itemData.cfg.q_npc_map;
				_skin.lbName.text=npcCfg.q_name;
				_skin.lbLevel.text=itemData.cfg.q_level+"";
				_skin.lbZhanli.text=itemData.cfg.q_attack_power+"";
				_skin.uiOK.visible=itemData.diff==3;
				
				_avatardata.avatarInfo.setBodyResID(npcCfg ? npcCfg.q_body_res : "", null);
				_avatar.setRoleData(this._avatardata);
				var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(npcCfg.q_body_res);
				var fadeX : int = RoleFaceMaskEffectUtil.getFaceMaskX(avatarResConfig.headFaceMask);
				var fadeY : int = RoleFaceMaskEffectUtil.getFaceMaskY(avatarResConfig.headFaceMask);
				fadeX=130;
				fadeY=-198;
				var scale:Number=RoleFaceMaskEffectUtil.getFaceMaskScale(avatarResConfig.headFaceMask);
				RoleFaceMaskEffectUtil.addAvatarMask(AvatarMaskType.DIALOG_MASK,_avatar,fadeX,
					fadeY,scale);
				
				var rewardItemList:Array;
				for(var i:int=0;i<3;i++){
					var icon:IconCDFace=rewardIcon[i];
					var diffCfg:Q_lunjian=LunJianCfg.getCfgByInfo(itemData.cfg.q_npc_map,itemData.cfg.q_type,i+1);
					rewardItemList=JSONUtil.decode(itemData.cfg.q_rewards);
					var itemInfo:ClientItemInfo=new ClientItemInfo(rewardItemList[0].mod);
					itemInfo.itemInfo=new ItemInfo();
					itemInfo.itemInfo.isbind=rewardItemList[0].bind;
					FaceUtil.SetItemGrid(icon,itemInfo);
				}
				
				_skin.mc_nandu.gotoAndStop(itemData.diff.toString());
				if(itemData.diff!=3){
					rewardList[itemData.diff].uiLingqu.visible=false;
					rewardList[itemData.diff].uiBg.visible=true;
				}
				var index:int=itemData.diff-1;
				while(index>0){
					rewardList[index].uiLingqu.visible=true;
					rewardList[index].uiBg.visible=false;
					index--;
				}
				
				index=itemData.diff+1;
				while(index<3){
					rewardList[index].uiLingqu.visible=false;
					rewardList[index].uiBg.visible=false;
					index++;
				}
				
			}
		}
	}
}