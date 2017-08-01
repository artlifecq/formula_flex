package com.rpgGame.appModule.xinfa
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.CheatsSender;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.appModule.jingmai.sub.TweenScaleScrollUitlExt;
	import com.rpgGame.appModule.xinfa.sub.CheatsIcon;
	import com.rpgGame.appModule.xinfa.sub.CheatsMap;
	import com.rpgGame.appModule.xinfa.sub.XinFaBtnExt;
	import com.rpgGame.core.events.CheatsEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.IRewardCheck;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.ui.tip.RewardMarkTip;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.clientConfig.Q_cheats;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.Label;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.Xinfa.Chunyang_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Jiuxiao_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Longxiang_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Mingxin_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Qiankun_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Shijue_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Wanji_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Xiaoyao_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Xijing_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.Zhenyuan_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.xinfa_Skin;
	
	import starling.display.Sprite;

	public class XinFaView
	{
		private var _skin:xinfa_Skin;
		private var _skinArr:Array;
		private var tweenScroll:TweenScaleScrollUitlExt;
		private var sbtnArr:Array=[];
		private var _mapsHash:HashMap;
		private var _curMap:CheatsMap;
		
		private var _extendsLabArr:Array=[];
		private var _effectCheatsGridArr:Array;
		private var _skillIcon:BgIcon;
		private var _btnStateLabelHash:HashMap=new HashMap();
		private var _rtnIds:Array;
		
		private var _attrLabHash:HashMap;
		private var _curBtn:XinFaBtnExt;
		private var _attrView:XinFaAttrViewPanelExt;
		private var _effect3dCon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		//在封装一层，策划蛋疼
		private var _btnCons:Array;
		public function XinFaView(s:xinfa_Skin)
		{
			
			_skin=s;
			_skin.uiMapCon.touchGroup=false;
			_skinArr=[new Longxiang_Skin(),new Shijue_Skin(),new Xiaoyao_Skin,new Qiankun_Skin(),new Xijing_Skin(),new Chunyang_Skin(),new Zhenyuan_Skin(),new Jiuxiao_Skin(),new Mingxin_Skin(),new Wanji_Skin()];
			//tweenScroll=new TweenScaleScrollUitlExt(con,
			
			var cheatsArr:Array=CheatsCfg.dataArr;
			cheatsArr.sortOn("q_id",Array.NUMERIC);
			
			var len:int=cheatsArr.length;
			XinFaBtnExt.clickCall=onTriggered;
			_btnCons=[];
			for (var i:int = 0; i < len; i++) 
			{
				var sp:Sprite=new Sprite();
				var sbtn:XinFaBtnExt=new XinFaBtnExt(cheatsArr[i]);
				sbtnArr[i]=sbtn;
				sp.addChild(sbtn);
				sp.x=0;
				sp.y=75*i;
				_btnCons.push(sp);
				_skin.btnGroup.addChild(sp);
			}
			_effectCheatsGridArr=[new CheatsIcon(_skin.grid_1),new CheatsIcon(_skin.grid_2),new CheatsIcon(_skin.grid_3)];
			_skillIcon=new BgIcon(IcoSizeEnum.ICON_36);
			_skin.grid_item_1.parent.addChild(_skillIcon);
			_skillIcon.bindBg(_skin.grid_item_1);
			
			initData();
		
			
			TipTargetManager.show(_skin.btn_shuoming,TargetTipsMaker.makeTips(TipType.CHEATS_INTRADUCTION_TIP,null));
			_skin.btn_jihuo.addEventListener(Event.TRIGGERED,onStartLevelUp);
			_attrLabHash=new HashMap();
			_attrLabHash.put(CharAttributeType.SHENFA,_skin.lbSF);
			_attrLabHash.put(CharAttributeType.MAX_HP,_skin.lbQX);
			_attrLabHash.put(CharAttributeType.MAGICAL_ATTACK,_skin.lbGJ);
			_attrLabHash.put(CharAttributeType.MISS,_skin.lbSB);
			_attrLabHash.put(CharAttributeType.HIT,_skin.lbMZ);
			_attrLabHash.put(CharAttributeType.CRIT_PER,_skin.lbBJ);
			_attrLabHash.put(CharAttributeType.DEFENSE_PER,_skin.lbFY);
			_attrLabHash.put(CharAttributeType.CRIT,_skin.lbBS);

			_attrView=new XinFaAttrViewPanelExt();
			_attrView.x=955;
			_attrView.y=42;
			_skin.container.addChild(_attrView);
			this._skin.btnOpen.addEventListener(Event.TRIGGERED,showAttr);
			this._skin.btnClose.addEventListener(Event.TRIGGERED,hideAttr);
			_attrView._skin.btnClose.addEventListener(Event.TRIGGERED,onCloseAttr);
			showAttr(null);
			
			var rew:RewardMarkTip=new RewardMarkTip(_skin.btn_jihuo,110);
			rew.hasReward=true;
		}
		
		
		private function onCloseAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			//this._skin.chk_shuxing.isSelected=false;
			hideAttr(null);
		}
		private function showAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			_attrView.visible=true;
			_skin.btnOpen.visible=false;
			_skin.btnClose.visible=true;
		}
		private function hideAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			_attrView.visible=false;
			_skin.btnOpen.visible=true;
			_skin.btnClose.visible=false;
		}
		private function onStartLevelUp(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_curMap) 
			{
				if (Mgr.cheatsMgr.getCanActive(_curMap.cheatsVo.cheatsConfig.q_id)) 
				{
					CheatsSender.reqActiveCheats(_curMap.cheatsVo.cheatsConfig.q_id);
				}
			}
		}		

	
		
		protected function onGetAllData(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			
			var hash:HashMap=Mgr.cheatsMgr.cheatsHash;
			var keys:Array=hash.keys();
			var tmp:Array;
			var map:CheatsMap;
			for each (var key:int in keys) 
			{
				tmp=hash.getValue(key);
				map=_mapsHash.getValue(key);
				if (tmp&&map) 
				{
					map.updataServerData(tmp);
				}
			}
			
		}
		
		protected function onCheatsNodeDataChange(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			//先更新单个数据在更新关联数据
			var data:CheatsNodeVo=event.data;
			if (data) 
			{
				var map:CheatsMap=_mapsHash.getValue(data.cheatsId);
				if (map) 
				{
					map.updataServerData([data],true);
				}
				_mapsHash.eachValue(function(map:CheatsMap):void{
					map.checkCareDataUpdate(data);
				});
				//更新属性
				if (data.cheatsId==_curMap.cheatsVo.cheatsConfig.q_id) 
				{
					updateMapAttr();
				}
				Mgr.cheatsMgr.dispatchEvent(new CheatsEvent(CheatsEvent.CHEATS_NODE_TIP_CHANGE,data));
				_skin.NumZhanli.label=Mgr.cheatsMgr.getFightPower()+"";
			}
		}
		
		private function onTriggered(btn:XinFaBtnExt):void
		{
			// TODO Auto Generated method stub
		
			if (_curBtn) 
			{
				_curBtn.isSelected=false;
			}
			_curBtn=btn;
			if (btn) 
			{
				_curBtn.isSelected=true;
				showCurrentMap(btn.userData as CheatsMap);
			}
		}
		private function showCurrentMap(map:CheatsMap,bForce:Boolean=false):void
		{
			if (map==_curMap&&!bForce) 
			{
				return;
			}
			if (_curMap) 
			{
				MCUtil.removeSelf(_curMap);
				//_curMap.hideEffect();
			}
			_curMap=map;
			_curMap.resumeEffect();
			_curMap.x=_curMap.offsetX;
			_curMap.y=_curMap.offsetY;
			_skin.uiMapCon.addChild(_curMap);
			
			var data:CheatsVo=map.cheatsVo;
			_skin.mc_Level.visible=data.level>0;
			//_skin.imgLevelBg.visible=data.level>0;
			_skin.uiName.styleName="ui/app/beibao/xinfa/mingzi2/"+data.cheatsConfig.q_id+".png";
			if (data.level>0) 
			{
				_skin.mc_Level.gotoAndStop(data.level+"");
				_skin.lbJihuo.visible=false;
				//_skin.grpZhanli.visible=true;
				
			}
			else
			{
				_skin.lbJihuo.visible=true;
				//_skin.grpZhanli.visible=false;
			}
			var buffObj:Array=_curMap.cheatsVo.getCurBuff();
			
			if (buffObj!=null) 
			{
//				TipTargetManager.remove(_skin.grid_item_1);
//				TipTargetManager.show( _skin.grid_item_1, TargetTipsMaker.makeTips( TipType.SPELL_TIP,data.cheatsConfig.q_skill+"_"+Math.max(1,data.level)));
				var buff:Q_buff=BuffStateDataManager.getData(buffObj[0]);
				_skillIcon.setIconResName(ClientConfig.getBuffIcon(buff.q_icon,IcoSizeEnum.ICON_36));
				_skin.lab_Skill.text=LanguageConfig.replaceStr(buff.q_description,buffObj[1]);
				_skin.imgSkill.styleName="ui/app/beibao/xinfa/buff/"+buff.q_icon+".png"
			}
			
			updateActiveContent();
			updateMapAttr();
			updateEffectCheats();
		}
		private function updateMapAttr():void
		{
			
			for each (var lab2:Label in _extendsLabArr) 
			{
				MCUtil.removeSelf(lab2);
			}
			var color:uint=GameColorUtil.COLOR_GRAY;
			if (_curMap.cheatsVo.level>0) 
			{
				color=GameColorUtil.COLOR_NORMAL;
			}
			if (_curMap.cheatsVo.level==0) 
			{
				setAttr(_curMap.cheatsVo.getBaseAttr());
				//_attrLabArr=_attrLabArr.concat(AttrUtil.showAttr(_curMap.cheatsVo.getBaseAttr(),this._skin.btn_next.parent,_skin.lab_shuxing,1,new Point(_skin.lab_shuxing.x,_skin.lab_shuxing.y),0,_skin.lab_shuxing.height+2,":",_attrLabArr));
			}
			else
			{
				setAttr(_curMap.cheatsVo.totalValue);
				//_attrLabArr=_attrLabArr.concat(AttrUtil.showAttr(_curMap.cheatsVo.totalValue,this._skin.btn_next.parent,_skin.lab_shuxing,1,new Point(_skin.lab_shuxing.x,_skin.lab_shuxing.y),0,_skin.lab_shuxing.height+2,":",_attrLabArr));
			}
			//名字
			//_skin.gExtends.visible=_curMap.cheatsVo.extendAttr.size()>0;
			//_extendsLabArr=_extendsLabArr.concat(AttrUtil.showAttr(_curMap.cheatsVo.extendAttr,this._skin.btn_next.parent,_skin.lab_jiangli,1,new Point(_skin.lab_jiangli.x,_skin.lab_jiangli.y),0,_skin.lab_jiangli.height+2,":",_extendsLabArr));
		}
		
		private function setAttr(hash:HashMap):void
		{
			
			var keys:Array=_attrLabHash.keys();
			var lab:Label;
			for each (var key:int in keys) 
			{
				lab=_attrLabHash.getValue(key);
				if (hash.containsKey(key)) 
				{
					lab.text=hash.getValue(key)+"";
				}
				else
				{
					lab.text="0";
				}
			}
			
		}
		private function updateEffectCheats():void
		{
			for each (var ico:CheatsIcon in _effectCheatsGridArr) 
			{
				ico.clear();
			}
		
			var arr:Array=_curMap.cheatsVo.careCheats.keys();
			var cheId:int;
			for (var i:int = 0; i < arr.length; i++) 
			{
				cheId=arr[i];
				(_effectCheatsGridArr[i] as CheatsIcon).setCheatsData(Mgr.cheatsMgr.getCheatVo(cheId),_curMap.cheatsVo.careCheats.getValue(cheId));
			}
			
		}
		private function updateActiveContent():void
		{
			var data:CheatsVo=_curMap.cheatsVo;
			_skin.lbCailiao.visible=false;
			_skin.btn_jihuo.visible=false;
			_skin.btn_hecheng.visible=data.level>0;
			if (data.level>0) 
			{
				return;
			}
			
			var canAtive:Boolean=Mgr.cheatsMgr.getCanActive(data.cheatsConfig.q_id);
			if (canAtive) 
			{
				_skin.btn_jihuo.visible=true;
			}
		
			var qChe:Q_cheats=data.cheatsConfig;
			
			if (_curMap.cheatsVo.needItemHash.size()!=0) 
			{
				_skin.lbCailiao.visible=true;
				//var str:String="收集@可激活心法";
				var str:String=NotifyCfgData.getNotifyTextByID(61004);
				var arr:Array=_curMap.cheatsVo.needItemHash.keys();
				if (arr&&arr.length>0) 
				{
					var len:int=arr.length;
					var itemMid:int;
					var itemNum:int;
					var backNum:int=0;
					var strArr:Array=[];
					for (var i:int = 0; i < len; i++) 
					{
						var color:uint=GameColorUtil.COLOR_GREEN;
						itemMid=arr[i];
						itemNum=_curMap.cheatsVo.needItemHash.getValue(itemMid);
						backNum=BackPackManager.instance.getItemCount(itemMid);
						if (itemNum>backNum)
						{
							color=GameColorUtil.COLOR_RED;
						}
						strArr.push(HtmlTextUtil.getTextColor(color,backNum+"/"+itemNum)+NotifyCfgData.getNotifyTextByID(61005)+ItemConfig.getItemNameWithQualityColor(itemMid));
					}
				}
				str=str.replace("@",strArr.join("、"));
				_skin.lbCailiao.htmlText=str;
			}	
		}
		private function checkReward(id:int):Boolean
		{
			var map:IRewardCheck=_mapsHash.getValue(id) as IRewardCheck;
			if (map) 
			{
				return map.hasReward();
			}
			return false;
		}
		private function initData():void
		{
			_effect3dCon=new Inter3DContainer();
			_skin.Bg.addChild(_effect3dCon);
			_effect3dCon.x=_skin.Bg.width/2;
			_effect3dCon.y=_skin.Bg.height/2;
			//选取等级为1的数据
			var hash:HashMap=Mgr.cheatsMgr.cheatsHash;
			var keys:Array=hash.keys();
			var len:int=keys.length;
			var tmp:CheatsMap;
			_mapsHash=new HashMap();
			var meridianType:int=0;
			for (var i:int = 0; i < len; i++) 
			{
				meridianType=keys[i];
				tmp=new CheatsMap(_skinArr[i],hash.getValue(meridianType),sbtnArr[i]);
				SkinUI.addNode(RTNodeID.XF,RTNodeID.XF+"_"+meridianType,_btnCons[i],200,checkReward,false,meridianType);
				tmp.pos=i;
				tmp.x=200;
				tmp.y=70;
				//_btnStateLabelHash.put(meridianType,_skin.btnGroup.skin.s
				_mapsHash.put(meridianType,tmp);
			}
			tweenScroll=new TweenScaleScrollUitlExt(_skin.btnGroup,_btnCons,_skin.btn_prev,_skin.btn_next,1,_skin.btnGroup.width,75*5,75,0.6/4,false);
			
			tweenScroll.setStep(5);
			_skin.mc_Level.gotoAndStop(0);
		
			this._skin.btn_hecheng.addEventListener(Event.TRIGGERED,onHeCheng);
		}
		
		
		
		private function clearEffect():void
		{
			// TODO Auto Generated method stub
			_mapsHash.eachValue(function(map:CheatsMap):void{
				map.hideEffect();
			});
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
		}
		
		
		private function onHeCheng(eve:Event):void
		{
			// TODO Auto Generated method stub
			//AppManager.showAppNoHide(AppConstant.EQUIP_PANL,{tab:EmFunctionID.EM_HECHENG});
			FunctionOpenManager.openAppPaneById(EmFunctionID.EM_HECHENG);
		}
		
	
		
		
		public function onShow():void
		{
			
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onZhenQiChange);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,onLevelChange);
			EventManager.addEvent(ItemEvent.ITEM_ADD,onAddItem);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onAddItem);
			Mgr.cheatsMgr.addEventListener(CheatsEvent.CHEATS_NODE_CHANGE,onCheatsNodeDataChange);
			Mgr.cheatsMgr.addEventListener(CheatsEvent.CHEATS_CHANGE,onCheatsChange);
			onZhenQiChange(CharAttributeType.RES_ZHENQI);
			
			if (_curMap==null) 
			{
				showCurrentMap((sbtnArr[0]).userData)
				_curBtn=sbtnArr[0];
				_curBtn.isSelected=true;
			}
			_effect3d=_effect3dCon.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINGMAI_STAR),0,0,0,null,addEft);
			_skin.NumZhanli.label=Mgr.cheatsMgr.getFightPower()+"";
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		
		private function onAddItem(itemInfo : ClientItemInfo):void
		{
			// TODO Auto Generated method stub
			if (itemInfo&&itemInfo.qItem) 
			{
				if (itemInfo.qItem.q_type==GoodsType.MERIDIANSTONE) 
				{
					checkForUpdateJX();
				}
				else
				{
					checkForActive();
				}
				//没激活是不是材料
				if (_curMap&&_curMap.cheatsVo.level==0) 
				{
					if (_curMap.cheatsVo.needItemHash.containsKey(itemInfo.qItem.q_id)) 
					{
						updateActiveContent();
					}
				}
			}
		}
		
		private function onLevelChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			//if (CharAttributeType.LV==type)
			{
				checkForUpdate();
			}
		}
		private function checkForUpdate():void
		{
			var keys:Array=_mapsHash.keys();
			var tmp:Array;
			var map:CheatsMap;
			for each (var key:int in keys) 
			{
				map=_mapsHash.getValue(key);
				if (map) 
				{
					map.checkForUpdate();
				}
			}
		}
		private function checkForUpdateJX():void
		{
			var keys:Array=_mapsHash.keys();
			var tmp:Array;
			var map:CheatsMap;
			for each (var key:int in keys) 
			{
				map=_mapsHash.getValue(key);
				if (map) 
				{
					map.checkForUpdateJX();
				}
			}
		}
		private function checkForActive():void
		{
			var keys:Array=_mapsHash.keys();
			var tmp:Array;
			var map:CheatsMap;
			for each (var key:int in keys) 
			{
				map=_mapsHash.getValue(key);
				if (map) 
				{
					map.updateBtnState();
				}
			}
		}
		private function onZhenQiChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.RES_ZHENQI==type) 
			{
				_skin.lb_zhenqi.text=MainRoleManager.actorInfo.curZhenqi.toString()+"/"+MainRoleManager.actorInfo.maxZhenqi;
				_skin.proZhenqi.maximum=MainRoleManager.actorInfo.maxZhenqi;
				_skin.proZhenqi.value=MainRoleManager.actorInfo.curZhenqi;
			}
			checkForUpdate();
		}
		public function onHide():void
		{
		
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onZhenQiChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,onLevelChange);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onAddItem);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onAddItem);
			Mgr.cheatsMgr.removeEventListener(CheatsEvent.CHEATS_NODE_CHANGE,onCheatsNodeDataChange);
			Mgr.cheatsMgr.removeEventListener(CheatsEvent.CHEATS_CHANGE,onCheatsChange);
			clearEffect();
		}
		
		private function onCheatsChange(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			var data:CheatsVo=event.data;
			if (data) 
			{
				//跟新图的数据
				var map:CheatsMap=_mapsHash.getValue(data.cheatsConfig.q_id);
				if (map) 
				{
					map.updatCheatsInfo(data);
				}
				//是否是当前显示心法
				if (_curMap==map) 
				{
					showCurrentMap(map,true);
				}
				_skin.NumZhanli.label=Mgr.cheatsMgr.getFightPower()+"";
				//更新总战力
			}
		}
		private function checkCare(data:CheatsNodeVo):void
		{
			_mapsHash.eachValue(function(map:CheatsMap):void
			{
				map.checkCareDataUpdate(data);
			});
		}
	}
}