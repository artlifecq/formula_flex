package com.rpgGame.appModule.zhangong
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.ZhanGongSender;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_meritorious;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.role.MonsterBornData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.AvatarMaskType;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.ZhanGongUtil;
	import com.rpgGame.netData.zhangong.bean.MeritoriousInfo;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.zhangong.BossItem_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class BossItem extends SkinUI
	{
		private var _skin:BossItem_Skin;
		private var _type:int=0;
		private var _info:MeritoriousInfo;
		private var _q_meritorious:Q_meritorious;
		
		private var _avatar : InterAvatar3D;
		private var _avatarContainer:Inter3DContainer;
		private var _avatardata:MonsterData;
		public function BossItem()
		{
			_skin=new BossItem_Skin();
			super(_skin);
			_skin.conver.visible=false;
			_avatarContainer=new Inter3DContainer();
			_avatar = new InterAvatar3D();
			_avatar.x =100;
			_avatar.y = 230;
			_avatarContainer.addChild3D(_avatar);
			_avatardata=new MonsterData(RoleType.TYPE_MONSTER);
			_skin.container.addChild(_avatarContainer);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			updateShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.addEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePanel);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePanel);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnUp:
					toUpHandler();
					break;
				case _skin.uiDao:
					toWorkMonsterHandler();
					break;
			}
		}
		
		public function setData(data:*):void
		{
			_type=data as int;
			updateShow();
		}
		
		public function onTouchItem(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(this);
			if(!t){
				_skin.conver.visible=false;
				return;
			}
			t=e.getTouch(this,TouchPhase.HOVER);
			if(t){
				_skin.conver.visible=true;
			}
		}
		
		private function updateShow():void
		{
			clearData();
			_info=ZhanGongManager.getInfoByType(_type);
			if(_info==null) return ;
			var id:String=_info.level.toString()+"_"+_type;
			_q_meritorious= ZhanGongData.getmeritoriousById(id);
			if(_q_meritorious==null) return ;
			showMonster(_q_meritorious.q_monsterID);
			var name:String=MonsterDataManager.getMonsterName(_q_meritorious.q_monsterID);
			_skin.lbName.text=name;
			_skin.lbLevelCurrent.text="LV."+_info.level;
			_skin.lbLevelNext.text="LV."+(_info.level+1);
			
			var attValues:Q_att_values=AttValueConfig.getAttInfoById(_q_meritorious.q_att_type);
			var maps:HashMap=AttValueConfig.getTypeValueMap(attValues);
			var keys:Array=maps.keys();
			var values:Array=maps.values();
			setUIType(keys[0]);
			_skin.lbShengming.text="+"+values[0];
			
			var haveNum:int=MainRoleManager.actorInfo.totalStat.getResData(_q_meritorious.q_materil);
			_skin.lbNum.text=haveNum.toString()+"/"+_q_meritorious.q_num;
			_skin.pro_bar.value=(haveNum/_q_meritorious.q_num)*100<=100?(haveNum/_q_meritorious.q_num)*100:100;		
		}
		
		private function showMonster(monsterId:int):void
		{
			var bornData : Q_monster = MonsterDataManager.getData(monsterId);		
			_avatardata.avatarInfo.setBodyResID(bornData ? bornData.q_body_res : "", null);
			_avatar.setRoleData(this._avatardata);
			var listMask:Vector.<Number>=ZhanGongUtil.getMonsterMaskById(monsterId);
			RoleFaceMaskEffectUtil.addAvatarMask(AvatarMaskType.DIALOG_MASK,_avatar,listMask[0],listMask[1],listMask[2]);
		}
		
		private function setUIType(type:int):void
		{
			switch(type)
			{
				case CharAttributeType.HP:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/shengming.png";
					break;
				case CharAttributeType.CRIT_PER:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/baoji.png";
					break;
				case CharAttributeType.ANTI_CRIT_PER:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/baojikangxing.png";
					break;
				case CharAttributeType.CRIT:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/baojishanghai.png";
					break;
				case CharAttributeType.DEFENSE_PER:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/fangyu.png";
					break;
				case CharAttributeType.GENGU:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/gengu.png";
					break;
				case CharAttributeType.ATT_SPEED:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/gongjisudu.png";
					break;
				case CharAttributeType.HUIGEN:
					_skin.uiType.styleName="ui/app/beibao/zhangong/jiacheng/huigen.png";
					break;
				
			}
		}
		
		/**
		 * 执行寻路
		 * */
		private function toWorkMonsterHandler():void
		{
			if(_q_meritorious)
			{
				MainRoleSearchPathManager.walkToScene(_q_meritorious.q_mapID, _q_meritorious.q_site_x, _q_meritorious.q_site_y,null, 100,null,null);
			}
		}
		
		private function toUpHandler():void
		{
			var p:Point=new Point(this._skin.btnUp.x+this._skin.btnUp.width/2,this._skin.btnUp.y+this._skin.btnUp.height/2);
			p=this._skin.btnUp.parent.localToGlobal(p);
			p=this._skin.container.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
			ZhanGongSender.upZhanGongMessage(_type);
		}
		
		private function addComplete(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		private function updatePanel(msg:SCMeritoriousUpgradeResultMessage):void
		{
			if(msg.flag==1&&msg.meritoriousInfo.type==_type)
			{
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_jichengchenggong");
				updateShow();
			}
		}
		
		private function resChange(type:int=1):void
		{
			updateShow();
		}
		
		public function clearData():void
		{
			_skin.lbName.text="无";
			_skin.lbLevelCurrent.text="LV.0";
			_skin.lbLevelNext.text="LV.1";
			_skin.lbShengming.text="+0";
			_skin.lbNum.text="0/1";
			_skin.pro_bar.value=0;
		}
	}
}