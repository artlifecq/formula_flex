package com.rpgGame.appModule.dungeon.lunjian
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.common.DefaultPageItemRender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
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
		private var _avatar3d : UIAvatar3D;
		
		private var alertOk:AlertSetInfo;
		private var bgList:Vector.<UIAsset>;
		private var points:Vector.<Point>;
		
		public function LunJianItemRender()
		{
			_skin=new LunJian_TiaoZhanItem();
			super(_skin);
			rewardList=new Vector.<LunJian_Nandu>();
			rewardList.push(_skin.sk_jiandan.skin);
			rewardList.push(_skin.sk_kunnan.skin);
			rewardList.push(_skin.sk_emeng.skin);
			rewardIcon=new Vector.<IconCDFace>();
			_avatar3d=new UIAvatar3D(_skin.modeCont);
			bgList=new Vector.<UIAsset>();
			points=new Vector.<Point>();
			for(var i:int=0;i<3;i++){
				rewardList[i].mc_nandu.gotoAndStop((i+1).toString());
				rewardList[i].uiBg.visible=false;
				bgList.push(rewardList[i].Icon);
				points.push(new Point(bgList[i].x,bgList[i].y));
			}
			
			var icon:IconCDFace;
			for(i=0;i<3;i++){
				icon=IconCDFace.create(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				rewardList[i].container.addChildAt(icon,2);
				icon.bindBg(bgList[i]);
				icon.x=points[i].x;
				icon.y=points[i].y;
			}
			alertOk=new AlertSetInfo(LangAlertInfo.LUNJIAN_FIGHT_MIN);
		}
		
		override protected function onHide() : void
		{
			super.onHide();
			RoleFaceMaskEffectUtil.removeFaceMaskEffect(_avatar3d.role);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btnTiaozhan){
				var itemData:LunJianItemData=_data as LunJianItemData;
				if(itemData.diff==3){
					NoticeManager.showNotifyById(20001);//已经通关
					return;
				}
				
				var roleData:HeroData=MainRoleManager.actorInfo;
				if(roleData.totalStat.level<itemData.cfg.q_level){
					NoticeManager.showNotifyById(20000);//未达到等级的提示
					return;
				}
				
				var fight:int=roleData.totalStat.getStatValue(CharAttributeType.FIGHTING);
				if(fight<itemData.cfg.q_attack_power){
					GameAlert.showAlert(alertOk,onAlert,[itemData]);
					return;
				}
				
				AppManager.closeAllApp();
				DungeonSender.reqEnterDungeon(itemData.cfg.q_zone_id,itemData.cfg.q_id);
			}
		}
		
		private  function onAlert(gameAlert:GameAlert,datas:Array):void
		{
			var itemData:LunJianItemData=datas[0] as LunJianItemData;
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					AppManager.closeAllApp();
					DungeonSender.reqEnterDungeon(itemData.cfg.q_zone_id,itemData.cfg.q_id);
					break;
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
				var roleData:HeroData=MainRoleManager.actorInfo;
				_skin.uiOK.visible=itemData.diff==3;
				//设置背景
				var bgNum:int=itemData.num%3+1;
				_skin.modeBg.styleName="ui/app/jianghu/lunjian/beijing"+bgNum+".jpg";
				if(roleData.totalStat.level>=itemData.cfg.q_level){
					_skin.lbLevel.color=StaticValue.GREEN_TEXT;
				}else{
					_skin.lbLevel.color=StaticValue.RED_TEXT;
				}
				var fight:int=roleData.totalStat.getStatValue(CharAttributeType.FIGHTING);
				if(fight>=itemData.cfg.q_attack_power){
					_skin.lbZhanli.color=StaticValue.GREEN_TEXT;
				}else{
					_skin.lbZhanli.color=StaticValue.RED_TEXT;
				}
				_skin.lbName.text=npcCfg.q_name;
				_skin.lbLevel.text=itemData.cfg.q_level+"";
				_skin.lbZhanli.text=itemData.cfg.q_attack_power+"";
				
				_avatar3d.updateBodyWithRes(npcCfg ? npcCfg.q_body_res : "");
				_avatar3d.setDialogMask();
				
				var rewardItemList:Array;
				for(var i:int=0;i<3;i++){
					var icon:IconCDFace=rewardIcon[i];
					var diffCfg:Q_lunjian=LunJianCfg.getCfgByInfo(itemData.cfg.q_npc_map,itemData.cfg.q_type,i+1);
					rewardItemList=JSONUtil.decode(diffCfg.q_rewards);
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(rewardItemList[0].mod,1,rewardItemList[0].bind);
					FaceUtil.SetItemGrid(icon,itemInfo);
				}
				_skin.mc_nandu.visible=true;
				_skin.mc_nandu.gotoAndStop(String(itemData.diff+1));
				if(itemData.diff==0){
					_skin.lbName.color=StaticValue.GREEN_TEXT;
				}else if(itemData.diff==1){
					_skin.lbName.color=StaticValue.BLUE_TEXT;
				}else if(itemData.diff==2){
					_skin.lbName.color=StaticValue.RED_TEXT;
				}
				
				if(itemData.diff!=3){
					rewardList[itemData.diff].uiLingqu.visible=false;
					rewardList[itemData.diff].uiBg.visible=true;
					GrayFilter.unGray(_skin.btnTiaozhan);
				}else{
					_skin.lbLevel.text=LanguageConfig.getText(LangUI.UI_TEXT34);
					_skin.lbZhanli.text=LanguageConfig.getText(LangUI.UI_TEXT34);
					_skin.mc_nandu.visible=false;
					GrayFilter.gray(_skin.btnTiaozhan);
				}
				var index:int=itemData.diff-1;
				while(index>=0){
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