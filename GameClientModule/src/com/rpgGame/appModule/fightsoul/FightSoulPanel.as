package com.rpgGame.appModule.fightsoul
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.systemset.TouchToState;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.cfg.FightsoulModeData;
	import com.rpgGame.coreData.cfg.FightsoulPathData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_mode;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.fightsoul.bean.FightSoulInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.VerticalLayout;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;
	import org.mokylin.skin.app.zhanhun.Zhanhun_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class FightSoulPanel extends SkinUIPanel
	{
		private var _skin:Zhanhun_Skin;
		private var _currentShowMode:int;
		private var _listdatas:Vector.<FightSoulPathInfoData>;
		private var _propList:Vector.<PropView>;
		protected var touchToState:TouchToState;
		private var _skillData:Q_skill_model;
		private var _skillIcon:IconCDFace;
		
		private var _itemIconLists:Vector.<IconCDFace>;
		private var _showAvatarData : RoleData;
		private var _fightsoul:InterAvatar3D;
		private var _touchstate:ButtonTouchState;
		public function FightSoulPanel():void
		{
			_skin=new Zhanhun_Skin();
			super(_skin);
			initView();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			initData();
			initEvent();
			refeashView();
			haveRewardEffect();
		}
		
		private function initData():void
		{
			_currentShowMode = FightSoulManager.instance().currentMode.q_mode;
			_skillData= FightSoulManager.instance().getSpellData();
		}
		
		private function sortList(q1:FightSoulPathInfoData,q2:FightSoulPathInfoData):int
		{
			if((q1.isOver||q1.isOpen()==false)&&(q2.isOpen()&&q2.isOver==false)){
				return 1;
			}
			if((q1.isOpen()&&q1.isOver==false)&&(q2.isOpen()==false||q2.isOver)){
				return -1;
			}
			if(q1.path.q_id<q2.path.q_id){
				return -1;
			}else {
				return 1;
			}
			return 0;
		}
		
		private function initEvent():void
		{
			_skin.btn_prev.addEventListener(Event.TRIGGERED,triggeredHander);
			_skin.btn_next.addEventListener(Event.TRIGGERED,triggeredHander);
			_skin.btn_huanhua.addEventListener(Event.TRIGGERED,huanhuaTriggeredHandler);
			_skin.btn_up.addEventListener(Event.TRIGGERED,uptriggeredHandler);
			_skin.btn_up.addEventListener(FeathersEventType.STATE_CHANGE,buttonTouchHandler);
			EventManager.addEvent(FightSoulManager.FightSoul_Exp,refeahExp);
			EventManager.addEvent(FightSoulManager.FightSoul_Level,refeahLevel);
			EventManager.addEvent(FightSoulManager.FightSoul_ModeLevel,refeashQualityView);
			EventManager.addEvent(FightSoulManager.FightSoul_Vitality,refeashVitality);
			EventManager.addEvent(FightSoulManager.FightSoul_GetReward,refeashRewards);
			EventManager.addEvent(FightSoulManager.FightSoul_TypeValue,listrefeash);
		}
		
		private function listrefeash():void
		{
			_listdatas = new Vector.<FightSoulPathInfoData>();
			var datas:Vector.<Q_fightsoul_path> = FightsoulPathData.datas;
			for each(var q:Q_fightsoul_path in datas)
			{
				var data:FightSoulPathInfoData = new FightSoulPathInfoData(q);
				data.refeash();
				_listdatas.push(data);
			}
			_listdatas.sort(sortList);
			
			_skin.List.dataProvider.data = _listdatas;
		}
		
		private function refeashRewards():void
		{
			for(var index:int = 0;index<_itemIconLists.length;index++)
			{
				if(FightSoulManager.instance().isGetReward(index))
				{
					GrayFilter.gray(_itemIconLists[index]);
					
				}
				else
				{
					_itemIconLists[index].filter = null;
				}
				setRTNState(RTNodeID.ZH_REWARD+"-"+index,FightSoulManager.instance().canGetReward(index));
			}
		}
		private var _bigEffect:InterObject3D
		private function uptriggeredHandler(e:Event):void
		{
			if(!FightSoulManager.instance().FightSoulLevelUp())
			{
				if(_bigEffect==null)
					_bigEffect=this.playInter3DAt(ClientConfig.getEffect("ui_zhanhun_da"),-15,0,1,completeHandle);
			}
		}
		private function completeHandle(sr3D : InterObject3D):void
		{
			_bigEffect = null;
		}
		
		private function haveRewardEffect():void
		{
			var rewards:Vector.<ClientItemInfo> = FightSoulManager.instance().RewardInfos;
			var length:int = rewards.length;
			var bool:Boolean = false;
			for(var i:int = 0;i<length;i++)
			{
				if(FightSoulManager.instance().isGetReward(i))
					continue;
				if(int(rewards[i].itemInfo.parameters)<=FightSoulManager.instance().fightSoulInfo.vitality)
				{
					bool = true;
					break;
				}
			}
			if(bool&&_bigEffect==null)
				_bigEffect=this.playInter3DAt(ClientConfig.getEffect("ui_zhanhun_xiao"),-23,-12,1,completeHandle);
		}
		
		private function buttonTouchHandler(event:Event):void
		{
			var bool:Boolean = false;
			var state:String = _skin.btn_up.currentState;
			if(state == "hover")
			{
				bool = true;
			}
			for each(var view:PropView in _propList)
			{
				view.showUpLevelView(bool);
			}
			_skin.num_lv.visible = bool;
		}
		
		private function huanhuaTriggeredHandler(e:Event):void
		{
			var cshowshet:Q_fightsoul = FightsoulData.getInfoByMode(_currentShowMode);
			if(cshowshet.q_level !=fightSoulInfo.curModelLv)
			{
				FightSoulManager.instance().chageModeLevel(cshowshet.q_level );
			}
		}
		private function triggeredHander(e:Event):void
		{
			if(e.target == _skin.btn_prev)
			{
				_currentShowMode --;
			}else if(e.target == _skin.btn_next)
			{
				_currentShowMode ++;
			}
			refeashQualityView();
		}
		private function initView():void
		{
			var content:Inter3DContainer = new Inter3DContainer();
			_skin.container.addChild(content);
			_fightsoul = new InterAvatar3D();
			_fightsoul.x = 340;
			content.addChild3D(_fightsoul);
			_showAvatarData = new RoleData(0);
			
			_propList = new Vector.<PropView>();
			_propList.push(new PropView(_skin.lab_prop1.skin as Shuxing_Skin,CharAttributeType.WAI_GONG));
			_propList.push(new PropView(_skin.lab_prop2.skin as Shuxing_Skin,CharAttributeType.LIDAO));
			_propList.push(new PropView(_skin.lab_prop3.skin as Shuxing_Skin,CharAttributeType.MAX_HP));
			_propList.push(new PropView(_skin.lab_prop4.skin as Shuxing_Skin,CharAttributeType.GENGU));
			_propList.push(new PropView(_skin.lab_prop5.skin as Shuxing_Skin,CharAttributeType.DEFENSE_PER));
			_propList.push(new PropView(_skin.lab_prop6.skin as Shuxing_Skin,CharAttributeType.HIT));
			
			
			_skin.List.itemRendererType = FightSoulActityCell;
			_skin.List.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_skin.List.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.List.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.List.layout = layout;
			_skin.List.dataProvider = new ListCollection();
			_skin.lb_progress.touchable = false;
			
			_skillIcon = IconCDFace.create(IcoSizeEnum.ICON_42);
			_skillIcon.showCD = false;
			_skillIcon.bindBg(_skin.icon);
			addChild(_skillIcon);
			
			var length:int = FightSoulManager.instance().RewardInfos.length;
			var icon:IconCDFace
			_itemIconLists = new Vector.<IconCDFace>();
			
			var iconList:Array = new Array();
			iconList.push(_skin.item_icon1);
			iconList.push(_skin.item_icon2);
			iconList.push(_skin.item_icon3);
			iconList.push(_skin.item_icon4);
			for(var i:int = 0;i<length;i++)
			{
				icon= IconCDFace.create(IcoSizeEnum.ICON_42);
				icon.bindBg(iconList[i]);
				_skin.itemGroup.addChild(icon);
				/*var touch:TouchToState = new TouchToState(icon,rewardIconTriggeredHandler);
				touch.data = i;*/
				_itemIconLists.push(icon);
				
				addNode(RTNodeID.MAIN_ZHANHUN,RTNodeID.ZH_REWARD+"-"+i,icon,56,null);
			}
			addNode(RTNodeID.MAIN_ZHANHUN,RTNodeID.ZH_UP,_skin.btn_up,112,FightSoulManager.instance().canLevelUp,false,null,true);
			TipTargetManager.show( _skin.btn_shuoming,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(27)));
			TipTargetManager.show(_skin.pro_jindu, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangUI_2.FightSoulExpTip)));
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target is IconCDFace)
			{
				var index:int = _itemIconLists.indexOf(IconCDFace(target));
				if(index<0)
					return ;
				FightSoulManager.instance().getRewardByIndex(index);
			}
		}
		private function refeashView():void
		{
			refeashQualityView();
			refeahLevelView();
			refeashVitality();
			_skin.num_lv.visible = false;
			listrefeash();
			FaceUtil.SetSkillGrid(_skillIcon, FaceUtil.chanceSpellToFaceInfo(_skillData), true);//目前Tips有bug,待修改
//			_skillIcon.setIconPoint(5,5);
			var icon:IconCDFace
			for(var index:int = 0;index<_itemIconLists.length;index++)
			{
				icon = _itemIconLists[index];
				FaceUtil.setGridData(icon,FightSoulManager.instance().RewardInfos[index],true);
//				icon.setIconPoint(4,4);
			}
			refeashRewards();
		}
		private function rewardIconTriggeredHandler(touch:Touch,ts:TouchToState):void
		{
			if(touch.phase == TouchPhase.ENDED)
			{
				var index:int = ts.data as int;
				FightSoulManager.instance().getRewardByIndex(index);
			}
		}
		private function refeahLevelView():void
		{
			refeahLevel();
			refeahExp();
			
		}
		private function refeahLevel():void
		{
			var currentatt:Q_att_values = AttValueConfig.getAttInfoById(currentMode.q_baseAtt_id);
			var nextatt:Q_att_values;
			var nextShet:Q_fightsoul = FightsoulData.getInfobyId(fightSoulInfo.level+1);
			var job:int = MainRoleManager.actorInfo.job;
			var currentPower:int = FightValueUtil.calFightPowerByAttValue(currentatt,job);
			_skin.NumZhanli.number = currentPower;
			if(nextShet!=null)
			{
				nextatt = AttValueConfig.getAttInfoById(nextShet.q_baseAtt_id);
				var nextPower:int = FightValueUtil.calFightPowerByAttValue(nextatt,job);
				_skin.num_lv.label = "+"+(nextPower-currentPower).toString();
			}else{
				_skin.num_lv.label = "+0";
			}
			
			if(FightSoulManager.instance().fightSoulInfo.level==FightsoulData.FightSoulMaxLevel){
				_skin.uiOk.visible=true;
				_skin.grp_jindu.visible=false;
			}else{
				_skin.uiOk.visible=false;
				_skin.grp_jindu.visible=true;
			}
			
			
			for each(var view:PropView in _propList)
			{
				view.updataAtt(currentatt,nextatt);
			}
		}
		
		private function refeahExp():void
		{
			_skin.num_current.number = fightSoulInfo.level;
			_skin.num_next.number = fightSoulInfo.level+1;
			_skin.num_current.width=_skin.num_current.number.toString().length*16+5;
			_skin.num_next.width=_skin.num_next.number.toString().length*16+5;
			
			var parcent:Number = fightSoulInfo.exp/currentMode.q_exp;
			if(parcent<0)
				parcent=0;
			else if(parcent>1)
				parcent = 1;
			_skin.pro_jindu.value = _skin.pro_jindu.maximum*parcent;
			_skin.lbTiao.x = _skin.pro_jindu.x+_skin.pro_jindu.width*parcent-5;
			_skin.lb_progress.text = fightSoulInfo.exp.toString()+"/"+currentMode.q_exp;
			notifyUpdate(RTNodeID.ZH_UP);
		}
		
		private function refeashVitality():void
		{
			_skin.pro_zongjindu.value = fightSoulInfo.vitality/200*_skin.pro_zongjindu.maximum;
			_skin.lb_jindu.text = LanguageConfig.getText(LangUI_2.FightSoulProgress).replace("$",fightSoulInfo.vitality);
			for(var index:int = 0;index<_itemIconLists.length;index++)
			{
				setRTNState(RTNodeID.ZH_REWARD+"-"+index,FightSoulManager.instance().canGetReward(index));
			}
		}
		private function refeashQualityView():void
		{
			if(_currentShowMode<1)
				_currentShowMode = 1;
			else if(_currentShowMode> FightsoulData.maxMode)
				_currentShowMode = FightsoulData.maxMode;
			
			_skin.btn_prev.visible = _currentShowMode >1;
			_skin.btn_next.visible = _currentShowMode < FightsoulData.maxMode;
			
			var cshowshet:Q_fightsoul = FightsoulData.getInfoByMode(_currentShowMode);
			if(cshowshet.q_level>fightSoulInfo.level)
			{
				_skin.btn_huanhua.visible = false;
				_skin.ui_huanhua.visible = false;
				_skin.grp_dengji.visible = true;
				_skin.uiLv.visible = true;
				_skin.lb_time.visible = true;
				_skin.Num_dengji.visible = true;
				_skin.Num_dengji.label = cshowshet.q_level.toString();
				_skin.lb_time.text = cshowshet.q_doc;
			}else if(cshowshet.q_level==fightSoulInfo.curModelLv){
				_skin.btn_huanhua.visible = false;
				_skin.ui_huanhua.visible = true;
				_skin.grp_dengji.visible = false;
				_skin.uiLv.visible = false;
				_skin.lb_time.visible = false;
				_skin.Num_dengji.visible = false;
			}else{
				_skin.btn_huanhua.visible = true;
				_skin.ui_huanhua.visible = false;
				_skin.grp_dengji.visible = false;
				_skin.uiLv.visible = false;
				_skin.lb_time.visible = false;
				_skin.Num_dengji.visible = false;
			}
			_skin.zhanhunName.styleName = "ui/app/zhanhun/modename/"+cshowshet.q_mode+".png";
			addFightSoul(cshowshet.q_mode);
		}
		private var _level:int;
		private function addFightSoul(level:int):void
		{
			if(_level==level)
				return ;
			_level = level;
			var modeinfo:Q_fightsoul_mode = FightsoulModeData.getModeInfoById(_level);
			this._showAvatarData.avatarInfo.setBodyResID("pc/fightsoul/"+modeinfo.q_mode,null);
			this._showAvatarData.avatarInfo.bodyEffectID =modeinfo.q_effect;
			this._showAvatarData.avatarInfo.bodyEffectID2 =modeinfo.q_effect1;
			_fightsoul.setRoleData(this._showAvatarData);
			
			var scale:Number = modeinfo.q_panleScale/100;
			this._fightsoul.curRole.setScale(scale);
			this._fightsoul.y = modeinfo.q_panleY;
		}
		private function get  currentMode():Q_fightsoul
		{
			return FightSoulManager.instance().currentLeveldata;
		}
		
		private  function get fightSoulInfo(): FightSoulInfo{
			return FightSoulManager.instance().fightSoulInfo;
		}
		override public function hide():void
		{
			_skin.btn_prev.removeEventListener(Event.TRIGGERED,triggeredHander);
			_skin.btn_next.removeEventListener(Event.TRIGGERED,triggeredHander);
			_skin.btn_huanhua.removeEventListener(Event.TRIGGERED,huanhuaTriggeredHandler);
			_skin.btn_up.removeEventListener(Event.TRIGGERED,uptriggeredHandler);
			_skin.btn_up.removeEventListener(FeathersEventType.STATE_CHANGE,buttonTouchHandler);
			EventManager.removeEvent(FightSoulManager.FightSoul_Exp,refeahExp);
			EventManager.removeEvent(FightSoulManager.FightSoul_Level,refeahLevel);
			EventManager.removeEvent(FightSoulManager.FightSoul_ModeLevel,refeashQualityView);
			EventManager.removeEvent(FightSoulManager.FightSoul_Vitality,refeashVitality);
			EventManager.removeEvent(FightSoulManager.FightSoul_GetReward,refeashRewards);
			EventManager.removeEvent(FightSoulManager.FightSoul_TypeValue,listrefeash);
			super.hide();
		}
	}
}