package com.rpgGame.appModule.zhangong
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.sender.ZhanGongSender;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.AwdProgressBar;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.coreData.cfg.ZhanGongMonsterData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_meritorious;
	import com.rpgGame.coreData.clientConfig.Q_meritorious_monster;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.AvatarMaskType;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.ZhanGongUtil;
	import com.rpgGame.netData.zhangong.bean.MeritoriousInfo;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import flash.geom.Point;
	
	import away3d.events.Event;
	
	import feathers.utils.filter.GrayFilter;
	
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
		private var _isCanUp:Boolean=false;
		
		private var _progressBar:AwdProgressBar;
		private static var noAlertWash:Boolean;
		
		public function BossItem()
		{
			_skin=new BossItem_Skin();
			super(_skin);
			_skin.conver.visible=false;
			_avatarContainer=new Inter3DContainer();
			_avatar = new InterAvatar3D();
			_avatarContainer.addChild3D(_avatar);
			_avatarContainer.x=-25;
			_avatardata=new MonsterData(RoleType.TYPE_MONSTER);
			_skin.uiBg.addChild(_avatarContainer);
			//			_skin.uiName.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			_progressBar=new AwdProgressBar(_skin.pro_bar,"ui_zhangongtexiao");
			_progressBar.x=16;
			_progressBar.y=154;
			_progressBar.maximum=100;
			_progressBar.minimum=0;
			_skin.container.addChild(_progressBar);
			_skin.container.addChild(_skin.lbNum);
			_skin.lbNumUp.visible=false;
			_skin.uiUp.visible=false;
			TaskUtil.addLabelEvet(_skin.lbName);
			//			_skin.container.addChild(_avatarContainer);
			
		}
		
		override protected function onShow():void
		{
			super.onShow();
			updateShow();
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			_skin.btnUp.addEventListener(starling.events.TouchEvent.TOUCH, onTouchBtn);
			//			_skin.btnUp.addEventListener(Event.TRIGGERED,toUpHandler);
			EventManager.addEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePanel);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
			TipTargetManager.remove(_skin.conver);
			TipTargetManager.show( _skin.conver, TargetTipsMaker.makeSimpleTextTips(TipsCfgData.getTipsInfo(19).q_describe));
			//			TipTargetManager.show( _skin.conver,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(19)));
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			_skin.btnUp.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchBtn);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePanel);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,resChange);
			if(_avatar!=null&&_avatar.curRole!=null)
				RoleFaceMaskEffectUtil.removeFaceMaskEffect(_avatar.curRole);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnUp:
					toUpHandler(null);
					break;
				case _skin.btnDao:
					flyToScene();
					break;
				case _skin.lbName:
				case _skin.ui_nameBg:
					toWorkMonsterHandler();
					break;
			}
		}
		
		public function setData(type:int):void
		{
			_type=type;
			updateShow();
		}
		private static const HELPER_POINT:Point = new Point();
		protected var touchPointID:int = -1;
		public function onTouchItem(event:TouchEvent):void
		{
			if(this.touchPointID >= 0)
			{
				var touch:Touch = event.getTouch(this, null, this.touchPointID);
				if(!touch || !this.stage)
				{
					//this should never happen
					return;
				}
				
				touch.getLocation(this.stage, HELPER_POINT);
				var isInBounds:Boolean = this.contains(this.stage.hitTest(HELPER_POINT));
				if(touch.phase === TouchPhase.MOVED)
				{
					if(isInBounds)
					{
						_skin.conver.visible=true;
					}
					else
					{
						_skin.conver.visible=false;
					}
				}else if(touch.phase === TouchPhase.ENDED){
					this.touchPointID = -1;
					if(isInBounds)
					{
						_skin.conver.visible=true;
					}
					else
					{
						_skin.conver.visible=false;
					}
				}
				return;
			}
			else //if we get here, we don't have a saved touch ID yet
			{
				touch = event.getTouch(this, TouchPhase.BEGAN);
				if(touch)
				{
					_skin.conver.visible=true;
					this.touchPointID = touch.id;
					return;
				}
				touch = event.getTouch(this, TouchPhase.HOVER);
				if(touch)
				{
					_skin.conver.visible=true;
					return;
				}
				
				//end of hover
				_skin.conver.visible=false;
			}
			
		}
		
		public function onTouchBtn(e:TouchEvent):void
		{
			var t1:Touch=e.getTouch(_skin.btnUp);
			if(!t1){
				_skin.lbNumUp.visible=false;
				_skin.uiUp.visible=false;
				EventManager.dispatchEvent(ZhanGongEvent.BOSSITEN_CLOSE);
				return;
			}
			t1=e.getTouch(_skin.btnUp,TouchPhase.HOVER);
			if(t1){
				updateShuxingShow();
			}
		}
		
		private function updateShuxingShow():void
		{
			var str:String=ZhanGongManager.getNextNumber(_type,_info.level);
			if(str!=null)
			{
				var arr:Array=str.split('_');
				var attType:int=parseInt(arr[0]);
				var num:int=parseInt(arr[1]);
				_skin.lbNumUp.text=num.toString();
				_skin.lbNumUp.visible=true;
				_skin.uiUp.visible=true;
				EventManager.dispatchEvent(ZhanGongEvent.BOSSITEN_SHOW,str);
			}
			else
			{
				_skin.lbNumUp.visible=false;
				_skin.uiUp.visible=false;
			}
		}
		
		private function updateShow():void
		{
			clearData();
			updateZhanLiNumber();
			if(_q_meritorious)
			{
				showMonster(_q_meritorious.q_monsterID);
			}
			updateNumber();
		}
		
		private function updateZhanLiNumber():void
		{
			_info=ZhanGongManager.getInfoByType(_type);
			if(_info==null) return ;
			var id:String=_info.level.toString()+"_"+_type;
			_q_meritorious= ZhanGongData.getmeritoriousById(id);
			if(_q_meritorious==null) return ;
			var name:String=MonsterDataManager.getMonsterName(_q_meritorious.q_monsterID);
			_skin.lbName.text=name;
			_skin.btnDao.x=_skin.lbName.textWidth+_skin.lbName.x;
			_skin.lbLevelCurrent.text="LV."+_info.level;
			_skin.lbLevelNext.text="LV."+(_info.level+1);
			
			var attValues:Q_att_values=AttValueConfig.getAttInfoById(ZhanGongUtil.getAttByJob(_q_meritorious,MainRoleManager.actorInfo.job));
			var maps:HashMap=AttValueConfig.getTypeValueMap(attValues);
			var keys:Array=maps.keys();
			var values:Array=maps.values();
			setUIType(keys[0]);
			_skin.numZhanli.label="x"+AttValueConfig.getDisAttValue(keys[0],values[0]).toString();
			updateNumber();
		}
		
		private function updateNumber():void
		{
			if(_q_meritorious==null) return;
			var haveNum:int=MainRoleManager.actorInfo.totalStat.getResData(_q_meritorious.q_materil);
			_skin.lbNum.text=haveNum.toString()+"/"+_q_meritorious.q_num;
			_isCanUp=_skin.uiDian.visible=haveNum>=_q_meritorious.q_num;
			
			if(_isCanUp) _skin.btnUp.filter=null;
			else GrayFilter.gray(_skin.btnUp);
			
			_progressBar.value=(haveNum/_q_meritorious.q_num)*100<=100?(haveNum/_q_meritorious.q_num)*100:100;	
			if(_skin.lbNumUp.visible) updateShuxingShow();
		}
		
		private function showMonster(monsterId:int):void
		{
			var bornData : Q_monster = MonsterDataManager.getData(monsterId);		
			_avatardata.avatarInfo.setBodyResID(bornData ? bornData.q_body_res : "", null);
			_avatar.setRoleData(this._avatardata);
			var cfg:Q_meritorious_monster=ZhanGongMonsterData.getPointById(monsterId);
			var scale:Number=parseFloat(cfg.q_scale);
			RoleFaceMaskEffectUtil.addAvatarMask(AvatarMaskType.BOSS_ITEM,_avatar,cfg.q_pointX,
				cfg.q_pointY,scale);
		}
		
		private function setUIType(type:int):void
		{
			switch(type)
			{
				case CharAttributeType.HP:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/shengming.png";
					break;
				case CharAttributeType.MAX_HP:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/shengming.png";
					break;
				case CharAttributeType.CRIT_PER:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/baoji.png";
					break;
				case CharAttributeType.ANTI_CRIT_PER:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/baojikangxing.png";
					break;
				case CharAttributeType.CRIT:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/baojisanghai.png";
					break;
				case CharAttributeType.DEFENSE_PER:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/fangyu.png";
					break;
				case CharAttributeType.GENGU:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/gengu.png";
					break;
				case CharAttributeType.ATT_SPEED:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/gongjisudu.png";
					break;
				case CharAttributeType.HUIGEN:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/huigen.png";
					break;
				case CharAttributeType.LIDAO:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/lidao.png";
					break;
				case CharAttributeType.HIT:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/gzhonglv.png";
					break;
				/*case CharAttributeType.NEI_GONG:
				_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/neigong.png";
				break;*/
				case CharAttributeType.MP:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/nengliang.png";
					break;
				case CharAttributeType.MP_REC:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/nenglianghuifu.png";
					break;
				case CharAttributeType.HP:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/qixue.png";
					break;
				case CharAttributeType.SHENFA:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/shenfa.png";
					break;
				case CharAttributeType.HP_REC:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/shengminghuifu.png";
					break;
				case CharAttributeType.ANTI_EFFECT:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/xiaoguodikang.png";
					break;
				case CharAttributeType.SPEED:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/yidongsudu.png";
					break;
				case CharAttributeType.WAI_GONG:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/waigong.png";
					break;
				default:
					_skin.uiName.styleName="ui/app/beibao/zhangong/jiacheng/shengming.png";
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
				MainRoleSearchPathManager.walkToScene(_q_meritorious.q_mapID, _q_meritorious.q_site_x, _q_meritorious.q_site_y,null, 100);
			}
		}
		
		/**
		 * 小飞鞋
		 * */
		private function flyToScene():void
		{
			if(_q_meritorious)
			{
				SceneSender.sceneMapTransport(_q_meritorious.q_mapID, _q_meritorious.q_site_x, _q_meritorious.q_site_y);
			}
		}
		
		private function toUpHandler(e:Event):void
		{
			if(_isCanUp)
			{			
				var p:Point=new Point(this._skin.btnUp.x+this._skin.btnUp.width/2,this._skin.btnUp.y+this._skin.btnUp.height/2);
				p=this._skin.btnUp.parent.localToGlobal(p);
				p=this._skin.container.globalToLocal(p);
				this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
				ZhanGongSender.upZhanGongMessage(_type);
			}
			else
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(2010));
			}
		}
		
		private function addComplete(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		private function updatePanel(msg:SCMeritoriousUpgradeResultMessage):void
		{
			if(msg.flag==1&&msg.meritoriousInfo.type==_type)
			{
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_shengjichenggong");
				updateZhanLiNumber();
			}
		}
		
		private function resChange(type:int=1):void
		{
			updateNumber();
		}
		
		public function clearData():void
		{
			_skin.lbName.text="无";
			_skin.lbLevelCurrent.text="LV.0";
			_skin.lbLevelNext.text="LV.1";
			_skin.numZhanli.label="x0";
			_skin.lbNum.text="0/1";
			_progressBar.value=0;
			//			_skin.pro_bar.value=0;
			
		}
	}
}